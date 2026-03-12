package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.ContractVO;

public interface ContractMapper {

    // 전체 계약 목록 조회
    public List<ContractVO> getList();

    // 계약 상세 조회 (by contract_id)
    public ContractVO read(Long contract_id);

    // 계약 등록
    public void insert(ContractVO vo);

    // 계약 수정
    public int modify(ContractVO vo);

    // 계약 삭제
    public int remove(Long contract_id);
    
}