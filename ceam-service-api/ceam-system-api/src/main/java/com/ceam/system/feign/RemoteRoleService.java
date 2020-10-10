package com.ceam.system.feign;

import com.ceam.common.constant.ServiceNameConstants;
import com.ceam.system.domain.SysRole;
import com.ceam.system.feign.factory.RemoteRoleFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 角色 Feign服务层
 */
@FeignClient(name = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteRoleFallbackFactory.class)
public interface RemoteRoleService
{
    @GetMapping("role/get/{roleId}")
    public SysRole selectSysRoleByRoleId(@PathVariable("roleId") long roleId);
}
