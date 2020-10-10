package com.ceam.system.feign;

import com.ceam.common.constant.ServiceNameConstants;
import com.ceam.system.domain.SysDept;
import com.ceam.system.feign.factory.RemoteDeptFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * 用户 Feign服务层
 */
@FeignClient(name = ServiceNameConstants.SYSTEM_SERVICE, fallbackFactory = RemoteDeptFallbackFactory.class)
public interface RemoteDeptService
{
    @GetMapping("dept/get/{deptId}")
    public SysDept selectSysDeptByDeptId(@PathVariable("deptId") long deptId);
}
