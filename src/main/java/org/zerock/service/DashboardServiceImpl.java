package org.zerock.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.zerock.domain.ContractVO;
import org.zerock.domain.NoticeVO;
import org.zerock.mapper.DashboardMapper;

import java.util.List;

@Service
@Log4j
@RequiredArgsConstructor
public class DashboardServiceImpl implements DashboardService {

    private final DashboardMapper dashboardMapper;

    @Override
    public int getCustomerCount() {
        return dashboardMapper.getCustomerCount();
    }

    @Override
    public int getInsuredPersonCount() {
        return dashboardMapper.getInsuredPersonCount();
    }

    @Override
    public int getContractCount() {
        return dashboardMapper.getContractCount();
    }

    @Override
    public int getNoticeCount() {
        return dashboardMapper.getNoticeCount();
    }

    @Override
    public List<ContractVO> getRecentContracts() {
        return dashboardMapper.getRecentContracts();
    }

    @Override
    public List<NoticeVO> getRecentNotices() {
        return dashboardMapper.getRecentNotices();
    }
}