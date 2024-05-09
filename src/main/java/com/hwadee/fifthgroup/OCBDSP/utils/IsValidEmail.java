package com.hwadee.fifthgroup.OCBDSP.utils;

public  class IsValidEmail {
    public static boolean isValidEmail(String email) {
        // 判断是否包含且只包含一个@字符，并且不在句首和句尾
        return email.indexOf('@') > 0 && email.indexOf('@') == email.lastIndexOf('@') && email.indexOf('@') < email.length() - 1;
    }
}
