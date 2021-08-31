package com.onlife.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlife.post.bo.PostBO;
import com.onlife.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	@Autowired
	private PostBO postBO;
	
	
	@RequestMapping("/post_create_view")
	public String postCreateView(Model model) {
		model.addAttribute("viewName","post/post_create");
		return "template/layout";
	}
	
	@RequestMapping("post_update_view")
	public String postUpdateView(
			@RequestParam("postId") int postId,
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		if(userId == null) {
			return " redirect:/user/sign_in_view";
		}
		
		Post post = postBO.getPostByPostIdAndUserId(postId, userId);
		
		model.addAttribute("post",post);
		model.addAttribute("viewName","post/post_update");
		return "template/layout";
	}
}
