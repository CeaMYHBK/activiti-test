package com.ceam.activiti.controller;

import com.ceam.activiti.domain.BizBusiness;
import com.ceam.activiti.service.IBizBusinessService;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description: 流程业务 - 我的申请模块
 * @Author: CeaM
 * @Date: 2020/10/11 11:07
 */
@RestController
@RequestMapping("business")
public class BizBusinessController extends BaseController {
    @Autowired
    private IBizBusinessService bizBusinessService;

    /**
     * 根据ID查看详情
     * 查询流程业务
     */
    @GetMapping("get/{id}")
    public BizBusiness get(@PathVariable("id") String id)
    {
        return bizBusinessService.selectBizBusinessById(id);
    }

    /**
     * 我的申请列表
     * 查询流程业务列表
     */
    @GetMapping("list/my")
    public R list(BizBusiness bizBusiness)
    {
        startPage(); //分页
        bizBusiness.setUserId(getCurrentUserId()); //设置当前用户ID
        bizBusiness.setDelFlag(false); //设置删除标记为未删除的
        System.out.println("business list/my lalalallala");
        return result(bizBusinessService.selectBizBusinessList(bizBusiness));
    }

    /**
     * 新增保存流程业务
     */
    @PostMapping("save")
    public R addSave(@RequestBody BizBusiness bizBusiness)
    {
        bizBusiness.setUserId(getCurrentUserId()); //插入当前用户ID
        return toAjax(bizBusinessService.insertBizBusiness(bizBusiness)); //插入新的申请返回结果
    }

    /**
     * 修改保存流程业务
     */
    @PostMapping("update")
    public R editSave(@RequestBody BizBusiness bizBusiness)
    {
        return toAjax(bizBusinessService.updateBizBusiness(bizBusiness));
    }

    /**
     * 删除流程业务
     */
    @PostMapping("remove")
    public R remove(String ids)
    {
        return toAjax(bizBusinessService.deleteBizBusinessLogic(ids));
    }
}
