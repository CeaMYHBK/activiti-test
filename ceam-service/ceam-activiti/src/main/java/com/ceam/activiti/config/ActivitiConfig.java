package com.ceam.activiti.config;

import com.ceam.activiti.cover.ICustomProcessDiagramGenerator;
import org.activiti.engine.*;
import org.activiti.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.activiti.spring.SpringProcessEngineConfiguration;
import org.activiti.spring.boot.ProcessEngineConfigurationConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/10 10:35
 */
@Configuration
public class ActivitiConfig {

    @Autowired
    private MyIdGenerator idGenerator;

    @Autowired
    private ICustomProcessDiagramGenerator customProcessDiagramGenerator;

    // 流程配置
    @Bean
    public ProcessEngineConfigurationConfigurer processEngineConfigurationConfigurer()
    {
        ProcessEngineConfigurationConfigurer configurer = new ProcessEngineConfigurationConfigurer()
        {
            @Override
            public void configure(SpringProcessEngineConfiguration processEngineConfiguration)
            {
                //processEngineConfiguration.setIdGenerator(idGenerator);
                processEngineConfiguration.setActivityFontName("宋体");
                processEngineConfiguration.setAnnotationFontName("宋体");
                processEngineConfiguration.setLabelFontName("宋体");
                //自定义流程图画笔
                processEngineConfiguration.setProcessDiagramGenerator(customProcessDiagramGenerator);
            }
        };
        return configurer;
    }

    // 流程引擎，与spring整合使用factoryBean
    @Bean
    public ProcessEngineFactoryBean processEngine(ProcessEngineConfiguration processEngineConfiguration)
    {
        ProcessEngineFactoryBean processEngineFactoryBean = new ProcessEngineFactoryBean();
        processEngineFactoryBean
                .setProcessEngineConfiguration((ProcessEngineConfigurationImpl) processEngineConfiguration);
        return processEngineFactoryBean;
    }

    // 八大接口
    @Bean
    public RepositoryService repositoryService(ProcessEngine processEngine)
    {
        return processEngine.getRepositoryService();
    }

    @Bean
    public RuntimeService runtimeService(ProcessEngine processEngine)
    {
        return processEngine.getRuntimeService();
    }

    @Bean
    public TaskService taskService(ProcessEngine processEngine)
    {
        return processEngine.getTaskService();
    }

    @Bean
    public HistoryService historyService(ProcessEngine processEngine)
    {
        return processEngine.getHistoryService();
    }

    @Bean
    public FormService formService(ProcessEngine processEngine)
    {
        return processEngine.getFormService();
    }

    @Bean
    public IdentityService identityService(ProcessEngine processEngine)
    {
        return processEngine.getIdentityService();
    }

    @Bean
    public ManagementService managementService(ProcessEngine processEngine)
    {
        return processEngine.getManagementService();
    }

    @Bean
    public DynamicBpmnService dynamicBpmnService(ProcessEngine processEngine)
    {
        return processEngine.getDynamicBpmnService();
    }
    // 八大接口 end
}
