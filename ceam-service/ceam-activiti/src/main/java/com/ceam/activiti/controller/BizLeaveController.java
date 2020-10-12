package com.ceam.activiti.controller;

import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.domain.BizBusiness;
import com.ceam.activiti.domain.BizLeave;
import com.ceam.activiti.service.IBizBusinessService;
import com.ceam.activiti.service.IBizLeaveService;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.system.domain.SysUser;
import com.ceam.system.feign.RemoteUserService;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 14:33
 */
@RestController
@RequestMapping("leave")
public class BizLeaveController extends BaseController
{
    @Autowired
    private IBizLeaveService leaveService;

    @Autowired
    private IBizBusinessService bizBusinessService;

    @Autowired
    private RemoteUserService remoteUserService;

    /**
     * 查询${tableComment}
     */
    @GetMapping("get/{id}")
    public BizLeave get(@PathVariable("id") String id)
    {
        return leaveService.selectBizLeaveById(id);
    }

    @GetMapping("biz/{businessKey}")
    public R biz(@PathVariable("businessKey") String businessKey)
    {
        BizBusiness business = bizBusinessService.selectBizBusinessById(businessKey);
        if (null != business)
        {
            BizLeave leave = leaveService.selectBizLeaveById(business.getTableId());
            return R.data(leave);
        }
        return R.error("no record");
    }

    /**
     * 查询请假列表
     */
    @GetMapping("list")
    public R list(BizLeave leave)
    {
        startPage();
        return result(leaveService.selectBizLeaveList(leave));
    }

    /**
     * 参数leave包含了“业务申请的信息”和“启动流程的变量”
     * 新增保存请假 -> 启动流程
     */
    @PostMapping("save")
    public R addSave(@RequestBody BizLeave leave)
    {
        // 数据库插入请假记录
        int index = leaveService.insertBizLeave(leave);
        if (index == 1)
        {
            // 声明业务载体，用于记录业务申请、启动流程的变量
            BizBusiness business = initBusiness(leave);
            //将数据插入到biz_business表中
            bizBusinessService.insertBizBusiness(business);
            //放入流程变量，键为"duration"，可作为复合判断条件，启动流程
            Map<String, Object> variables = Maps.newHashMap();
            // 这里可以设置各个负责人，key跟模型的代理变量一致
            // variables.put("pm", 1l);
            // variables.put("sup", 1l);
            // variables.put("gm", 1l);
            // variables.put("hr", 1l);
            variables.put("duration", leave.getDuration());
            //传入business，是因为里面含有如流程ID、用户ID等等
            bizBusinessService.startProcess(business, variables);
        }
        return toAjax(index);
    }

    /**
     *
     * @param leave
     * @return
     */
    private BizBusiness initBusiness(BizLeave leave)
    {
        // 声明业务载体，并往载体装载数据
        BizBusiness business = new BizBusiness();
        business.setTableId(leave.getId().toString());  //关联表单
        business.setProcDefId(leave.getProcDefId());    //插入流程ID
        business.setTitle(leave.getTitle());            //插入业务申请标题 -> 请假申请
        business.setProcName(leave.getProcName());      //插入流程名字
        long userId = getCurrentUserId();               //获取当前用户ID
        business.setUserId(userId);                     //插入用户ID
        // 声明用户载体
        SysUser user = remoteUserService.selectSysUserByUserId(userId);  //根据用户ID获取用户
        business.setApplyer(user.getUserName());                         //插入用户名
        business.setStatus(ActivitiConstant.STATUS_DEALING);             //状态处理中(因为这是启动流程时用的，故为处理中)
        business.setResult(ActivitiConstant.RESULT_DEALING);             //结果处理中
        business.setApplyTime(new Date());                               //插入创建时间
        // 返回业务载体
        return business;
    }

    /**
     * 修改保存请假
     */
    @PostMapping("update")
    public R editSave(@RequestBody BizLeave leave)
    {
        return toAjax(leaveService.updateBizLeave(leave));
    }

    /**
     * 删除
     */
    @PostMapping("remove")
    public R remove(String ids)
    {
        return toAjax(leaveService.deleteBizLeaveByIds(ids));
    }
}
