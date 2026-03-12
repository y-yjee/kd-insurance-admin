package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.ContractVO;
import org.zerock.domain.NoticeVO;

public interface DashboardMapper {
    int getCustomerCount();
    int getInsuredPersonCount();
    int getContractCount();
    int getNoticeCount();

    List<ContractVO> getRecentContracts();
    List<NoticeVO> getRecentNotices();
}