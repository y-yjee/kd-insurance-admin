package org.zerock.mapper;

import java.util.List;
import org.zerock.domain.NoticeVO;

public interface NoticeMapper {

    // 전체 공지 목록 조회
    public List<NoticeVO> getList();

    // 공지 단건 조회
    public NoticeVO read(Long notice_id);

    // 공지 등록
    public void insert(NoticeVO vo);

    // 공지 수정
    public int update(NoticeVO vo);

    // 공지 삭제
    public int delete(Long notice_id);
    
    // 조회수 증가
    public void updateViewCount(Long notice_id);
}