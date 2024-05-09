package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("appdeveloper")
@Data
@ToString
@NoArgsConstructor
public class Appdeveloper {
  @TableId
  private long userId;
  private long appId;


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getAppId() {
    return appId;
  }

  public void setAppId(long appId) {
    this.appId = appId;
  }

}
