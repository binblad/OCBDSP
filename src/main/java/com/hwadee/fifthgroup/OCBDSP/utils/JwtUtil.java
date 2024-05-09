package com.hwadee.fifthgroup.OCBDSP.utils;

import io.jsonwebtoken.JwsHeader;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.util.Date;
import java.util.Map;
public class JwtUtil {
    private static String signKey="111111111111111111111111111111111111111111111111111111111111111";

    public String  generateJwt(Map<String,Object> claims){
        String jwt= Jwts.builder()
                .addClaims(claims)
                .signWith(SignatureAlgorithm.HS256,signKey)//密钥
                .setExpiration(new Date(System.currentTimeMillis()+1*60*60*1000))//jwt有效期
                .compact();
        System.out.println(jwt);
        return jwt;
    }

    /*public void getInfoByJwt(String token){
        JwsHeader jwsHeader = Jwts
                .parser()
                .setSigningKey("secret")
                .parseClaimsJws(token)
                .getHeader();
    }*/
}
