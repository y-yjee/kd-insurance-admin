package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.CustomerVO;

public interface CustomerMapper {

    // 전체 고객 목록
    public List<CustomerVO> getList();

    // 특정 고객 조회 (by customer_id)
    public CustomerVO read(String customer_id);

    // 고객 등록
    public void insert(CustomerVO vo);

    // 고객 수정
    public int update(CustomerVO vo);

    // 고객 삭제
    public int delete(String customer_id);
    
}
