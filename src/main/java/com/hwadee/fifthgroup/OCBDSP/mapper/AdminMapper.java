package com.hwadee.fifthgroup.OCBDSP.mapper;

import com.hwadee.fifthgroup.OCBDSP.bean.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hwadee.fifthgroup.OCBDSP.bean.R;
import com.hwadee.fifthgroup.OCBDSP.bean.User;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
* @author thhhh
* @description 针对表【admin】的数据库操作Mapper
* @createDate 2024-04-26 16:48:59
* @Entity com.hwadee.fifthgroup.OCBDSP.bean.Admin
*/
public interface AdminMapper extends BaseMapper<Admin> {
    @Select("select * from admin where adminAccount = #{account}")
    Admin selectOneByAccount(String account);
    @Select("select * from admin where adminAccount = #{account} and adminPassword=#{password}")
    Admin selectOneByAccountAndPassword(String account,String password);

    /*R updateOneByAccount(String account);*/
}




