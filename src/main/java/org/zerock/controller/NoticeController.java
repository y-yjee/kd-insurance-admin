package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.NoticeVO;
import org.zerock.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    // 공지사항 목록
    @GetMapping("/list")
    public String list(Model model) {
        List<NoticeVO> list = noticeService.getList();
        model.addAttribute("list", list);
        return "notice/list";  // /WEB-INF/views/notice/list.jsp
    }

    // 공지사항 등록 폼
    @GetMapping("/register")
    public String registerForm() {
        return "notice/register";  // /WEB-INF/views/notice/register.jsp
    }

    // 공지사항 등록 처리
    @PostMapping("/register")
    public String register(NoticeVO vo) {
        noticeService.register(vo);
        return "redirect:/notice/list";
    }

    // 공지사항 상세 조회
    @GetMapping("/get")
    public String get(@RequestParam("notice_id") Long notice_id, Model model) {
        NoticeVO vo = noticeService.get(notice_id);  // 조회수 증가 + 상세조회
        model.addAttribute("notice", vo);
        return "notice/get";  // get.jsp로 포워딩
    }

    // 공지사항 수정 처리
    @PostMapping("/modify")
    public String modify(NoticeVO vo, Model model) {
        boolean result = noticeService.modify(vo);
        if (!result) {
            model.addAttribute("error", "수정 실패");
            return "notice/modifyFail";  // 선택 사항
        }
        return "redirect:/notice/list";
    }
    // 공지사항 수정 폼
    @GetMapping("/modify")
    public String modifyForm(@RequestParam("notice_id") Long notice_id, Model model) {
        NoticeVO notice = noticeService.get(notice_id); // 수정할 데이터 가져오기
        model.addAttribute("notice", notice);
        return "notice/modify"; // modify.jsp 열기
    }

    // 공지사항 삭제 처리
    @PostMapping("/remove")
    public String remove(@RequestParam("notice_id") Long notice_id) {
        noticeService.remove(notice_id);
        return "redirect:/notice/list";
    }
}
