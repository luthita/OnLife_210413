package com.onlife.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/timeline")
@Controller
public class TimeLineController {

	@RequestMapping("/timeline_view")
	public String TimeLineView(Model model) {
		
		model.addAttribute("viewName","timeline/timeLine");
		return "template/layout";
	}
}
