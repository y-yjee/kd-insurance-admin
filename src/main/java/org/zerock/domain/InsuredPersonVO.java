package org.zerock.domain;
/* 주민(피보험자) 테이블 */
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InsuredPersonVO {
	private String insured_id;       // 피보험자 ID
	private String customer_id;      // 고객 ID (계약자 참조)
	private String name;             // 피보험자 이름
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth_date;         // 생년월일
	
    private String gender;           // 성별
	private String relationship;     // 계약자와의 관계
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_date;           // 등록일
	
}