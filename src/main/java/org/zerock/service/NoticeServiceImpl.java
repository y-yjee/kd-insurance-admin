package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.NoticeVO;
import org.zerock.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@Transactional // 트랜잭션 추가
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeMapper noticeMapper;

    @Override
    public List<NoticeVO> getList() {
        return noticeMapper.getList();
    }

    @Override
    public NoticeVO get(Long notice_id) {
        noticeMapper.updateViewCount(notice_id); // 조회수 증가
        return noticeMapper.read(notice_id);     // 공지사항 내용 조회
    }

    @Override
    public void register(NoticeVO vo) {
        noticeMapper.insert(vo);
    }

    @Override
    public boolean modify(NoticeVO vo) {
        return noticeMapper.update(vo) == 1;
    }

    @Override
    public boolean remove(Long notice_id) {
        return noticeMapper.delete(notice_id) == 1;
    }
}
