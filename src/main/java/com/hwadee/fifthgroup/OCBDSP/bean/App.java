package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("app")
@Data
@ToString
@NoArgsConstructor
public class App {
  @TableId
  private long appId;
  private String appName;
  private String appContent;


  public long getAppId() {
    return appId;
  }

  public void setAppId(long appId) {
    this.appId = appId;
  }


  public String getAppName() {
    return appName;
  }

  public void setAppName(String appName) {
    this.appName = appName;
  }


  public String getAppContent() {
    return appContent;
  }

  public void setAppContent(String appContent) {
    this.appContent = appContent;
  }

}
