package com.ceam.activiti.service;

import com.ceam.activiti.domain.BizAudit;
import com.ceam.activiti.vo.HiTaskVo;

import java.util.List;

/**
 * @author CeaM
 * @Description 审核Service
 * @date 2020/10/12 9:54
 */
public interface IBizAuditService {

    /**
     * 查询审核记录
     *
     * @param id 审核记录ID
     * @return 审核记录
     */
    public BizAudit selectBizAuditById(String id);

    /**
     * 查询审核记录列表
     *
     * @param bizAudit 审核记录
     * @return 审核记录集合
     */
    public List<BizAudit> selectBizAuditList(BizAudit bizAudit);

    /**
     * 新增审核记录
     *
     * @param bizAudit 审核记录
     * @return 结果
     */
    public int insertBizAudit(BizAudit bizAudit);

    /**
     * 修改审核记录
     *
     * @param bizAudit 审核记录
     * @return 结果
     */
    public int updateBizAudit(BizAudit bizAudit);

    /**
     * 批量删除审核记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBizAuditByIds(String ids);

    /**
     * 批量删除审核记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBizAuditLogic(String ids);

    /**
     * 删除审核记录信息
     *
     * @param id 审核记录ID
     * @return 结果
     */
    public int deleteBizAuditById(Long id);

    /**
     * history task 历史任务记录
     *
     * @param hiTaskVo
     * @return
     */
    List<HiTaskVo> getHistoryTaskList(HiTaskVo hiTaskVo);



}
