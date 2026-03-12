package org.zerock.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.NewsVO;
import org.zerock.domain.Criteria;

public interface NewsMapper {
	
	// 전체 뉴스 기사 목록 조회
	public List<NewsVO> getList();
	
	// 뉴스 기사 단건 조회
	public NewsVO read(Long news_id);
	
	// 뉴스 기사 등록
    public void insert(NewsVO news);
    
    // 뉴스 기사 수정
    public int update(NewsVO news);

    // 뉴스 기사 삭제
    public int delete(Long news_id);

    // 조회수 증가
    public void updateViewCount(Long news_id); 
    
    // 주간 뉴스 목록 (페이징)
    public List<NewsVO> getWeeklyNewsList(@Param("offset") int offset, @Param("amount") int amount);

    // 주간 뉴스 총 개수
    public int getTotalCount();
	
}
