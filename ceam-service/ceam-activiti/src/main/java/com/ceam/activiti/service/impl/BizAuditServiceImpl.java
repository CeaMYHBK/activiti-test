package com.ceam.activiti.service.impl;

import com.ceam.activiti.domain.BizAudit;
import com.ceam.activiti.mapper.BizAuditMapper;
import com.ceam.activiti.service.IBizAuditService;
import com.ceam.activiti.vo.HiTaskVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 10:00
 */
@Service
public class BizAuditServiceImpl implements IBizAuditService
{
    @Autowired
    private BizAuditMapper auditMapper;

    /**
     * 查询审核记录
     *
     * @param id 审核记录ID
     * @return 审核记录
     */
    @Override
    public BizAudit selectBizAuditById(String id)
    {
        return auditMapper.selectByPrimaryKey(id);
    }

    /**
     * 查询审核记录列表
     *
     * @param bizAudit 审核记录
     * @return 审核记录
     */
    @Override
    public List<BizAudit> selectBizAuditList(BizAudit bizAudit)
    {
        return auditMapper.select(bizAudit);
    }

    /**
     * 新增审核记录
     *
     * @param bizAudit 审核记录
     * @return 结果
     */
    @Override
    public int insertBizAudit(BizAudit bizAudit)
    {
        return auditMapper.insertSelective(bizAudit);
    }

    /**
     * 修改审核记录
     *
     * @param bizAudit 审核记录
     * @return 结果
     */
    @Override
    public int updateBizAudit(BizAudit bizAudit)
    {
        return auditMapper.updateByPrimaryKeySelective(bizAudit);
    }

    /**
     * 删除审核记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBizAuditByIds(String ids)
    {
        return auditMapper.deleteByIds(ids);
    }
    /**
     * 删除审核记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBizAuditLogic(String ids)
    {
        String[] idArr=ids.split(",");
        return auditMapper.deleteLogic(idArr);
    }

    /**
     * 删除审核记录信息
     *
     * @param id 审核记录ID
     * @return 结果
     */
    public int deleteBizAuditById(Long id)
    {
        return auditMapper.deleteByPrimaryKey(id);
    }

    /* (non-Javadoc)
     * @see com.ceam.activiti.service.IBizAuditService#getHistoryTaskList(com.ruoyi.activiti.vo.HiTaskVo)
     */
    @Override
    public List<HiTaskVo> getHistoryTaskList(HiTaskVo hiTaskVo)
    {
        return auditMapper.getHistoryTaskList(hiTaskVo);
    }
}
