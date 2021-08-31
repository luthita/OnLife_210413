<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex">

	<%-- 댓글 영역 --%>
	
	<div class="commentSection d-flex align-items-end flex-column border-right">
		<%-- 댓글 목록 --%>
		<c:forEach var="comment" items="${content.commentList}">
			<div class="balloon m-1">
				<span class="font-weight-bold">${comment.userName} : </span>
				<span>${comment.content}</span>
				
				<%-- 댓글쓴이가 본인이면 삭제버튼 노출 --%>
				<c:if test="${userName eq comment.userName}">
					<a href="#" class="commentDelBtn" data-comment-id="${comment.id}">
						<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
					</a>
				</c:if>
			</div>
		</c:forEach>
	  <div class="mt-auto p-2 d-flex">
		<input type="text" id="commentText${content.post.id}" class="form-control mr-2" placeholder="댓글 달기"/> 
		<button type="button" class="btn btn-info commentBtn" data-post-id="${content.post.id}">게시</button>
		</div>
	</div>
	
	
	<%-- 포스트 영역 --%>
	
	<div class="postSection col-6 border-right">
		<div class="postMainSection border-bottom">
			<div class="postUser d-flex p-3 justify-content-between">
				<div class="d-flex align-items-center">
					<div class="profileBox mr-3">
						<img src="/static/images/banner2.jpg" alt="프로필사진" width="50px" height="50px" class="profile">
					</div>
					<strong>${standardId }</strong>
				</div>
				<div>
					<a href="#" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-heart" aria-hidden="true"></i></a>
					<a href="#" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-trash more-btn" aria-hidden="true" data-toggle="modal" data-target="#moreModal" data-post-id="${post.id }"></i></a>
					<a href="/post/post_update_view?postId=${post.id}" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-pencil" aria-hidden="true"></i></a>
				</div>
			</div>
			<h5 class="textDeepBlue mt-4 ml-4">${post.subject }</h5>
			<c:if test="${not empty post.imagePath}">
				<div class="postImage d-flex justify-content-center">
					<img src="${post.imagePath }" alt="게시글사진" width="500px">
				</div>
			</c:if>
			<div class="postWrite d-flex justify-content-center p-3">
				<span class="mt-3">${post.content }</span>
			</div> 
		</div>
		<div class="d-flex justify-content-between">
			<div class="bg-transparent text-white">write</div>
			<nav aria-label="Page" class="mt-2 ">
			  <ul class="pagination justify-content-center">
			    <li class="page-item">
			      <a class="page-link" href="/timeline/timeline_view?prevId=${prevId }" ><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="/timeline/timeline_view?nextId=${nextId}"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
			    </li>
			  </ul>
			</nav>
			<a href="/post/post_create_view" class="btn btn-info mt-2">글쓰기</a>
		</div>
	</div>
	
	
	<%-- 인기 영상 영역 --%>
	
	<div class="recommendSection col-3">
		<div class="my-4 ml-2">
			<strong>인기 게시글</strong>
		</div>
		<div>
			<div class="d-flex my-4">
				<img alt="인기게시글" src="/static/images/banner1.jpg" class="recommendImage">
				<div class="ml-2">
					<Strong class="recommendTitie">셀카 꿀팁!</Strong><br>
					<span class="recommendComment">이렇게 찍으면 인생샷 건진다!</span><br>
					<span class="recommendComment textBlue">좋아요 : 123</span>	
				</div>
			</div>
			
			<div class="d-flex my-4">
				<img alt="인기게시글" src="/static/images/banner2.jpg" class="recommendImage">
				<div class="ml-2">
					<Strong class="recommendTitie">코로나 시국에 여행을...?</Strong><br>
					<span class="recommendComment">국내에서 갈수 있는 여행지 추천</span><br>
					<span class="recommendComment textBlue">좋아요 : 94</span>		
				</div>
			</div>
			<div class="d-flex my-4">
				<img alt="인기게시글" src="/static/images/banner3.jpg" class="recommendImage">
				<div class="ml-2">
					<Strong class="recommendTitie">지켜야 할 약속이란?</Strong><br>
					<span class="recommendComment"></span><br>		
					<span class="recommendComment textBlue">좋아요 : 60</span>
				</div>
			</div>
			<div class="d-flex my-4">
				<img alt="인기게시글" src="/static/images/banner4.jpg" class="recommendImage">
				<div class="ml-2">
					<Strong class="recommendTitie">어렵구나 어려워</Strong><br>
					<span class="recommendComment">만들기 어렵구나</span><br>
					<span class="recommendComment textBlue">좋아요 : 23</span>		
				</div>
			</div>
		</div>
	</div>
	
</div>


<%-- 글 삭제를 위한 Modal Layer --%>
<div class="modal" id="moreModal"tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>게시글을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary del-post">삭제</button>
        <%-- data-dismiss : 모달창 닫힘 --%>
        <button type="button" class="btn btn-secondary cancel" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(document).ready(function(){
		
		
		$('#moreModal .del-post').on('click', function(e) {
			e.preventDefault();
			
			var postId = $('#moreModal').data('post-id');
			//alert(postId);
			alert(postId);
		});
		
		// 댓글 쓰기
		$('.commentBtn').on('click', function(e) {
			e.preventDefault(); // 기본 동작 중단
			
			var postId = $(this).data('post-id');
			//alert(postId);
			
			var commentText = $('#commentText' + postId).val().trim(); // 글에 대한 댓글을 가져오기 위해 아이디 뒤에 동적으로 postId를 붙인다.
			if (commentText.length < 1) {
				alert("댓글 내용을 입력해주세요.");
				return;
			}
			
			$.ajax({
				type:'POST',
				url:'/comment/create',
				data: {"postId":postId, "content":commentText},
				success: function(data) {
					if (data.result == 'success') {
						location.reload(); // 새로고침
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					var errorMsg = jqXHR.responseJSON.status;
					alert(errorMsg + ":" + textStatus);
				}
			});
		});
	});
	
	
</script>