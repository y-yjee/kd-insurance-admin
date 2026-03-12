package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ContractVO;
import org.zerock.service.ContractService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/contract")
@RequiredArgsConstructor
public class ContractController {

    private final ContractService contractService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    
    // 계약 목록
    @GetMapping("/list")
    public String list(Model model) {
        List<ContractVO> list = contractService.getList();
        model.addAttribute("contractList", list);
        return "contract/list"; 
    }

    // 계약 등록 폼
    @GetMapping("/register")
	public String register() {
    	return "contract/register";
    	
    }

    @PostMapping("/register")
    public String register(ContractVO vo) {
        System.out.println("insured_id: " + vo.getInsured_id());  // 이 부분 꼭 확인
        contractService.register(vo);
        return "redirect:/contract/list";
    }
    
    // 계약 상세 조회
    @GetMapping("/get")
    public String get(@RequestParam("contract_id") Long contract_id, Model model) {
        ContractVO vo = contractService.get(contract_id);
        model.addAttribute("contract", vo);
        return "contract/get";  
    }
    @GetMapping("/modify")
    public String modify(@RequestParam("contract_id") Long contract_id, Model model) {
        ContractVO vo = contractService.get(contract_id);
        model.addAttribute("contract", vo);
        return "contract/modify";  
    }
    
    // 계약 수정 처리
    @PostMapping("/modify")
    public String modify(ContractVO vo, RedirectAttributes rttr) {
        System.out.println("수정 시도: " + vo); // contract_id 잘 오는지 확인

        if (contractService.modify(vo)) {
            rttr.addFlashAttribute("result", "success");
            return "redirect:/contract/list";
        }

        return "contract/modifyFail";
    }

    // 계약 삭제 처리
    @PostMapping("/remove")
    public String remove(@RequestParam("contract_id") Long contract_id) {
        contractService.remove(contract_id);
        return "redirect:/contract/list";
    }
}
