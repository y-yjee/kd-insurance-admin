package org.zerock.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.DashboardService;

@Controller
@Log4j
@RequestMapping("/navbar/*")
@AllArgsConstructor
public class NavbarController {

    private final DashboardService dashboardService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("totalCustomers", dashboardService.getCustomerCount());
        model.addAttribute("totalInsured", dashboardService.getInsuredPersonCount());
        model.addAttribute("totalContracts", dashboardService.getContractCount());
        model.addAttribute("totalNotices", dashboardService.getNoticeCount());

        model.addAttribute("recentContracts", dashboardService.getRecentContracts());
        model.addAttribute("recentNotices", dashboardService.getRecentNotices());

        return "/navbar/dashboard";
    }
    
    @GetMapping("/product")
	public String product(Model model) {
		return "/navbar/product";
	}
    
	@GetMapping("/claims")
	public String claims(Model model) {
		return "/navbar/claims";
	}
	
	@GetMapping("/system")
	public String system(Model model) {
		return "/navbar/system";
	}
	
	@GetMapping("/terms")
	public String terms(Model model) {
		return "/navbar/terms";
	}
	
	@GetMapping("/auth")
	public String auth(Model model) {
		return "/navbar/auth";
	}
	
	@GetMapping("/guide")
	public String guide(Model model) {
		return "/navbar/guide";
	}
	
	@GetMapping("/log")
	public String log(Model model) {
		return "/navbar/log";
	}
    
} // eoc