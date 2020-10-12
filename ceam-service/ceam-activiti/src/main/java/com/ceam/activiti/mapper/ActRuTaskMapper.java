package com.ceam.activiti.mapper;

import com.ceam.activiti.domain.ActRuTask;

import java.util.List;

/**
 * @author CeaM
 * @Description
 * @date 2020/10/12 9:38
 */
public interface ActRuTaskMapper {

    List<ActRuTask> selectAll();

    ActRuTask selectByPrimaryKey(String id);

    int insert(ActRuTask actRuTask);

    int insertSelective(ActRuTask actRuTask);

    int updateByPrimaryKey(ActRuTask actRuTask);

    int updateByPrimaryKeySelective(ActRuTask actRuTask);

    int deleteByPrimaryKey(String id);
}
