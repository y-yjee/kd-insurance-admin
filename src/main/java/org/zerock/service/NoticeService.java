package org.zerock.service;

import java.util.List;
import org.zerock.domain.NoticeVO;

public interface NoticeService {

    // 전체 공지 목록
    public List<NoticeVO> getList();

    // 공지 단건 조회
    public NoticeVO get(Long notice_id);

    // 공지 등록
    public void register(NoticeVO vo);

    // 공지 수정
    public boolean modify(NoticeVO vo);

    // 공지 삭제
    public boolean remove(Long notice_id);
}
