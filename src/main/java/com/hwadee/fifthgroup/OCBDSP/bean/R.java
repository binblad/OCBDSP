package com.hwadee.fifthgroup.OCBDSP.bean;

import lombok.Data;

/**
 * @author king
 * @date 2024/4/8 10:21
 * @desc 统一响应结构
 */
@Data
public class R {

    /*请求逻辑的响应状态*/
    private boolean status;
    /*响应附带的描述信息*/
    private String message;
    /*响应附带的数据*/
    private Object datas;
    private String token;
    /*构建一个静态的成功响应对象*/
    public static R ok() {
        R r = new R();
        r.status = true;
        return r;
    }
    /*构建一个静态的失败的响应对象*/
    public static R fail() {
        R r = new R();
        r.status = false;
        return r;
    }

    /*链式设置 message 属性*/
    public R message(String message) {
        this.message = message;
        return this;
    }

    /*链式设置 datas 数据*/
    public R datas(Object datas) {
        this.datas = datas;
        return this;
    }
    public R token(String token){
        this.token=token;
        return this;
    }


    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getDatas() {
        return datas;
    }

    public void setDatas(Object datas) {
        this.datas = datas;
    }
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "R{" +
                "status=" + status +
                ", message='" + message + '\'' +
                ", datas=" + datas +
                '}';
    }


}
