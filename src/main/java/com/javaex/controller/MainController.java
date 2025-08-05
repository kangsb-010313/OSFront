package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/OSFront")
public class MainController {
	
	//필드
	
	//생성자
	
	//메소드gs
	
	//메소드일반
	
	//http://localhost:8888/OSFront/main
	@RequestMapping(value="/main", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(Model model) {
		System.out.println("OSFront/main()");
		
		return "main";
	}
	
	//http://localhost:8888/OSFront/main2
	@RequestMapping(value="/main2", method= {RequestMethod.GET, RequestMethod.POST})
	public String list2(Model model) {
		System.out.println("OSFront/main2()");
		
		return "main/main2";
	}
	
	@RequestMapping(value="/main3", method= {RequestMethod.GET, RequestMethod.POST})
	public String list3(Model model) {
		System.out.println("OSFront/main3()");
		
		return "main3";
	}
	


}
