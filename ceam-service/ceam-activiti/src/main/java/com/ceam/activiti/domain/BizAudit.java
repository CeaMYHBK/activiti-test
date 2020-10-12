package com.ceam.activiti.domain;

import lombok.Data;
import lombok.experimental.Accessors;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Transient;
import java.util.Date;

/**
 * @author CeaM
 * @Description 审核记录
 * @date 2020/10/12 9:46
 */
@Data
@Accessors(chain = true)
public class BizAudit {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long     id;

    private String   taskId;

    private Integer  result;

    private String   comment;

    private String   procDefKey;

    private String   procName;

    private String   applyer;

    private String   auditor;

    private Long     auditorId;

    private Date createTime;

    //标注为临时变量，不在该实体对应表中
    @Transient
    private String   procInstId;

    @Transient
    private Long     businessKey;

    @Transient
    private String[] taskIds;
}
