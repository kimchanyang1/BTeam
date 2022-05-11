package com.ezen.rehome;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class RehomeController {
	
	@RequestMapping(value = "/rehome")
	public String rehome()
	{
		return "Rehomeinputform";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/rehomeinput")
	public String rhinput()
	{
		return "";
	}
}
