package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.InsuredPersonVO;

public interface InsuredPersonMapper {

    // 전체 피보험자 목록 조회
    public List<InsuredPersonVO> getList();

    // 특정 피보험자 조회 (by insured_id)
    public InsuredPersonVO read(String insured_id);

    // 피보험자 등록
    public void insert(InsuredPersonVO vo);

    // 피보험자 정보 수정
    public int update(InsuredPersonVO vo);

    // 피보험자 삭제
    public int delete(String insured_id);
    
    // 고객 ID로 피보험자 목록 조회
    public List<InsuredPersonVO> getByCustomerId(String customerId);
    
}