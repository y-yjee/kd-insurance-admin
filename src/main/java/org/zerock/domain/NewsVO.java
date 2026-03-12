package org.zerock.domain;
/* 뉴스 기사 테이블 */

import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class NewsVO {
	private Long news_id;                         // 뉴스 기사 고유 ID
	private String title;                         // 뉴스 기사 제목
	private String content;                       // 뉴스 기사 내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date published_date = new Date();     // 뉴스 기사 날짜
	
	private String writer;                         // 작성자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	private Date reg_date = new Date();            // 등록일
	
	private int view_count;                        // 조회수
	private String important = "N";                // 중요 공지 (기본값: N)
	
}
