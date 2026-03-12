package org.zerock.domain;
/* 고객(보험자) 테이블 */
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CustomerVO {
	private String customer_id;  // 고객 ID (계약자 ID)
	private String password;     // 비밀번호 (암호화 저장)
	private String name;         // 고객 이름
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth_date;     // 생년월일
	
	private String gender;       // 성별
	private String phone;        // 연락처
	private String email;        // 이메일
	private String address;      // 주소
	private String role;         // 권한
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;       // 등록일
	
	// 이 부분 추가
    private List<InsuredPersonVO> insuredList;
    	
}