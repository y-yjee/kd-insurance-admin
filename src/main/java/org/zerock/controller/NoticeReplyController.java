package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoticeReplyVO;
import org.zerock.service.NoticeReplyService;

@RequestMapping("/noticereplies")
@RestController
@Log4j
@AllArgsConstructor
public class NoticeReplyController {

    private NoticeReplyService service;

    // a. 등록
    @PostMapping(value = "/new",
                 consumes = "application/json",
                 produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> create(@RequestBody NoticeReplyVO vo) {
        log.info("NoticeReply 등록: " + vo);

        int insertCount = service.register(vo);
        log.info("Reply INSERT COUNT: " + insertCount);

        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // b. 목록 (페이징 포함)
    @GetMapping(value = "/pages/{notice_id}/{page}",
                produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<Map<String, Object>> getList(
            @PathVariable("notice_id") Long noticeId,
            @PathVariable("page") int page) {

        log.info("댓글 목록 조회 - notice_id: " + noticeId + ", page: " + page);
        Criteria cri = new Criteria(page, 10); // 페이지당 10개

        List<NoticeReplyVO> list = service.getListWithPaging(cri, noticeId);
        int count = service.getCountByNoticeId(noticeId);

        Map<String, Object> result = new HashMap<>();
        result.put("list", list);
        result.put("replyCnt", count);

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    // c. 조회 (단건)
    @GetMapping(value = "/{rno}",
                produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public ResponseEntity<NoticeReplyVO> get(@PathVariable("rno") Long rno) {
        log.info("댓글 조회: " + rno);
        return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
    }

    // d. 삭제
    @DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
        log.info("댓글 삭제: " + rno);

        return service.remove(rno)
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

    // e. 수정
    @PutMapping(value = "/{rno}",
                consumes = "application/json",
                produces = { MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> modify(@RequestBody NoticeReplyVO vo,
                                         @PathVariable("rno") Long rno) {
        vo.setRno(rno);
        log.info("댓글 수정: " + rno);
        log.info("수정 내용: " + vo);

        return service.modify(vo)
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
