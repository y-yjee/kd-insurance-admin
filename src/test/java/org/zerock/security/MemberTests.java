package org.zerock.security;


import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class MemberTests {
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		String sql = "insert into alegria_member(userid, userpw, username) values(?,?,?)";
		
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "admin"); // 값 바꾸면 아이디 커스텀 가능
				pstmt.setString(2, passwordEncoder.encode("1111"));
				pstmt.setString(3, "관리자");
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch(Exception e) {
						e.addSuppressed(e);
					}
				}
				if(con != null) {
					try {
						con.close();
					}catch(Exception e) {
						e.addSuppressed(e);
					}
				}
			}
		}
	@Test
	  public void testInsertAuth() {
	    String sql = "insert into alegria_member_auth (userid, auth) values (?,?)";
	   
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      
	      try {
	        con = ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, "admin"); // 값 바꾸면 아이디 커스텀 가능
	        pstmt.setString(2,"ROLE_ADMIN");
	        pstmt.executeUpdate();
	      }catch(Exception e) {
	        e.printStackTrace();
	      }finally {
	        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
	        if(con != null) { try { con.close();  } catch(Exception e) {} }
	        
	      }
	    }
}//eoc