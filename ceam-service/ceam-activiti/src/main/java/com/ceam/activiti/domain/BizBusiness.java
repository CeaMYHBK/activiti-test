package com.ceam.activiti.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;

/**
 * @Description: 统一业务申请信息
 * @Author: CeaM
 * @Date: 2020/10/11 9:51
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class BizBusiness implements Serializable {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Long              id;

    //申请标题
    private String            title;

    //创建用户ID
    private Long              userId;

    //关联表ID
    private String            tableId;

    //流程定义编号
    private String            procDefId;

    //流程定义key 路由标记
    private String            procDefKey;

    //流程实例编号
    private String            procInstId;

    // 流程名称
    private String            procName;

    // 当前任务节点名称
    private String            currentTask;

    //申请人
    private String            applyer;

    //状态 1处理中 2结束
    private Integer           status;

    //结果状态 1处理中 2通过 3驳回
    private Integer           result;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date applyTime;

    //删除标记
    private Boolean           delFlag;
}
