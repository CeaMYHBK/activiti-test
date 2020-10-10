package com.ceam.activiti.controller;

import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.service.IBizNodeService;
import com.ceam.activiti.vo.ProcessNodeVo;
import com.ceam.common.core.controller.BaseController;
import com.ceam.common.core.domain.R;
import org.activiti.bpmn.model.*;
import org.activiti.engine.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author CeaM
 * @Description 节点配置
 * @date 2020/10/10 14:48
 */
@RestController
@RequestMapping("node")
public class BizNodeController extends BaseController {

    @Autowired
    private RepositoryService repositoryService;

    @Autowired
    private IBizNodeService bizNodeService;

    /**
     * 获取节点列表
     *
     * @param proDefId
     * @return
     */
    @GetMapping("list/{proDefId}")
    public R list(@PathVariable String proDefId)
    {
        List<ProcessNodeVo> list = new ArrayList<>();
        BpmnModel model = repositoryService.getBpmnModel(proDefId);
        if (model != null)
        {
            Collection<FlowElement> flowElements = model.getMainProcess().getFlowElements();
            System.out.println("flowElements===" + flowElements);
            for (FlowElement element : flowElements) {
                ProcessNodeVo nodeVo = new ProcessNodeVo();
                nodeVo.setNodeId(element.getId());
                nodeVo.setName(element.getName());
                if (element instanceof StartEvent)
                {
                    // 开始节点
                    nodeVo.setType(ActivitiConstant.NODE_TYPE_START);
                }
                else if (element instanceof UserTask)
                {
                    // 用户任务
                    nodeVo.setType(ActivitiConstant.NODE_TYPE_TASK);
                }
                else if (element instanceof EndEvent)
                {
                    // 结束
                    nodeVo.setType(ActivitiConstant.NODE_TYPE_END);
                }
                else
                {
                    // 排除其他连线或节点
                    continue;
                }
                list.add(nodeVo);
            }
        }
        System.out.println("Node list lalalalala");
        return result(list);
    }

    /**
     * 获取节点属性
     *
     * @param nodeId
     * @return
     */
    @GetMapping("get/{nodeId}")
    public R get(@PathVariable String nodeId)
    {
        //nodeId===sid-9303BF19-09A3-4A06-922E-AD606B184621
        System.out.println("nodeId===" + nodeId);
        //这里可以由spring来管理的
        ProcessNodeVo nodeVo = new ProcessNodeVo();
        nodeVo.setNodeId(nodeId);
        // 设置关联角色，用户，负责人
        nodeVo = bizNodeService.setAuditors(nodeVo);
        //nodeVo===ProcessNodeVo(nodeId=sid-9303BF19-09A3-4A06-922E-AD606B184621, name=null, type=null, roleIds=[], userIds=[], deptIds=[], deptHeader=false)
        System.out.println("nodeVo===" + nodeVo);
        return R.data(nodeVo);
    }

    /**
     * 修改节点属性
     *
     * @param node
     * @return
     */
    @PostMapping("update")
    public R update(@RequestBody ProcessNodeVo node)
    {
        //update node===ProcessNodeVo(nodeId=sid-9303BF19-09A3-4A06-922E-AD606B184621, name=null, type=null, roleIds=[], userIds=[2], deptIds=[], deptHeader=false)
        System.out.println("update node===" + node);
        bizNodeService.updateBizNode(node);
        return R.ok();
    }
}
