package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

/*
 공지사항 댓글 페이징 DTO
 댓글 수 + 페이징된 댓글 목록
 */
@Data
@AllArgsConstructor
public class NoticeReplyPageDTO {
    private int replyCnt; // 전체 댓글 수
    private List<NoticeReplyVO> list; // 공지사항 댓글 목록
}
