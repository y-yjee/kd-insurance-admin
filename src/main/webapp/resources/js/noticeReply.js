console.log("noticeReply.js 실행됨");

// 날짜 포맷 함수
function formatTime(timeValue) {
  const date = new Date(timeValue);
  return date.toLocaleString("ko-KR", {
    year: "numeric", month: "2-digit", day: "2-digit",
    hour: "2-digit", minute: "2-digit", second: "2-digit"
  });
}

// 댓글 서비스 객체
var replyService = (function () {
  function add(reply, callback) {
    $.ajax({
      type: "post",
      url: "/noticereplies/new",
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: callback
    });
  }

  function getList(param, callback) {
    $.getJSON("/noticereplies/pages/" + param.notice_id + "/" + param.page + ".json", callback);
  }

  function remove(rno, callback) {
    $.ajax({
      type: "delete",
      url: "/noticereplies/" + rno,
      success: callback
    });
  }

  function update(reply, callback) {
    $.ajax({
      type: "put",
      url: "/noticereplies/" + reply.rno,
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: callback
    });
  }

  return {
    add: add,
    getList: getList,
    remove: remove,
    update: update
  };
})();

// 댓글 목록 렌더링
function showList(page = 1) {
  replyService.getList({ notice_id: notice_id, page: page }, function (data) {
    let str = "";

    if (!data.list || data.list.length === 0) {
      str = `
        <li class="list-group-item text-center text-muted">
          <i class="fas fa-comment-slash fa-lg me-2"></i>등록된 댓글이 없습니다.
        </li>`;
      $("#replyPaging").hide();
    } else {
      data.list.forEach(function (reply) {
        str += `
          <li class="list-group-item">
            <strong>${reply.replyer}</strong>
            <p>${reply.reply}</p>
            <small class="text-muted">${formatTime(reply.replyDate)}</small>
            <div class="mt-2">
              <button class="btn btn-sm btn-outline-primary btn-edit" data-rno="${reply.rno}" data-reply="${reply.reply}">수정</button>
              <button class="btn btn-sm btn-outline-danger btn-remove" data-rno="${reply.rno}">삭제</button>
            </div>
          </li>`;
      });

      // 페이징
      $("#replyPaging").show();
      let pagingStr = "";
      const totalReplies = data.replyCnt || 0;
      const amount = 10;
      const totalPages = Math.max(1, Math.ceil(totalReplies / amount));

      for (let i = 1; i <= totalPages; i++) {
        pagingStr += `<button class="btn btn-outline-secondary btn-sm mx-1 btn-page" data-page="${i}">${i}</button>`;
      }
      $("#replyPaging").html(pagingStr);
    }

    $("#replyList").html(str);
  });
}

$(document).ready(function () {
  if (typeof notice_id === 'undefined') {
    console.error("notice_id undefined. 댓글 로딩 중단");
    return;
  }

  showList();

  // 댓글 등록
  $("#modalRegisterBtn").click(function () {
    const reply = $("input[name='reply']").val();
    const replyer = $("input[name='replyer']").val();

    if (!reply.trim()) return;

    replyService.add({ notice_id: notice_id, reply: reply, replyer: replyer }, function () {
      $("input[name='reply']").val("");
      $("input[name='replyer']").val("");
      $("#myModal").modal('hide');
      showList();
    });
  });

  // 삭제
  $("#replyList").on("click", ".btn-remove", function () {
    const rno = $(this).data("rno");
    if (confirm("정말 삭제하시겠습니까?")) {
      replyService.remove(rno, () => {
        alert("삭제 완료");
        showList();
      });
    }
  });

  // 수정 폼 표시
  $("#replyList").on("click", ".btn-edit", function () {
    const rno = $(this).data("rno");
    const originText = $(this).data("reply");
    const item = $(this).closest("li");

    item.find("p").replaceWith(`
      <div class="input-group">
        <input type="text" class="form-control edit-reply-input" value="${originText}">
        <button class="btn btn-success btn-save" data-rno="${rno}">저장</button>
        <button class="btn btn-secondary btn-cancel">취소</button>
      </div>`);
  });

  // 수정 저장
  $("#replyList").on("click", ".btn-save", function () {
    const rno = $(this).data("rno");
    const reply = $(this).siblings(".edit-reply-input").val();
    replyService.update({ rno: rno, reply: reply }, () => {
      alert("수정 완료");
      showList();
    });
  });

  // 수정 취소
  $("#replyList").on("click", ".btn-cancel", function () {
    showList();
  });

  // 페이징 클릭
  $("#replyPaging").on("click", ".btn-page", function () {
    const page = $(this).data("page");
    showList(page);
  });
});
