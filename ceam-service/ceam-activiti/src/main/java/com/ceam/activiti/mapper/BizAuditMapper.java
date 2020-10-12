package com.ceam.activiti.mapper;

import com.ceam.activiti.domain.BizAudit;
import com.ceam.activiti.vo.HiTaskVo;
import com.ceam.common.core.dao.BaseMapper;

import java.util.List;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 9:49
 */
public interface BizAuditMapper extends BaseMapper<BizAudit>
{
    List<HiTaskVo> getHistoryTaskList(HiTaskVo hiTaskVo);

    /**
     * logic删除
     * @param ids
     * @return
     */
    int deleteLogic(String[] ids);

}
