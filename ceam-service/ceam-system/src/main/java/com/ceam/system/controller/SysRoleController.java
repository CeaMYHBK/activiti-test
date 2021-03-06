package com.ceam.system.controller;

import com.ceam.common.auth.annotation.HasPermissions;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.ceam.common.log.annotation.OperLog;
import com.ceam.common.log.enums.BusinessType;
import com.ceam.system.domain.SysRole;
import com.ceam.system.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 角色 提供者
 */
@RestController
@RequestMapping("role")
public class SysRoleController extends BaseController
{
    @Autowired
    private ISysRoleService sysRoleService;

    /**
     * 查询角色
     */
    @GetMapping("get/{roleId}")
    public SysRole get(@PathVariable("roleId") Long roleId)
    {
        return sysRoleService.selectRoleById(roleId);
    }

    /**
     * 查询角色列表
     */
    @GetMapping("list")
    public R list(SysRole sysRole)
    {
        startPage();
        return result(sysRoleService.selectRoleList(sysRole));
    }

    @GetMapping("all")
    public R all()
    {
        return R.ok().put("rows", sysRoleService.selectRoleAll());
    }

    /**
     * 新增保存角色
     */
    @PostMapping("save")
    @OperLog(title = "角色管理", businessType = BusinessType.INSERT)
    public R addSave(@RequestBody SysRole sysRole)
    {
        return toAjax(sysRoleService.insertRole(sysRole));
    }

    /**
     * 修改保存角色
     */
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("update")
    public R editSave(@RequestBody SysRole sysRole)
    {
        return toAjax(sysRoleService.updateRole(sysRole));
    }

    /**
     * 修改保存角色
     */
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("status")
    public R status(@RequestBody SysRole sysRole)
    {
        return toAjax(sysRoleService.changeStatus(sysRole));
    }

    /**
     * 保存角色分配数据权限
     */
    @HasPermissions("system:role:edit")
    @OperLog(title = "角色管理", businessType = BusinessType.UPDATE)
    @PostMapping("/authDataScope")
    public R authDataScopeSave(@RequestBody SysRole role)
    {
        role.setUpdateBy(getLoginName());
        if (sysRoleService.authDataScope(role) > 0)
        {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除角色
     * @throws Exception
     */
    @OperLog(title = "角色管理", businessType = BusinessType.DELETE)
    @PostMapping("remove")
    public R remove(String ids) throws Exception
    {
        return toAjax(sysRoleService.deleteRoleByIds(ids));
    }
}
