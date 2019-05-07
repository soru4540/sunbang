package org.kh.sunbang.realty.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.realty.model.service.RealtyService;
import org.kh.sunbang.realty.model.vo.Realty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RealtyController {
	//RealtyService DI
	@Autowired
	private RealtyService realtyService;

//형진----------------------------------------------------------------------------	
	
	@RequestMapping(value="realtymain.do")
	public String movePropertyMainMethod() {
		
		return "realty/realtyMain";
	}
	
	@RequestMapping(value="rmarkers.do")
	@ResponseBody
	public ArrayList<Realty> selectMarkerList(){
		
		ArrayList<Realty> mlist =  new ArrayList<Realty>();
		mlist = realtyService.selectMarkerList();
		
		return mlist;
	}

//성현----------------------------------------------------------------------------
	@RequestMapping("rdetail.do")
	public ModelAndView selectRealtyDetailView(
			ModelAndView mv, @RequestParam(name="realty_no") int realty_no) {
		
		//매물 조회수 증가
		realtyService.updateRealtyHits(realty_no);
		
		Realty realty = realtyService.selectRealtyDetailView(realty_no);
		
		if(realty != null) {
			mv.addObject("realty", realty);
			mv.setViewName("realty/realtyDetailView");
		}else {
			mv.addObject("message", "매물정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}	
	
	@RequestMapping("r360.do")
	public ModelAndView selectImage360View(
			ModelAndView mv, @RequestParam(name="image360") String image360) {
		mv.addObject("image360", image360);
		mv.setViewName("realty/realty360Image");
		return mv;
	}
	
	@RequestMapping(value="rdcount.do", method=RequestMethod.POST)
	public void selectDibsCount(int realty_no, HttpServletResponse response) {
		int dibsCount = realtyService.selectDibsCount(realty_no);
		String sdibsCount = Integer.toString(dibsCount);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sdibsCount);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="rdcheck.do", method=RequestMethod.POST)
	public void selectDibsCheck(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int user_no = ((Long)job.get("user_no")).intValue();
		int realty_no = ((Long)job.get("realty_no")).intValue();
		
		Dibs dibs = new Dibs();
		dibs.setUser_no(user_no);
		dibs.setRealty_no(realty_no);
		
		System.out.println(user_no + ", " + realty_no);
		
		int dibsCheck = realtyService.selectDibsCheck(dibs);
		String sdibsCheck = Integer.toString(dibsCheck);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sdibsCheck);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	@RequestMapping("rinsertview.do")
	public String insertRealtyView() {
		return "realty/realtyInsertView";
	}
	
	@RequestMapping(value="rinsert.do", method=RequestMethod.POST)
	public String insertRealty(Realty realty, MultipartHttpServletRequest mtfRequest, Model model, 
			@RequestParam(name="sh_360_image", required=false) MultipartFile image360) {
        List<MultipartFile> fileList = mtfRequest.getFiles("realty_image[]");
        
        String path = mtfRequest.getSession().getServletContext()
				.getRealPath("files/realty/realtyNormalImages");

        int i = 0;
        String[] saveFiles = new String[9];
        for (MultipartFile mf : fileList) {
        	
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String saveFile = path + "\\" + System.currentTimeMillis() + originFileName;
            try {
            	if(originFileName != "" && fileSize != 0) {
            		mf.transferTo(new File(saveFile));
            		saveFiles[i] = saveFile.substring(saveFile.lastIndexOf("\\")+1);
            		i++;
            	}
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        realty.setRealty_image1(saveFiles[0]);
        realty.setRealty_image2(saveFiles[1]);
        realty.setRealty_image3(saveFiles[2]);
        realty.setRealty_image4(saveFiles[3]);
        realty.setRealty_image5(saveFiles[4]);
        realty.setRealty_image6(saveFiles[5]);
        realty.setRealty_image7(saveFiles[6]);
        realty.setRealty_image8(saveFiles[7]);
		
        //360이미지 
        if(image360 != null) {
        	String path360 = mtfRequest.getSession().getServletContext().getRealPath("files/realty/realty360Images");
        	String save360File = path360 + "\\" + System.currentTimeMillis() + image360.getOriginalFilename();
        	try {
        		if(image360.getOriginalFilename() != "" && image360.getSize() != 0) {
        			image360.transferTo(new File(save360File));
        			realty.setImage360(save360File.substring(save360File.lastIndexOf("\\")+1));
        		}
        	} catch (IllegalStateException e) {
        		e.printStackTrace();
        	} catch (IOException e) {
        		e.printStackTrace();
        	}
        }
        
		System.out.println(realty);
		
		if(realtyService.insertRealty(realty) > 0) {
			//return "redirect:rdetail?realty_no=" + realty.getRealty_no();
			return "realty/realtyMain";
		}else {
			model.addAttribute("message", "매물 등록에 실패하였습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping("rmylist.do")
	public String selectRealtyMyListView() {
		return "realty/realtyMyListView";
	}	
	
	@RequestMapping("rupdateview.do")
	public String updateRealtyView() {
		return "realty/realtyUpdateView";
	}	
	
	@RequestMapping("rupdate.do")
	public String updateRealty() {
		return "realty/realtyUpdateView";
	}	
}
