package com.ceam.system.service.impl;

import com.ceam.system.domain.Donate;
import com.ceam.system.mapper.DonateMapper;
import com.ceam.system.service.IDonateService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import java.util.List;

/**
 * <p>File：DonateServiceImpl.java</p>
 * <p>Title: </p>
 * <p>Description:</p>
 */
@Service
public class DonateServiceImpl implements IDonateService
{
    @Autowired
    private DonateMapper donateMapper;

    @Override
    public List<Donate> selectDistrictsList(Donate donate)
    {
        Example example = new Example(Donate.class);
        Criteria criteria = example.createCriteria();
        if (StringUtils.isNotBlank(donate.getNick()))
        {
            criteria.andLike("nick", "%" + donate.getNick() + "%");
        }
        if (null != donate.getCanal())
        {
            criteria.andEqualTo("canal", donate.getCanal());
        }
        if (StringUtils.isNotBlank(donate.getBeginTime()))
        {
            criteria.andGreaterThanOrEqualTo("createTime", donate.getBeginTime());
        }
        if (StringUtils.isNotBlank(donate.getEndTime()))
        {
            criteria.andLessThanOrEqualTo("createTime", donate.getEndTime());
        }
        return donateMapper.selectByExample(example);
    }
}
