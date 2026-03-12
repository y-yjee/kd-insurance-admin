package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewsVO;
import org.zerock.mapper.NewsMapper;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {

	private final NewsMapper newsMapper;

	// 전체 뉴스 기사 목록 조회
	@Override
	public List<NewsVO> getList() {
		return newsMapper.getList();
	}

	// 뉴스 기사 단건 조회
	@Override
	public NewsVO get(Long news_id) {
		newsMapper.updateViewCount(news_id); // 조회수 증가
        return newsMapper.read(news_id);     // 공지사항 내용 조회
	}

	// 뉴스 기사 등록
	@Override
	public void register(NewsVO news) {
		newsMapper.insert(news);
		
	}

	// 뉴스 기사 수정
	@Override
	public boolean modify(NewsVO news) {
		return newsMapper.update(news) == 1;
	}

	// 뉴스 기사 삭제
	@Override
	public boolean remove(Long news_id) {
		return newsMapper.delete(news_id) == 1;
	}
	
	// 페이징 처리
	@Override
	public List<NewsVO> getWeeklyNewsList(Criteria cri) {
		return newsMapper.getWeeklyNewsList(cri.getPageNum(), cri.getAmount());
	}

	@Override
	public int getTotalCount() {
	    return newsMapper.getTotalCount();
	}

}
