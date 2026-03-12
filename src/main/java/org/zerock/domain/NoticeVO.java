package org.zerock.domain;
/* 공지사항 테이블 */
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeVO {
	private Long notice_id;    // 공지사항 번호
	private String title;      // 제목
	private String content;    // 본문 내용
	private String writer;     // 작성자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date reg_date = new Date();     // 등록일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date update_date;  // 수정일
	
	private int view_count; // 조회수
	private String important = "N";  // 중요 공지 (기본값: N)
	
}