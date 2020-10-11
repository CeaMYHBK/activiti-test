package com.ceam.activiti.service.impl;

import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.domain.BizBusiness;
import com.ceam.activiti.mapper.BizBusinessMapper;
import com.ceam.activiti.service.IBizBusinessService;
import com.ceam.activiti.service.IBizNodeService;
import com.google.common.collect.Lists;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Description:
 * @Author: CeaM
 * @Date: 2020/10/11 10:03
 */
@Service
public class BizBusinessServiceImpl implements IBizBusinessService {

    @Autowired
    private BizBusinessMapper businessMapper;

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private IdentityService identityService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private IBizNodeService bizNodeService;

    /**
     * 查询流程业务
     *
     * @param id 流程业务ID
     * @return 流程业务
     */
    @Override
    public BizBusiness selectBizBusinessById(String id)
    {
        return businessMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询流程业务列表
     *
     * @param bizBusiness 流程业务
     * @return 流程业务
     */
    @Override
    public List<BizBusiness> selectBizBusinessList(BizBusiness bizBusiness)
    {
        return businessMapper.select(bizBusiness);
    }

    /**
     * 新增流程业务
     *
     * @param bizBusiness 流程业务
     * @return 结果
     */
    @Override
    public int insertBizBusiness(BizBusiness bizBusiness)
    {
        return businessMapper.insertSelective(bizBusiness);
    }

    /**
     * 修改流程业务
     *
     * @param bizBusiness 流程业务
     * @return 结果
     */
    @Override
    public int updateBizBusiness(BizBusiness bizBusiness)
    {
        return businessMapper.updateByPrimaryKeySelective(bizBusiness);
    }

    /**
     * 删除流程业务对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBizBusinessByIds(String ids)
    {
        return businessMapper.deleteByIds(ids);
    }

    /**
     * 删除流程业务信息
     *
     * @param id 流程业务ID
     * @return 结果
     */
    public int deleteBizBusinessById(Long id)
    {
        return businessMapper.deleteByPrimaryKey(id);
    }

    /* (non-Javadoc)
     * @see com.ceam.activiti.service.IBizBusinessService#deleteBizBusinessLogic(java.lang.String)
     */
    @Override
    public int deleteBizBusinessLogic(String ids)
    {
        Example example = new Example(BizBusiness.class);
        example.createCriteria().andIn("id", Lists.newArrayList(ids.split(",")));
        return businessMapper.updateByExampleSelective(new BizBusiness().setDelFlag(true), example);
    }

    @Override
    public void startProcess(BizBusiness business, Map<String, Object> variables) {
        // 启动流程用户
        identityService.setAuthenticatedUserId(business.getUserId().toString());
        // 启动流程、需传入流程ID、业务表ID变量、流程变量
        ProcessInstance pi = runtimeService.startProcessInstanceById(business.getProcDefId(),
                business.getId().toString(), variables);
        // 设置流程实例名称
        runtimeService.setProcessInstanceName(pi.getId(), business.getTitle());
        // bizBusiness接收pi的id、key，用于下面的taskService查询
        BizBusiness bizBusiness = new BizBusiness().setId(business.getId()).setProcInstId(pi.getId())
                .setProcDefKey(pi.getProcessDefinitionKey());
        // 假如开始就没有任务，那就认为是中止的流程，通常是不存在的
        setAuditor(bizBusiness, ActivitiConstant.RESULT_SUSPEND, business.getUserId());
    }

    /**
     * 在上面的startProcess()方法、审核业务方法末尾中被调用
     * @param business 业务对象，必须包含id,procInstId属性
     * @param result 审批结果
     * @param currentUserId 当前操作用户 可能是发起人或者任务处理人
     * @return
     */
    @Override
    public int setAuditor(BizBusiness business, int result, long currentUserId)
    {
        List<Task> tasks = taskService.createTaskQuery().processInstanceId(business.getProcInstId()).list();
        if (tasks != null && tasks.size() > 0)
        {
            Task task = tasks.get(0);
            Set<String> auditors = bizNodeService.getAuditors(task.getTaskDefinitionKey(), currentUserId);
            System.out.println("auditors===" + auditors);
            if (auditors != null && auditors.size() > 0)
            {
                // 添加审核候选人
                for (String auditor : auditors) {
                    taskService.addCandidateUser(task.getId(), auditor);
                }
                // 设置当前业务的名字
                business.setCurrentTask(task.getName());
            }
            else
            {
                runtimeService.deleteProcessInstance(task.getProcessInstanceId(),
                        ActivitiConstant.SUSPEND_PRE + "no auditor");
                // 设置当前业务 审批结束、状态为已中止、结果为中止
                business.setCurrentTask(ActivitiConstant.END_TASK_NAME).setStatus(ActivitiConstant.STATUS_SUSPEND)
                        .setResult(ActivitiConstant.RESULT_SUSPEND);
            }
        }
        else
        {
            // 任务结束，设置当前业务 审批结束、状态为处理结束、结果为
            business.setCurrentTask(ActivitiConstant.END_TASK_NAME).setStatus(ActivitiConstant.STATUS_FINISH)
                    .setResult(result);
        }
        //更新业务申请表信息
        return updateBizBusiness(business);
    }
}
