package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.InsuredPersonVO;
import org.zerock.mapper.InsuredPersonMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InsuredPersonServiceImpl implements InsuredPersonService {

    private final InsuredPersonMapper insuredPersonMapper;

    @Override
    public List<InsuredPersonVO> getList() {
        return insuredPersonMapper.getList();
    }

    @Override
    public InsuredPersonVO get(String insured_id) {
        return insuredPersonMapper.read(insured_id);
    }

    @Override
    public void register(InsuredPersonVO vo) {
        insuredPersonMapper.insert(vo);
    }

    @Override
    public boolean modify(InsuredPersonVO vo) {
        return insuredPersonMapper.update(vo) == 1;
    }

    @Override
    public boolean remove(String insured_id) {
        return insuredPersonMapper.delete(insured_id) == 1;
    }

	@Override
	public List<InsuredPersonVO> getByCustomerId(String customerId) {
	    return insuredPersonMapper.getByCustomerId(customerId);
	}
    
    
}
