package com.ceam.activiti.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;

/**
 * @author CeaM
 * @Description 自定义节点
 * @date 2020/10/10 14:11
 */
@Data
@Accessors(chain = true)
public class BizNode {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long    id;

    /** 节点ID*/
    private String  nodeId;

    /** 类型 1：角色 2：部门负责人 3：用户 4：所属部门负责人*/
    private Integer type;

    /** 类型对应负责人的值*/
    private Long    auditor;


}
