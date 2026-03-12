package org.zerock.service;

import java.util.List;
import org.zerock.domain.InsuredPersonVO;

public interface InsuredPersonService {

    // 전체 피보험자 목록
    public List<InsuredPersonVO> getList();

    // 피보험자 단건 조회
    public InsuredPersonVO get(String insured_id);

    // 피보험자 등록
    public void register(InsuredPersonVO vo);

    // 피보험자 수정
    public boolean modify(InsuredPersonVO vo);

    // 피보험자 삭제
    public boolean remove(String insured_id);
    
    // Service 인터페이스
    public List<InsuredPersonVO> getByCustomerId(String customerId);
    
}
