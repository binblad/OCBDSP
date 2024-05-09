package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("reapikeycontrol")
@Data
@ToString
@NoArgsConstructor
public class Reapikeycontrol {
  @TableId
  private long keyId;
  private long appId;
  private long userId;
  private java.sql.Timestamp datetime;
  private long times;


  public long getKeyId() {
    return keyId;
  }

  public void setKeyId(long keyId) {
    this.keyId = keyId;
  }


  public long getAppId() {
    return appId;
  }

  public void setAppId(long appId) {
    this.appId = appId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public java.sql.Timestamp getDatetime() {
    return datetime;
  }

  public void setDatetime(java.sql.Timestamp datetime) {
    this.datetime = datetime;
  }


  public long getTimes() {
    return times;
  }

  public void setTimes(long times) {
    this.times = times;
  }

}
