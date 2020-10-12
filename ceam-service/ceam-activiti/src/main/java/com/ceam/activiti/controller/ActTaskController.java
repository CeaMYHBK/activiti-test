package com.ceam.activiti.controller;

import cn.hutool.core.util.StrUtil;
import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.domain.BizAudit;
import com.ceam.activiti.domain.BizBusiness;
import com.ceam.activiti.service.IBizAuditService;
import com.ceam.activiti.service.IBizBusinessService;
import com.ceam.activiti.vo.HiTaskVo;
import com.ceam.activiti.vo.RuTask;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.common.core.page.PageDomain;
import com.ceam.system.domain.SysUser;
import com.ceam.system.feign.RemoteUserService;
import com.google.common.collect.Maps;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 10:05
 */
@RestController
@RequestMapping("task")
public class ActTaskController extends BaseController {

    @Autowired
    private TaskService        taskService;

    @Autowired
    private RuntimeService     runtimeService;

    @Autowired
    private IBizAuditService    bizAuditService;

    @Autowired
    private IBizBusinessService businessService;

    @Autowired
    private RemoteUserService   remoteUserService;

    /**
     * 我的待办
     * @param ruTask
     * @param page
     * @return
     */
    @RequestMapping("ing")
    public R myTask(RuTask ruTask, PageDomain page)
    {
        // 声明任务视图集合，用于包装各个任务视图并且返回给前端
        List<RuTask> list = new ArrayList<>();
        Long userId = getCurrentUserId(); //该方法在BaseController定义
        // 根据userId获取待办任务查询实体
        TaskQuery query = taskService.createTaskQuery().taskCandidateOrAssigned(userId + "").orderByTaskCreateTime()
                .desc();
        if (StrUtil.isNotBlank(ruTask.getProcessDefKey()))
        {
            query.processDefinitionKey(ruTask.getProcessDefKey());
        }
        long count = query.count();
        int first = (page.getPageNum() - 1) * page.getPageSize();
        // 转换list集合
        List<Task> taskList = query.listPage(first, page.getPageSize());
        //  task taskList===[Task[id=20006, name=经理审批]]
        System.out.println(" task taskList===" + taskList);
        if (taskList.size() > 0)
        {
            //转换vo
            taskList.forEach(e -> {
                RuTask rt = new RuTask(e); //初始化视图任务对象，里面已经存在值了
                List<IdentityLink> identityLinks = runtimeService
                        .getIdentityLinksForProcessInstance(rt.getProcInstId());
                for (IdentityLink identityLink : identityLinks)
                {
                    // 关联发起人
                    if ("starter".equals(identityLink.getType()) && StrUtil.isNotBlank(identityLink.getUserId()))
                    {
                        rt.setApplyer(
                                remoteUserService.selectSysUserByUserId(Long.parseLong(identityLink.getUserId()))
                                        .getUserName());
                    }
                    // 关联业务key
                    ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(rt.getProcInstId())
                            .singleResult();
                    rt.setBusinessKey(pi.getBusinessKey());
                    rt.setProcessName(pi.getName());
                    rt.setProcessDefKey(pi.getProcessDefinitionKey());
                    rt.setProcessDefName(pi.getProcessDefinitionName());
                    list.add(rt);
                }
            });
        }
        HashMap<String, Object> map = Maps.newHashMap();
        map.put("rows", list);
        map.put("pageNum", page.getPageNum());
        map.put("total", count);
        return R.ok(map);
    }

    /**
     * task 已办
     *
     * @param hiTaskVo
     * @return
     */
    @RequestMapping(value = "done")
    public R done(HiTaskVo hiTaskVo)
    {
        startPage();
        hiTaskVo.setAuditorId(getCurrentUserId());
        hiTaskVo.setDeleteReason(ActivitiConstant.REASON_COMPLETED);
        return result(bizAuditService.getHistoryTaskList(hiTaskVo));
    }

    /**
     * task 流转历史 - 审批历史/情况
     *
     * @param hiTaskVo
     * @return
     */
    @RequestMapping(value = "flow")
    public R flow(HiTaskVo hiTaskVo)
    {
        startPage();
        System.out.println("task auditHistory lalalala");
        return result(bizAuditService.getHistoryTaskList(hiTaskVo));
    }

    /**
     * 审核 - 3个载体，参数载体、方法体载体，参数载体可为方法体载体设置数据
     * @param bizAudit
     * @return
     */
    @PostMapping("audit")
    public R audit(@RequestBody BizAudit bizAudit)
    {
        // 声明流程变量载体
        Map<String, Object> variables = Maps.newHashMap();
        // 获取前端审核数据，装载流程变量
        variables.put("result", bizAudit.getResult());
        // 审批
        taskService.complete(bizAudit.getTaskId(), variables);
        SysUser user = remoteUserService.selectSysUserByUserId(getCurrentUserId());
        // 往审核载体设置审核人的名字、用户ID，并记录到数据库表中
        bizAudit.setAuditor(user.getUserName() + "-" + user.getLoginName());
        bizAudit.setAuditorId(user.getUserId());
        //task bizAudit===BizAudit(id=null, taskId=20006, result=2, comment=通过1, procDefKey=leave, procName=简单请假, applyer=超级管理员, auditor=海啦-ceam, auditorId=2, createTime=null, procInstId=20001, businessKey=1, taskIds=null)
        System.out.println("task bizAudit===" + bizAudit);
        bizAuditService.insertBizAudit(bizAudit);
        // 声明业务载体，并设置业务Key、流程实例ID
        BizBusiness bizBusiness = new BizBusiness().setId(bizAudit.getBusinessKey())
                .setProcInstId(bizAudit.getProcInstId());
        //task bizBusiness===BizBusiness(id=1, title=null, userId=null, tableId=null, procDefId=null, procDefKey=null, procInstId=20001, procName=null, currentTask=null, applyer=null, status=null, result=null, applyTime=null, delFlag=null)
        System.out.println("task bizBusiness===" + bizBusiness);
        // 更新biz_business表中的业务申请数据，如：审核结果、审核人等等
        businessService.setAuditor(bizBusiness, bizAudit.getResult(), getCurrentUserId());
        return R.ok();
    }

    /**
     *
     * @param bizAudit
     * @return
     */
    @PostMapping("audit/batch")
    public R auditBatch(@RequestBody BizAudit bizAudit)
    {
        System.out.println("task batch lalalalala");
        SysUser user = remoteUserService.selectSysUserByUserId(getCurrentUserId());
        for (String taskId : bizAudit.getTaskIds()) {
            Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
            ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId())
                    .singleResult();
            BizBusiness bizBusiness = businessService.selectBizBusinessById(pi.getBusinessKey());
            if (bizBusiness != null)
            {
                Map<String, Object> variables = Maps.newHashMap();
                variables.put("result", bizAudit.getResult());
                // 审批
                taskService.complete(taskId, variables);
                // 构建插入审批记录
                BizAudit audit = new BizAudit().setTaskId(taskId).setResult(bizAudit.getResult())
                        .setProcName(bizBusiness.getProcName()).setProcDefKey(bizBusiness.getProcDefKey())
                        .setApplyer(bizBusiness.getApplyer()).setAuditor(user.getUserName() + "-" + user.getLoginName())
                        .setAuditorId(user.getUserId());
                bizAuditService.insertBizAudit(audit);
                businessService.setAuditor(bizBusiness, audit.getResult(), getCurrentUserId());
            }
        }
        return R.ok();
    }

    /**
     *  remove审批记录 逻辑删除
     */
    @PostMapping("remove")
    public R remove(String ids)
    {
        return toAjax(bizAuditService.deleteBizAuditLogic(ids));
    }
}
