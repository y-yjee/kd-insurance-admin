package org.zerock.service;

import java.util.List;
import org.zerock.domain.CustomerVO;

public interface CustomerService {
    public List<CustomerVO> getList();
    public CustomerVO get(String customer_id);
    public void register(CustomerVO vo);
    public boolean modify(CustomerVO vo);
    public boolean remove(String customer_id);
}
