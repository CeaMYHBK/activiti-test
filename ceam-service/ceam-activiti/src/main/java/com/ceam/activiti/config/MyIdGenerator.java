package com.ceam.activiti.config;

import org.activiti.engine.impl.cfg.IdGenerator;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/10 10:40
 */
@Component
public class MyIdGenerator implements IdGenerator
{
    @Override
    public String getNextId()
    {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        return uuid;
    }
}
