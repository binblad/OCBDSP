package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("task")
@Data
@ToString
@NoArgsConstructor
public class Task {
  @TableId
  private long taskId;
  private long dataSourceId;
  private String taskName;
  private String taskType;
  private long cronExperssion;
  private java.sql.Timestamp startTime;
  private java.sql.Timestamp endTime;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;


  public long getTaskId() {
    return taskId;
  }

  public void setTaskId(long taskId) {
    this.taskId = taskId;
  }


  public long getDataSourceId() {
    return dataSourceId;
  }

  public void setDataSourceId(long dataSourceId) {
    this.dataSourceId = dataSourceId;
  }


  public String getTaskName() {
    return taskName;
  }

  public void setTaskName(String taskName) {
    this.taskName = taskName;
  }


  public String getTaskType() {
    return taskType;
  }

  public void setTaskType(String taskType) {
    this.taskType = taskType;
  }


  public long getCronExperssion() {
    return cronExperssion;
  }

  public void setCronExperssion(long cronExperssion) {
    this.cronExperssion = cronExperssion;
  }


  public java.sql.Timestamp getStartTime() {
    return startTime;
  }

  public void setStartTime(java.sql.Timestamp startTime) {
    this.startTime = startTime;
  }


  public java.sql.Timestamp getEndTime() {
    return endTime;
  }

  public void setEndTime(java.sql.Timestamp endTime) {
    this.endTime = endTime;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }

}
