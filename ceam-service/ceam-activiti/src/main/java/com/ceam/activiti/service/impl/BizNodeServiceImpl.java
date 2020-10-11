package com.ceam.activiti.service.impl;

import cn.hutool.core.util.StrUtil;
import com.ceam.activiti.consts.ActivitiConstant;
import com.ceam.activiti.domain.BizNode;
import com.ceam.activiti.mapper.BizNodeMapper;
import com.ceam.activiti.service.IBizNodeService;
import com.ceam.activiti.vo.ProcessNodeVo;
import com.ceam.system.domain.SysDept;
import com.ceam.system.domain.SysUser;
import com.ceam.system.feign.RemoteDeptService;
import com.ceam.system.feign.RemoteUserService;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

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

    /**
     * 它在businessServiceImpl的setAuditor中被调用
     * @param nodeId 流程节点编号
     * @param userId 当前用户编号
     * @return
     */
    @Override
    public Set<String> getAuditors(String nodeId, long userId)
    {
        // TODO 优化查询次数可以将同类型审核人一次性查询得到
        List<BizNode> bizNodes = selectBizNodeList(new BizNode().setNodeId(nodeId));
        Set<Long> auditors = Sets.newHashSet();
        Set<Long> roleIds = Sets.newHashSet();
        Set<Long> deptIds = Sets.newHashSet();
        if (null != bizNodes && bizNodes.size() > 0)
        {
            for (BizNode node : bizNodes)
            {
                if (node.getType().equals(ActivitiConstant.NODE_USER))
                {
                    // 如果是用户类型直接塞到审核人结合
                    auditors.add(node.getAuditor());
                }
                else if (node.getType().equals(ActivitiConstant.NODE_ROLE))
                {
                    // 查询所有拥有有当前角色编号的用户
                    roleIds.add(node.getAuditor());
                }
                else if (node.getType().equals(ActivitiConstant.NODE_DEPARTMENT))
                {
                    deptIds.add(node.getAuditor());
                }
                else if (node.getType().equals(ActivitiConstant.NODE_DEP_HEADER))
                {
                    SysUser user = remoteUserService.selectSysUserByUserId(userId);
                    SysDept dept = remoteDeptService.selectSysDeptByDeptId(user.getDeptId());
                    // 查询所有用有当前用户部门的负责人
                    auditors.add(dept.getLeaderId());
                }
            }
        }
        if (roleIds.size() > 0)
        {
            auditors.addAll(remoteUserService.selectUserIdsHasRoles(StrUtil.join(",", roleIds.toArray())));
        }
        if (deptIds.size() > 0)
        {
            auditors.addAll(remoteUserService.selectUserIdsInDepts(StrUtil.join(",", deptIds.toArray())));
        }
        return auditors.stream().map(m -> m.toString()).collect(Collectors.toSet());
    }
}
