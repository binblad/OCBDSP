package com.hwadee.fifthgroup.OCBDSP.bean;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TargetPosition {
    String account;
    String typeName;
    int targetMinSalary;
    int targetMaxSalary;
    int targetMinstaffNumber;
    int targetMaxstaffNumber;
    String workPlace1;
    String workPlace2;
    String workPlace3;

    public int getTargetMaxstaffNumber() {
        return targetMaxstaffNumber;
    }

    public void setTargetMaxstaffNumber(int targetMaxstaffNumber) {
        this.targetMaxstaffNumber = targetMaxstaffNumber;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public void setTargetMinSalary(int targetMinSalary) {
        this.targetMinSalary = targetMinSalary;
    }

    public void setTargetMaxSalary(int targetMaxSalary) {
        this.targetMaxSalary = targetMaxSalary;
    }

    public void setTargetMinstaffNumber(int targetMinstaffNumber) {
        this.targetMinstaffNumber = targetMinstaffNumber;
    }

    public void setWorkPlace1(String workPlace1) {
        this.workPlace1 = workPlace1;
    }

    public void setWorkPlace2(String workPlace2) {
        this.workPlace2 = workPlace2;
    }

    public void setWorkPlace3(String workPlace3) {
        this.workPlace3 = workPlace3;
    }



    public int getTargetMinSalary() {
        return targetMinSalary;
    }

    public int getTargetMaxSalary() {
        return targetMaxSalary;
    }

    public int getTargetMinstaffNumber() {
        return targetMinstaffNumber;
    }

    public String getWorkPlace1() {
        return workPlace1;
    }

    public String getWorkPlace2() {
        return workPlace2;
    }

    public String getWorkPlace3() {
        return workPlace3;
    }
}
