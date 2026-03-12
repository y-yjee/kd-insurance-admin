package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeReplyVO;

public interface NoticeReplyService {

    // a. 댓글 등록
    int register(NoticeReplyVO vo);

    // b. 댓글 1개 조회
    NoticeReplyVO get(Long rno);

    // c. 댓글 수정
    boolean modify(NoticeReplyVO vo);

    // d. 댓글 삭제
    boolean remove(Long rno);

    // e. 해당 공지사항의 댓글 목록 (페이징 포함)
    List<NoticeReplyVO> getListWithPaging(Criteria cri, Long noticeId);

    // f. 해당 공지사항의 전체 댓글 수 (페이징용)
    int getCountByNoticeId(Long noticeId);
}
