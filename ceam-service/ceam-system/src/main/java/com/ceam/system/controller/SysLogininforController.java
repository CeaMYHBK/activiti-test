package com.ceam.system.controller;

import com.ceam.common.auth.annotation.HasPermissions;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.common.log.annotation.OperLog;
import com.ceam.common.log.enums.BusinessType;
import com.ceam.system.domain.SysLogininfor;
import com.ceam.system.service.ISysLogininforService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 系统访问记录 提供者
 */
@RestController
@RequestMapping("logininfor")
public class SysLogininforController extends BaseController
{
    @Autowired
    private ISysLogininforService sysLogininforService;

    /**
     * 查询系统访问记录列表
     */
    @GetMapping("list")
    public R list(SysLogininfor sysLogininfor)
    {
        startPage();
        return result(sysLogininforService.selectLogininforList(sysLogininfor));
    }

    /**
     * 新增保存系统访问记录
     */
    @PostMapping("save")
    public void addSave(@RequestBody SysLogininfor sysLogininfor)
    {
        sysLogininforService.insertLogininfor(sysLogininfor);
    }


    /**
     * 删除系统访问记录
     */
    @OperLog(title = "访问日志", businessType = BusinessType.DELETE)
    @HasPermissions("monitor:loginlog:remove")
    @PostMapping("remove")
    public R remove(String ids)
    {
        return toAjax(sysLogininforService.deleteLogininforByIds(ids));
    }

    @OperLog(title = "访问日志", businessType = BusinessType.CLEAN)
    @HasPermissions("monitor:loginlog:remove")
    @PostMapping("/clean")
    public R clean()
    {
        sysLogininforService.cleanLogininfor();
        return R.ok();
    }

}
