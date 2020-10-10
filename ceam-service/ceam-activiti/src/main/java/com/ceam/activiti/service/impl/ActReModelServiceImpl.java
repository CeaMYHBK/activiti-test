package com.ceam.activiti.service.impl;

import com.ceam.activiti.domain.ActReModel;
import com.ceam.activiti.mapper.ActReModelMapper;
import com.ceam.activiti.service.IActReModelService;
import com.ceam.common.core.text.Convert;
import com.ceam.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author CeaM
 * @Description 流程设计模型部署Service业务层处理
 * @date 2020/10/10 9:51
 */
@Service
public class ActReModelServiceImpl implements IActReModelService {

    @Autowired
    private ActReModelMapper actReModelMapper;

    /**
     * 查询流程设计模型部署
     *
     * @param id 流程设计模型部署ID
     * @return 流程设计模型部署
     */
    @Override
    public ActReModel selectActReModelById(String id)
    {
        return actReModelMapper.selectActReModelById(id);
    }

    /**
     * 查询流程设计模型部署列表
     *
     * @param actReModel 流程设计模型部署
     * @return 流程设计模型部署
     */
    @Override
    public List<ActReModel> selectActReModelList(ActReModel actReModel)
    {
        return actReModelMapper.selectActReModelList(actReModel);
    }

    /**
     * 新增流程设计模型部署
     *
     * @param actReModel 流程设计模型部署
     * @return 结果
     */
    @Override
    public int insertActReModel(ActReModel actReModel)
    {
        actReModel.setCreateTime(DateUtils.getNowDate());
        return actReModelMapper.insertActReModel(actReModel);
    }

    /**
     * 修改流程设计模型部署
     *
     * @param actReModel 流程设计模型部署
     * @return 结果
     */
    @Override
    public int updateActReModel(ActReModel actReModel)
    {
        actReModel.setUpdateTime(DateUtils.getNowDate());
        return actReModelMapper.updateActReModel(actReModel);
    }

    /**
     * 删除流程设计模型部署对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteActReModelByIds(String ids)
    {
        return actReModelMapper.deleteActReModelByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除流程设计模型部署信息
     *
     * @param id 流程设计模型部署ID
     * @return 结果
     */
    public int deleteActReModelById(String id)
    {
        return actReModelMapper.deleteActReModelById(id);
    }
}
