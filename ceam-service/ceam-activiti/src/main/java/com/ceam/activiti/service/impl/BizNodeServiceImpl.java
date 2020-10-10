package com.ceam.activiti.service.impl;

import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.domain.BizNode;
import com.ceam.activiti.mapper.BizNodeMapper;
import com.ceam.activiti.service.IBizNodeService;
import com.ceam.activiti.vo.ProcessNodeVo;
import com.ceam.system.feign.RemoteDeptService;
import com.ceam.system.feign.RemoteUserService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author CeaM
 * @Description 节点Service业务层实现
 * @date 2020/10/10 14:32
 */
@Service
public class BizNodeServiceImpl implements IBizNodeService {

    @Autowired
    private BizNodeMapper     bizNodeMapper;

    @Autowired
    private RemoteUserService remoteUserService;

    @Autowired
    private RemoteDeptService remoteDeptService;

    /**
     * 查询节点
     *
     * @param id 节点ID
     * @return 节点
     */
    @Override
    public BizNode selectBizNodeById(Long id)
    {
        return bizNodeMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询节点列表
     *
     * @param bizNode 节点
     * @return 节点
     */
    @Override
    public List<BizNode> selectBizNodeList(BizNode bizNode)
    {
        return bizNodeMapper.select(bizNode);
    }

    /**
     * 新增节点
     *
     * @param bizNode 节点
     * @return 结果
     */
    @Override
    public int insertBizNode(BizNode bizNode)
    {
        return bizNodeMapper.insertSelective(bizNode);
    }

    /**
     * 获取节点属性时被调用
     * 查询并设置角色、用户、部门
     * @param node
     * @return
     */
    @Override
    public ProcessNodeVo setAuditors(ProcessNodeVo node)
    {
        // 根据节点ID上面查询节点列表方法selectBizNodeList(BizNode bizNode)从数据库获取节点集合
        List<BizNode> bizNodes = selectBizNodeList(new BizNode().setNodeId(node.getNodeId()));
        // 声明角色、用户、部门Id集合
        ArrayList<Long> roleIds = Lists.newArrayList();
        ArrayList<Long> userIds = Lists.newArrayList();
        ArrayList<Long> deptIds = Lists.newArrayList();
        for (BizNode bizNode : bizNodes) {
            // 设置关联角色
            if (bizNode.getType().equals(ActivitiConstant.NODE_ROLE))
            {
                // 添加取出的角色ID
                roleIds.add(bizNode.getAuditor());
            }
            // 设置关联部门
            else if (bizNode.getType().equals(ActivitiConstant.NODE_DEPARTMENT))
            {
                deptIds.add(bizNode.getAuditor());
            }
            // 设置关联用户
            else if (bizNode.getType().equals(ActivitiConstant.NODE_USER))
            {
                userIds.add(bizNode.getAuditor());
            }
            else if (bizNode.getType().equals(ActivitiConstant.NODE_DEP_HEADER))
            {
                // 是否设置操作人负责人
                node.setDeptHeader(true);
            }
        }
        // 设置关联角色
        node.setRoleIds(roleIds);
        // 设置关联部门
        node.setDeptIds(deptIds);
        // 设置关联用户
        node.setUserIds(userIds);
        return node;
    }

    @Override
    public int updateBizNode(ProcessNodeVo node)
    {
        // 删除所有节点信息, 可能这是可以用spring来管理的
        bizNodeMapper.delete(new BizNode().setNodeId(node.getNodeId()));
        ArrayList<BizNode> bizNodes = Lists.newArrayList();
        // 设置角色
        List<Long> roleIds = node.getRoleIds();
        if (roleIds != null && roleIds.size() > 0)
        {
            for (Long roleId : roleIds) {
                // 更新数据是要有ID的，这里设置节点ID、类型、审核人
                bizNodes.add(new BizNode().setNodeId(node.getNodeId()).setType(ActivitiConstant.NODE_ROLE)
                        .setAuditor(roleId));
            }
        }
        // 设置部门
        List<Long> deptIds = node.getDeptIds();
        if (deptIds != null && deptIds.size() > 0)
        {
            for (Long deptId : deptIds) {
                bizNodes.add(new BizNode().setNodeId(node.getNodeId()).setType(ActivitiConstant.NODE_DEPARTMENT)
                .setAuditor(deptId));
            }
        }
        // 设置用户
        List<Long> userIds = node.getUserIds();
        if (userIds != null && userIds.size() > 0)
        {
            for (Long userId : userIds) {
                bizNodes.add(new BizNode().setNodeId(node.getNodeId()).setType(ActivitiConstant.NODE_USER)
                .setAuditor(userId));
            }
        }
        // 设置所属部门负责人
        if (node.getDeptHeader() != null && node.getDeptHeader())
        {
            bizNodes.add(new BizNode().setNodeId(node.getNodeId()).setType(ActivitiConstant.NODE_DEP_HEADER));
        }
        return bizNodes.isEmpty() ? 0 : bizNodeMapper.insertList(bizNodes);
    }

    @Override
    public Set<String> getAuditors(String nodeId, long userId)
    {
        // TODO 优化查询次数可以将同类型审核人一次性查询得到

        return null;
    }
}
