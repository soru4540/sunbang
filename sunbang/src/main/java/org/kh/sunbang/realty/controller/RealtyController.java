package org.kh.sunbang.realty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealtyController {
	
	
	
	@RequestMapping(value="propertymain.do")
	public String movePropertyMainMethod() {
		
		return "realty/propertyMain";
	}
}
