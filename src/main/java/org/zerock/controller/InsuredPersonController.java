package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.zerock.domain.CustomerVO;
import org.zerock.domain.InsuredPersonVO;
import org.zerock.service.CustomerService;
import org.zerock.service.InsuredPersonService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/insuredperson")
@Log4j
@RequiredArgsConstructor
public class InsuredPersonController {

    private final InsuredPersonService insuredPersonService;
    private final CustomerService customerService; 

    // 피보험자 전체 목록
    @GetMapping("/list")
    public String list(Model model) {
        List<InsuredPersonVO> list = insuredPersonService.getList();
        model.addAttribute("list", list);
        return "insuredperson/list";  // /WEB-INF/views/insuredperson/list.jsp
    }

    // 피보험자 등록 폼
    @GetMapping("/register")
    public String registerForm(Model model) {
        // 고객 리스트 조회 (CustomerService가 있다고 가정)
        List<CustomerVO> customerList = customerService.getList();  
        model.addAttribute("customerList", customerList);

        return "insuredperson/register";
    }

    // 피보험자 등록 처리
    @PostMapping("/register")
    public String register(InsuredPersonVO vo) {
        insuredPersonService.register(vo);
        return "redirect:/insuredperson/list";
    }

    // 피보험자 상세 조회
    @GetMapping("/get")
    public String get(@RequestParam("insured_id") String insured_id, Model model) {
        InsuredPersonVO vo = insuredPersonService.get(insured_id);
        model.addAttribute("insured", vo);
        return "insuredperson/get";  // /WEB-INF/views/insuredperson/get.jsp
    }

    // 피보험자 수정 처리
    @PostMapping("/modify")
    public String modify(InsuredPersonVO vo, Model model) {
        boolean result = insuredPersonService.modify(vo);
        if (!result) {
            model.addAttribute("error", "수정 실패");
            return "insuredperson/modifyFail";  // 선택 사항
        }
        return "redirect:/insuredperson/list";
    }
    
    @GetMapping("/modify")
    public String modifyForm(@RequestParam("insured_id") String insured_id, Model model) {
        log.info("modify form for insured_id: " + insured_id);
        InsuredPersonVO vo = insuredPersonService.get(insured_id);
        model.addAttribute("insuredPerson", vo);
        return "/insuredperson/modify";
    }

    // 피보험자 삭제 처리
    @PostMapping("/remove")
    public String remove(@RequestParam("insured_id") String insured_id) {
        insuredPersonService.remove(insured_id);
        return "redirect:/insuredperson/list";
    }
    
    // 특정 고객 ID로 피보험자 리스트 반환 (Ajax 용)
    @GetMapping("/byCustomer")
    @ResponseBody
    public List<InsuredPersonVO> getInsuredByCustomer(@RequestParam("customerId") String customerId) {
        log.info("피보험자 조회 by customerId: " + customerId);
        return insuredPersonService.getByCustomerId(customerId); // Service에서 이 메서드 구현 필요
    }
        
}
