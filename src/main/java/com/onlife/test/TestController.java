package com.onlife.test;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlife.test.bo.TestBO;

@Controller
public class TestController {

	@Autowired
	private TestBO testBO;
	
	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		
		return "test";
	}
	
	@RequestMapping("/test2")
	@ResponseBody
	public List<Map<String,Object>> test2(){
		List<Map<String,Object>> result = testBO.getLike();
		return result;
		
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "test";
	}
}
