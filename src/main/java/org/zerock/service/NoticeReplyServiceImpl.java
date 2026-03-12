package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeReplyVO;
import org.zerock.mapper.NoticeReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class NoticeReplyServiceImpl implements NoticeReplyService {

    private final NoticeReplyMapper mapper;

    @Override
    public int register(NoticeReplyVO vo) {
        log.info("댓글 등록: " + vo);
        return mapper.insert(vo);
    }

    @Override
    public NoticeReplyVO get(Long rno) {
        log.info("댓글 조회: " + rno);
        return mapper.read(rno);
    }

    @Override
    public boolean modify(NoticeReplyVO vo) {
        log.info("댓글 수정: " + vo);
        return mapper.update(vo) == 1;
    }

    @Override
    public boolean remove(Long rno) {
        log.info("댓글 삭제: " + rno);
        return mapper.delete(rno) == 1;
    }

    @Override
    public List<NoticeReplyVO> getListWithPaging(Criteria cri, Long noticeId) {
        log.info("댓글 페이징 목록 조회 - Notice ID: " + noticeId);
        return mapper.getListWithPaging(cri, noticeId);
    }

    @Override
    public int getCountByNoticeId(Long noticeId) {
        log.info("댓글 총 개수 조회 - Notice ID: " + noticeId);
        return mapper.getCountByNoticeId(noticeId);
    }
}
