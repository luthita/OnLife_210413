package com.onlife.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onlife.common.FileManagerService;
import com.onlife.post.dao.PostDAO;
import com.onlife.post.model.Post;

@Service
public class PostBO {
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public List<Post> getPostListByUserId(int userId){
		return postDAO.selectPostListByUserId(userId);
	}
	
	public Integer getPostByUserId(int userId, Integer prevId, Integer nextId) {
		
		Integer standardId = null;
		if(prevId != null) {
			// 이전 클릭
			standardId = prevId;
			
			//Post post = postDAO.selectPostByUserId(userId, standardId);
			return standardId;
		} else if(nextId != null) {
			// 다음 클릭
			standardId = nextId;
			
		}
		// 처음 페이지
		//return postDAO.selectPostByUserId(userId, direction, standardId);
		return standardId;
	}
	
	public boolean isLastPage(int userId, int nextId) {
		return nextId == postDAO.selectPostIdByUserIdAndSort(userId, "ASC");
	}
	
	public boolean isFirstPage(int userId, int prevId) {
		return prevId == postDAO.selectPostIdByUserIdAndSort(userId, "DESC");
	}
	
	public Post getPostByPostIdAndUserId(int postId, int userId) {
		return postDAO.selectPostByPostIdAndUserId(postId,userId);
	}
	
	public int updatePost(int postId, int userId, String userLoginId,
			String subject, String content, MultipartFile file) {
		
		// file을 가지고 image URL 로 구성하고 DB에 넣는다.
		String imageUrl = generateImageUrlByFile(userLoginId, file);
		if(imageUrl != null) {
			Post post = postDAO.selectPostByPostIdAndUserId(postId, userId);
			String oldImageUrl = post.getImagePath();
			try {
				fileManagerService.deleteFile(oldImageUrl);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				log.error("[파일삭제] 삭제 중 에러 : " + postId + " " + oldImageUrl);
			}
			
		}
		return postDAO.updatePost(postId,userId,subject, content, imageUrl);
	}
	private String generateImageUrlByFile(String userLoginId, MultipartFile file) {
		String imageUrl = null;
		if(file != null) {
			try {
				// 컴퓨터(서버)에 파일 업로드 후 웹으로 접근할 수 있는 image URL을 얻어낸다.
				imageUrl = fileManagerService.saveFile(userLoginId, file);
			} catch (IOException e) {
				log.error("[파일업로드] " + e.getMessage());
			}
		}
		return imageUrl;
	}
	
	public int createPost(int userId, String userLoginId, String subject, String content, MultipartFile file) {
		// file을 가지고 image URL 로 구성하고 DB에 넣는다.
		String imageUrl = null;
		if(file != null) {
			try {
				// 컴퓨터(서버)에 파일 업로드 후 웹으로 접근할 수 있는 image URL을 얻어낸다.
				imageUrl = fileManagerService.saveFile(userLoginId, file);
			} catch (IOException e) {
				log.error("[파일업로드] " + e.getMessage());
			}
		}
		
		return postDAO.insertPost(userId, subject, content, imageUrl);
	}
}
