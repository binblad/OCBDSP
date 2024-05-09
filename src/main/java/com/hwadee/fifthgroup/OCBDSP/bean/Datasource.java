package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("datasource")
@Data
@ToString
@NoArgsConstructor
public class Datasource {
  @TableId
  private long dataSourceId;
  private String dataSourceName;
  private String dataSourceDescription;
  private String dataSourceUrl;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;


  public long getDataSourceId() {
    return dataSourceId;
  }

  public void setDataSourceId(long dataSourceId) {
    this.dataSourceId = dataSourceId;
  }


  public String getDataSourceName() {
    return dataSourceName;
  }

  public void setDataSourceName(String dataSourceName) {
    this.dataSourceName = dataSourceName;
  }


  public String getDataSourceDescription() {
    return dataSourceDescription;
  }

  public void setDataSourceDescription(String dataSourceDescription) {
    this.dataSourceDescription = dataSourceDescription;
  }


  public String getDataSourceUrl() {
    return dataSourceUrl;
  }

  public void setDataSourceUrl(String dataSourceUrl) {
    this.dataSourceUrl = dataSourceUrl;
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
