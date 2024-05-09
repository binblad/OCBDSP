package com.hwadee.fifthgroup.OCBDSP.mapper;

import com.hwadee.fifthgroup.OCBDSP.bean.R;
import com.hwadee.fifthgroup.OCBDSP.bean.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
* @author king
* @description 针对表【user(保存用户信息)】的数据库操作Mapper
* @createDate 2024-04-08 10:19:26
* @Entity com.hwadee.vue03server.bean.User
*/
public interface UserMapper extends BaseMapper<User> {
    @Select("select * from user where account = #{account}")
    User selectOneByAccount(String account);
    @Select("select * from user where account = #{account} and password=#{password}")
    User selectOneByAccountAndPassword(String account,String password);
    @Update("UPDATE user JOIN major ON user.majorId = major.majorId set password=#{password},name =#{name},gender=#{gender},age=#{age}," +
            "educationalQualification=#{educationalQualification},email=#{email},major.majorName=#{majorName} where account =#{account}")
    R updateOneByAccount(String account);

}




