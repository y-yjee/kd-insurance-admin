// NoticeReplyMapper.java
package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeReplyVO;

public interface NoticeReplyMapper {

    // 댓글 등록
    public int insert(NoticeReplyVO vo);

    // 특정 댓글 조회
    public NoticeReplyVO read(Long rno);

    // 댓글 삭제
    public int delete(Long rno);

    // 댓글 수정
    public int update(NoticeReplyVO vo);

    // 특정 공지사항에 달린 댓글 리스트 (페이징 포함)
    public List<NoticeReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("notice_id") Long noticeId);

    // 특정 공지사항의 댓글 개수 (페이징 용도)
    public int getCountByNoticeId(Long noticeId);
}
