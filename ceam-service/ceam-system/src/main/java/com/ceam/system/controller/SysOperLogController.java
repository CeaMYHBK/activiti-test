package com.ceam.system.controller;

import com.ceam.common.auth.annotation.HasPermissions;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.common.log.annotation.OperLog;
import com.ceam.common.log.enums.BusinessType;
import com.ceam.common.utils.poi.ExcelUtil;
import com.ceam.system.domain.SysOperLog;
import com.ceam.system.service.ISysOperLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 操作日志记录 提供者
 */
@RestController
@RequestMapping("operLog")
public class SysOperLogController extends BaseController
{
    @Autowired
    private ISysOperLogService sysOperLogService;

    /**
     * 查询操作日志记录
     */
    @GetMapping("get/{operId}")
    public SysOperLog get(@PathVariable("operId") Long operId)
    {
        return sysOperLogService.selectOperLogById(operId);
    }

    /**
     * 查询操作日志记录列表
     */
    @HasPermissions("monitor:operlog:list")
    @RequestMapping("list")
    public R list(SysOperLog sysOperLog)
    {
        startPage();
        return result(sysOperLogService.selectOperLogList(sysOperLog));
    }

    @OperLog(title = "操作日志", businessType = BusinessType.EXPORT)
    @HasPermissions("monitor:operlog:export")
    @PostMapping("/export")
    public R export(SysOperLog operLog)
    {
        List<SysOperLog> list = sysOperLogService.selectOperLogList(operLog);
        ExcelUtil<SysOperLog> util = new ExcelUtil<SysOperLog>(SysOperLog.class);
        return util.exportExcel(list, "操作日志");
    }

    /**
     * 新增保存操作日志记录
     */
    @PostMapping("save")
    public void addSave(@RequestBody SysOperLog sysOperLog)
    {
        sysOperLogService.insertOperlog(sysOperLog);
    }

    /**
     * 删除操作日志记录
     */
    @HasPermissions("monitor:operlog:remove")
    @PostMapping("remove")
    public R remove(String ids)
    {
        return toAjax(sysOperLogService.deleteOperLogByIds(ids));
    }

    @OperLog(title = "操作日志", businessType = BusinessType.CLEAN)
    @HasPermissions("monitor:operlog:remove")
    @PostMapping("/clean")
    public R clean()
    {
        sysOperLogService.cleanOperLog();
        return R.ok();
    }
}
