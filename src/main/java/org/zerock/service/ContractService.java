package org.zerock.service;

import java.util.List;
import org.zerock.domain.ContractVO;

public interface ContractService {

    // 전체 계약 목록 조회
    public List<ContractVO> getList();

    // 계약 단건 조회
    public ContractVO get(Long contract_id);

    // 계약 등록
    public void register(ContractVO vo);

    // 계약 수정
    public boolean modify(ContractVO vo);

    // 계약 삭제
    public boolean remove(Long contract_id);
    
}
