package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.NewsVO;
import org.zerock.domain.NoticeVO;
import org.zerock.service.NewsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/news")
@Log4j
@RequiredArgsConstructor
public class NewsController {

	private final NewsService newsService;
	
	// 뉴스 기사 목록
    @GetMapping("/list")
    public String list(Criteria cri, Model model) {
        List<NewsVO> list = newsService.getList();
        model.addAttribute("list", list);
        
     // 페이징 처리
        model.addAttribute("list", newsService.getWeeklyNewsList(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, newsService.getTotalCount()));
        return "news/list";  
    }
       
    // 뉴스 기사 등록 폼
    @GetMapping("/register")
    public String registerForm() {
        return "news/register"; 
    }
    
    // 뉴스 기사 등록 처리
    @PostMapping("/register")
    public String register(NewsVO news) {
    	newsService.register(news);
        return "redirect:/news/list";
    }
    
    // 뉴스 기사 상세 조회
    @GetMapping("/get")
    public String get(@RequestParam("news_id") Long news_id, Model model) {
    	NewsVO news = newsService.get(news_id);  // 조회수 증가 + 상세조회
        model.addAttribute("news", news);
        return "news/get";  // get.jsp로 포워딩
    }

    // 뉴스 기사 수정 처리
    @PostMapping("/modify")
    public String modify(NewsVO news, Model model) {
        boolean result = newsService.modify(news);
        if (!result) {
            model.addAttribute("error", "수정 실패");
            return "news/modifyFail";  // 선택 사항
        }
        return "redirect:/news/list";
    }

	// 뉴스 기사 수정 폼
    @GetMapping("/modify")
    public String modifyForm(@RequestParam("news_id") Long news_id, Model model) {
    	NewsVO news = newsService.get(news_id); // 수정할 데이터 가져오기
        model.addAttribute("news", news);
        return "news/modify"; // modify.jsp 열기
    }
    
    // 뉴스 기사 삭제 처리
    @PostMapping("/remove")
    public String remove(@RequestParam("news_id") Long news_id) {
    	newsService.remove(news_id);
        return "redirect:/news/list";
    }
   
}
