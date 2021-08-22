<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex">
	<div class="commentSection d-flex align-items-end flex-column border-right">
	  <div class="p-2">
	  	<div class="balloon text-center">Comment1</div>
		<div class="balloon text-center">Comment2</div>
		<div class="balloon text-center">Comment3</div>
	  </div>

	  <div class="mt-auto p-2 d-flex">
		<input type="text" id="commentText${content.post.id}" class="form-control mr-2" placeholder="댓글 달기"/> 
		<button type="button" class="btn btn-info commentBtn" data-post-id="${content.post.id}">게시</button>
		</div>
	</div>
	
	<div class="postSection col-6 border-right">
		<div class="postMainSection border-bottom">
			<div class="postUser d-flex p-3 justify-content-between">
				<div class="d-flex align-items-center">
					<div class="profileBox mr-3">
						<img src="/static/images/banner2.jpg" alt="프로필사진" width="50px" height="50px" class="profile">
					</div>
					<strong>함석윤</strong>
				</div>
				<div>
					<a href="#" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-heart" aria-hidden="true"></i></a>
					<a href="#" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-trash" aria-hidden="true"></i></a>
					<a href="#" class="btn bgSkyBlue textDeepBlue"><i class="fa fa-pencil" aria-hidden="true"></i></a>
				</div>
			</div>
			
			<div class="postImage d-flex justify-content-center">
				<img src="/static/images/banner1.jpg" alt="게시글사진" width="400px">
			</div>
			<div class="postWrite d-flex justify-content-center">
				<span class="mt-3">첫 게시글 입니다.</span>
			</div> 
		</div>
		<div class="d-flex justify-content-between">
			<div class="bg-transparent text-white">write</div>
			<nav aria-label="Page" class="mt-2 ">
			  <ul class="pagination justify-content-center">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#"><i class="fa fa-arrow-right" aria-hidden="true"></i></a>
			    </li>
			  </ul>
			</nav>
			<a href="/post/post_create_view" class="btn btn-info mt-2">글쓰기</a>
		</div>
	</div>
	
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