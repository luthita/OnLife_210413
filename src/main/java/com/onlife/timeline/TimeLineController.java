package com.onlife.timeline;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlife.post.bo.PostBO;
import com.onlife.post.model.Post;

@RequestMapping("/timeline")
@Controller
public class TimeLineController {
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/timeline_view")
	public String TimeLineView(
			@RequestParam(value="prevId", required = false) Integer prevIdParam,
			@RequestParam(value="nextId", required = false) Integer nextIdParam,
			HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		
		Integer standardId = postBO.getPostByUserId(userId, prevIdParam, nextIdParam);
		List<Post> postList = postBO.getPostListByUserId(userId);

		int prevId = 0;
		int nextId = 0;
		if(postList.isEmpty() == false) {
			// 리스트 중 가장 앞쪽(제일 큰) id
			prevId = postList.get(0).getId();
			// 리스트 중 가장 뒤쪽(제일 작은) id
			nextId = postList.get(postList.size() - 1).getId();
			
		}
		
		model.addAttribute("standardId", standardId);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId",nextId);
		// model.addAttribute("post", post);
		model.addAttribute("userName",userName);
		model.addAttribute("viewName","timeline/timeLine");
		return "template/layout";
	}
}
