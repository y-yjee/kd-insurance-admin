package org.zerock.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import org.zerock.domain.CustomerVO;
import org.zerock.domain.InsuredPersonVO;
import org.zerock.service.CustomerService;
import org.zerock.service.InsuredPersonService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/customer")
@Log4j
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService customerService;
    private final InsuredPersonService insuredPersonService;
    
    // 🔍 고객 검색 팝업창
    @GetMapping("/search")
    public String searchPopup(Model model) {
        List<CustomerVO> customerList = customerService.getList(); // 모든 고객 조회
        model.addAttribute("customerList", customerList);
        return "customer/customerSearch"; // customerSearch.jsp 경로
    }
       
    // 팝업창에 고객 목록 제공
    @GetMapping("/customer")
    public String popupCustomer(Model model) {
        List<CustomerVO> customers = customerService.getList();

        // 고객별 피보험자 리스트도 세팅 (서비스 레벨에서 구현 필요)
        for (CustomerVO c : customers) {
            List<InsuredPersonVO> insuredList = insuredPersonService.getByCustomerId(c.getCustomer_id());
            c.setInsuredList(insuredList);
        }

        model.addAttribute("customerList", customers);
        return "customer/customer";
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    // 고객 전체 목록
    @GetMapping("/list")
    public String list(Model model) {
        List<CustomerVO> list = customerService.getList();
        model.addAttribute("list", list);
        return "customer/list";  // /WEB-INF/views/customer/list.jsp
    }

    // 고객 등록 폼
    @GetMapping("/register")
    public String registerForm() {
        return "customer/register";  // /WEB-INF/views/customer/register.jsp
    }

    // 고객 등록 처리
    @PostMapping("/register")
    public String register(CustomerVO vo) {
        customerService.register(vo);
        return "redirect:/customer/list";
    }

    // 고객 상세 조회
    @GetMapping("/get")
    public String get(@RequestParam("customer_id") String customer_id, Model model) {
        CustomerVO vo = customerService.get(customer_id);
        model.addAttribute("customer", vo);
        return "customer/get";  // /WEB-INF/views/customer/get.jsp
    }

    // 수정 폼 요청 (GET)
    @GetMapping("/modify")
    public String modifyForm(@RequestParam("customer_id") String customer_id, Model model) {
        CustomerVO customer = customerService.get(customer_id); // 기존 정보 가져오기
        model.addAttribute("customer", customer);
        return "customer/modify"; // customer/modify.jsp로 이동
    }

    // 수정 처리 요청 (POST)
    @PostMapping("/modify")
    public String modify(CustomerVO vo, Model model) {
        boolean result = customerService.modify(vo); // DB 업데이트 시도
        if (!result) {
            model.addAttribute("error", "수정에 실패했습니다.");
            return "customer/modifyFail"; // 실패 시 별도 JSP로 이동
        }
        return "redirect:/customer/list"; // 성공 시 목록으로 이동
    }


    // 고객 삭제 처리
    @PostMapping("/remove")
    public String remove(@RequestParam("customer_id") String customer_id) {
        customerService.remove(customer_id);
        return "redirect:/customer/list";
    }
}
