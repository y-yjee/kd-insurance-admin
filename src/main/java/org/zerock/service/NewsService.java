package org.zerock.service;

import java.util.List;
import org.zerock.domain.NewsVO;
import org.zerock.domain.Criteria;

public interface NewsService {
	
	// 전체 뉴스 기사 목록 조회
    public List<NewsVO> getList();

    // 뉴스 기사 단건 조회
    public NewsVO get(Long news_id);

    // 뉴스 기사 등록
    public void register(NewsVO news);

    // 뉴스 기사 수정
    public boolean modify(NewsVO news);

    // 뉴스 기사 삭제
    public boolean remove(Long news_id);
    
    // 페이징 처리
    public List<NewsVO> getWeeklyNewsList(Criteria cri);

    public int getTotalCount();
}
