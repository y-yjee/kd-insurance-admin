package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ContractVO;
import org.zerock.mapper.ContractMapper;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class ContractServiceImpl implements ContractService {
	@Setter(onMethod_ = @Autowired)
    private ContractMapper contractMapper;

    @Override
    public List<ContractVO> getList() {
        return contractMapper.getList();
    }

    @Override
    public ContractVO get(Long contract_id) {
        return contractMapper.read(contract_id);
    }

    @Override
    public void register(ContractVO vo) {
        contractMapper.insert(vo);
    }

    @Override
    public boolean modify(ContractVO vo) {
        return contractMapper.modify(vo) == 1;
    }

    @Override
    public boolean remove(Long contract_id) {
        return contractMapper.remove(contract_id) == 1;
    }
}
