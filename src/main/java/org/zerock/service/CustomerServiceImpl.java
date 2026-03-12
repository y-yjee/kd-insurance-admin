package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CustomerVO;
import org.zerock.mapper.CustomerMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomerMapper customerMapper;

    @Override
    public List<CustomerVO> getList() {
        return customerMapper.getList();
    }

    @Override
    public CustomerVO get(String customer_id) {
        return customerMapper.read(customer_id);
    }

    @Override
    public void register(CustomerVO vo) {
        customerMapper.insert(vo);
    }

    @Override
    public boolean modify(CustomerVO vo) {
        return customerMapper.update(vo) == 1;
    }

    @Override
    public boolean remove(String customer_id) {
        return customerMapper.delete(customer_id) == 1;
    }
}
