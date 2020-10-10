package com.ceam.activiti;

import com.ceam.system.annotation.EnableCeaMFeignClients;
import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import tk.mybatis.spring.annotation.MapperScan;

/**
 * @Description:
 * @Author: CeaM
 * @Date: 2020/10/2 9:41
 */
@SpringBootApplication(scanBasePackages = "com.ceam", exclude = {SecurityAutoConfiguration.class})
@EnableDiscoveryClient
@MapperScan("com.ceam.*.mapper")
@EnableCeaMFeignClients
public class ActivitiApp {
    public static void main(String[] args) {
        SpringApplication.run(ActivitiApp.class, args);
    }
}
