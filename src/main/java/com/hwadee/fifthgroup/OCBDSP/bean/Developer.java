package com.hwadee.fifthgroup.OCBDSP.bean;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@TableName("developer")
@Data
@ToString
@NoArgsConstructor
public class Developer {
  @TableId
  private long userId;
  private long black;


  public long getUserId() {
    return userId;
  }
  public void setUserId(long userId) {
    this.userId = userId;
  }
  public long getBlack() {
    return black;
  }
  public void setBlack(long black) {
    this.black = black;
  }

}
