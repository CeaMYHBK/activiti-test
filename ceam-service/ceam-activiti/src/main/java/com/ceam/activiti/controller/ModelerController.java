package com.ceam.activiti.controller;

import com.ceam.activiti.domain.ActReModel;
import com.ceam.activiti.service.IActReModelService;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.github.pagehelper.PageHelper;
import org.activiti.bpmn.converter.BpmnXMLConverter;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.editor.constants.ModelDataJsonConstants;
import org.activiti.editor.language.json.converter.BpmnJsonConverter;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;

/**
 * @author CeaM
 * @Description 模型管理
 * @date 2020/10/10 10:03
 */
@Controller
@RequestMapping("models")
public class ModelerController extends BaseController {

    @Autowired
    RepositoryService repositoryService;

    @Autowired
    ObjectMapper      objectMapper;

    @Autowired
    private IActReModelService modelService;

    /**
     * 新建一个空模型
     * @return
     * @throws UnsupportedEncodingException
     */
    @GetMapping("newModel")
    public Object newModel() throws UnsupportedEncodingException
    {
        // 初始化一个空模型
        Model model = repositoryService.newModel();
        // 设置一些默认信息
        String name = "new-process";
        String description = "";
        int revision = 1;
        String key = "process";
        ObjectNode modelNode = objectMapper.createObjectNode();
        modelNode.put(ModelDataJsonConstants.MODEL_NAME, name);
        modelNode.put(ModelDataJsonConstants.MODEL_DESCRIPTION, description);
        modelNode.put(ModelDataJsonConstants.MODEL_REVISION, revision);
        model.setName(name);
        model.setKey(key);
        model.setMetaInfo(modelNode.toString());
        repositoryService.saveModel(model);
        String id = model.getId();
        // 完善ModelEditorSource
        ObjectNode editorNode = objectMapper.createObjectNode();
        editorNode.put("id", "canvas");
        editorNode.put("resourceId", "canvas");
        ObjectNode stencilSetNode = objectMapper.createObjectNode();
        stencilSetNode.put("namespace", "http://b3mn.org/stencilset/bpmn2.0#");
        editorNode.replace("stencilset", stencilSetNode);
        repositoryService.addModelEditorSource(id, editorNode.toString().getBytes("utf-8"));
        System.out.println("newModel lalalalala");
        return "redirect:/modeler.html?modelId=" + id;
    }

    /**
     * 发布模型为流程定义
     * @param id
     * @return
     * @throws Exception
     */
    @PostMapping("deploy/{id}")
    @ResponseBody
    public R deploy(@PathVariable("id") String id) throws Exception
    {
        //获取模型
        Model modelData = repositoryService.getModel(id);
        //modelData====org.activiti.engine.impl.persistence.entity.ModelEntity@368041af
        System.out.println("modelData====" + modelData);
        byte[] bytes = repositoryService.getModelEditorSource(modelData.getId());
        //bytes===[B@3f9a9d8a
        System.out.println("bytes===" + bytes);
        if (bytes == null)
        {
            return R.error("模型数据为空，请先设计流程并成功保存，再进行发布。");
        }
        JsonNode modelNode = new ObjectMapper().readTree(bytes);
        //modelNode==={"resourceId":"5001","properties":{"process_id":"leave","name":"简单请假","documentation":"","process_author":"","process_version":"
        System.out.println("modelNode===" + modelNode);
        BpmnModel model = new BpmnJsonConverter().convertToBpmnModel(modelNode);
        //model===org.activiti.bpmn.model.BpmnModel@7d4e7bbc
        System.out.println("model===" + model);
        if (model.getProcesses().size() == 0)
        {
            return R.error("数据模型不符要求，请至少设计一条主线流程。");
        }
        byte[] bpmnBytes = new BpmnXMLConverter().convertToXML(model);
        // 发布流程
        String processName = modelData.getName() + ".bpmn20.xml";
        Deployment deployment = repositoryService.createDeployment().name(modelData.getName())
                .addString(processName, new String(bpmnBytes, "UTF-8")).deploy();
        //deployment===DeploymentEntity[id=12501, name=简单请假]
        System.out.println("deployment===" + deployment);
        //DeploymentId===12501
        System.out.println("DeploymentId===" + deployment.getId());
        modelData.setDeploymentId(deployment.getId());
        repositoryService.saveModel(modelData);
        return R.ok();
    }

    /**
     * 根据id获取模型
     * @param id
     * @return
     */
    @GetMapping("get/{id}")
    public R getModelById(@PathVariable("id") String id)
    {
        System.out.println("get/{id}===" + id);
        Model model = repositoryService.createModelQuery().modelId(id).singleResult();
        return R.data(model);
    }

    /**
     * 获取模型列表
     * @param actReModel
     * @return
     */
    @GetMapping("list")
    @ResponseBody
    public R getList(ActReModel actReModel)
    {
        startPage();
        PageHelper.orderBy("create_time_ desc");  //注意空格，否则报错
        System.out.println("list lalalalala");
        return result(modelService.selectActReModelList(actReModel));
    }

    /**
     * 删除模型
     * @param ids
     * @return
     */
    @PostMapping("remove")
    @ResponseBody
    public R delete(String ids)
    {
        System.out.println("remove ids===" + ids);//10001、2501、15001
        String[] idsArr = ids.split(",");
        for (String id : idsArr) {
            repositoryService.deleteModel(id);
        }
        System.out.println("remove lalalalala");
        return R.ok();
    }
}
