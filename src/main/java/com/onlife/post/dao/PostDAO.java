package com.onlife.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onlife.post.model.Post;

@Repository
public interface PostDAO {
	public List<Post> selectPostListByUserId(int userId);
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public Post selectPostByUserId(
			@Param("userId") int userId,
			@Param("standardId") Integer standardId);
	
	public int selectPostIdByUserIdAndSort(
			@Param("userId") int userId, 
			@Param("sort") String sort);
	
	public Post selectPostByPostIdAndUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int updatePost(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("subject") String subject,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
}