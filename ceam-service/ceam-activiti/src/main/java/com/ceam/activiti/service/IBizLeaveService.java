package com.ceam.activiti.service;

import com.ceam.activiti.domain.BizLeave;

import java.util.List;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 14:43
 */
public interface IBizLeaveService {

    /**
     * 查询请假
     *
     * @param id 请假ID
     * @return 请假
     */
    public BizLeave selectBizLeaveById(String id);

    /**
     * 查询请假列表
     *
     * @param bizLeave 请假
     * @return 请假集合
     */
    public List<BizLeave> selectBizLeaveList(BizLeave bizLeave);

    /**
     * 新增请假
     *
     * @param bizLeave 请假
     * @return 结果
     */
    public int insertBizLeave(BizLeave bizLeave);

    /**
     * 修改请假
     *
     * @param bizLeave 请假
     * @return 结果
     */
    public int updateBizLeave(BizLeave bizLeave);

    /**
     * 批量删除请假
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBizLeaveByIds(String ids);

    /**
     * 删除请假信息
     *
     * @param id 请假ID
     * @return 结果
     */
    public int deleteBizLeaveById(String id);
}
