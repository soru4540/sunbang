package org.kh.sunbang.realty.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.kh.sunbang.realty.model.service.RealtyService;
import org.kh.sunbang.realty.model.vo.Realty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

//김성현----------------------------------------------------------------------------
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
	public String selectImage360View() {
		return "realty/realty360Image";
	}	
	
	@RequestMapping("rinsertview.do")
	public String insertRealtyView() {
		return "realty/realtyInsertView";
	}
	
	@RequestMapping(value="rinsert.do", method=RequestMethod.POST)
	public String insertRealty(Realty realty, MultipartHttpServletRequest mtfRequest) {
        List<MultipartFile> fileList = mtfRequest.getFiles("realty_image[]");

        String path = mtfRequest.getSession().getServletContext()
				.getRealPath("files/realty/realtyNormalImages");

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + "\\" + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		
		//return "redirect:rdetail?realty_no=" + realty.getRealty_no();
		System.out.println(realty);
		return "realty/realtyMain";
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
