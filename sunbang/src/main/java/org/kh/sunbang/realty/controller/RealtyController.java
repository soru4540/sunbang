package org.kh.sunbang.realty.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.dibs.model.vo.Dibs;
import org.kh.sunbang.realty.model.service.RealtyService;
import org.kh.sunbang.realty.model.vo.Realty;
import org.kh.sunbang.user.model.vo.User;
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
	public ModelAndView movePropertyMainMethod(ModelAndView mv) {

		ArrayList<Realty> rlist =  new ArrayList<Realty>();
		rlist = realtyService.selectMarkerList();
		
		if(rlist != null) {
			mv.addObject("realtymain", rlist);
			mv.setViewName("realty/realtyMain");
		}else {
			mv.addObject("message", "매물정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@RequestMapping(value="rlist.do", method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Realty> test6Method(@RequestBody String param) throws ParseException{
		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray)jparser.parse(param);
		ArrayList<Integer> realtyno = new ArrayList<Integer>();
		for(int i = 0; i < jarr.size(); i++) {
			JSONObject jr = new JSONObject();
			jr.put(i, jarr.get(i));
			String a = jr.get(i).toString();
			realtyno.add(Integer.parseInt(a));
		}
		
		ArrayList<Realty> rlist = realtyService.selectRealtyList(realtyno);
		
			return rlist;
	}

	//성현----------------------------------------------------------------------------
	@RequestMapping("rdetail.do")
	public ModelAndView selectRealtyDetailView(
			ModelAndView mv, @RequestParam(name="realty_no") int realty_no) {
		
		//매물 조회수 증가
		realtyService.updateRealtyHits(realty_no);
		
		Realty realty = realtyService.selectRealtyDetailView(realty_no);
		User user = realtyService.selectUserInfo(realty.getUser_no());
		
		if(realty != null) {
			mv.addObject("realty", realty);
			mv.addObject("user", user);
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
	
	@RequestMapping(value="rdinsert.do", method=RequestMethod.POST)
	public void insertDibs(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int user_no = ((Long)job.get("user_no")).intValue();
		int realty_no = ((Long)job.get("realty_no")).intValue();
		
		Dibs dibs = new Dibs();
		dibs.setUser_no(user_no);
		dibs.setRealty_no(realty_no);
		
		int result = realtyService.insertDibs(dibs);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	@RequestMapping(value="rddelete.do", method=RequestMethod.POST)
	public void deleteDibs(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int user_no = ((Long)job.get("user_no")).intValue();
		int realty_no = ((Long)job.get("realty_no")).intValue();
		
		Dibs dibs = new Dibs();
		dibs.setUser_no(user_no);
		dibs.setRealty_no(realty_no);
		
		int result = realtyService.deleteDibs(dibs);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}	
	
	@RequestMapping(value="rrcheck.do", method=RequestMethod.POST)
	public void selectRealtyReportCheck(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int user_no = ((Long)job.get("user_no")).intValue();
		int realty_no = ((Long)job.get("realty_no")).intValue();
		
		Report report = new Report();
		report.setUser_no(user_no);
		report.setContents_no(realty_no);
		
		int reportCheck = realtyService.selectRealtyReportCheck(report);
		String sreportCheck = Integer.toString(reportCheck);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sreportCheck);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="rrinsert.do", method=RequestMethod.POST)
	public void insertRealtyReport(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int user_no = ((Long)job.get("user_no")).intValue();
		int realty_no = ((Long)job.get("realty_no")).intValue();
		String contents = (String)job.get("contents");
		
		Report report = new Report();
		report.setUser_no(user_no);
		report.setContents_no(realty_no);
		report.setContents(contents);
		
		int result = realtyService.insertRealtyReport(report);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
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
	public String insertRealty(Realty realty, MultipartHttpServletRequest mtpRequest, Model model, 
			@RequestParam(name="sh_360_image", required=false) MultipartFile image360) {
        List<MultipartFile> fileList = mtpRequest.getFiles("realty_image[]");
        
        String path = mtpRequest.getSession().getServletContext()
				.getRealPath("files/realty/realtyNormalImages");

        int i = 0;
        String[] saveFiles = new String[8];
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
        	String path360 = mtpRequest.getSession().getServletContext().getRealPath("files/realty/realty360Images");
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
			
			int user_no = realty.getUser_no();
			System.out.println(realty.getUser_no());
			System.out.println(user_no);
			int realty_no = realtyService.selectRealtyNo(user_no);
			
			return "redirect:rdetail.do?realty_no=" + realty_no;
		}else {
			model.addAttribute("message", "매물 등록에 실패하였습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping("rmylist.do")
	public ModelAndView selectRealtyMyListView(
			ModelAndView mv, @RequestParam(name="user_no") int user_no) {
		
		ArrayList<Realty> realtyList = realtyService.selectRealtyMyListView(user_no);
		if(realtyList != null) {
			mv.addObject("realtyList", realtyList);
			mv.setViewName("realty/realtyMyListView");			
		}else {
			mv.addObject("message", "매물정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");			
		}
		
		return mv;
	}	
	
	@RequestMapping(value="rmdelete.do", method=RequestMethod.POST)
	public void updateRealtyMyListDelete(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);	
		
		String realty_status = (String)job.get("realty_status");
		String realty_detail_comment = (String)job.get("realty_detail_comment");
		int realty_no = Integer.parseInt(job.get("realty_no").toString());
		
		Realty realty = new Realty();
		realty.setRealty_status(realty_status);
		realty.setRealty_detail_comment(realty_detail_comment);
		realty.setRealty_no(realty_no);
		
		int result = realtyService.updateRealtyMyListDelete(realty);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");	
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("rupdateview.do")
	public ModelAndView selectRealtyUpdateView(
			ModelAndView mv, @RequestParam(name="realty_no") int realty_no){
		
		Realty realty = realtyService.selectRealtyDetailView(realty_no);
		
		if(realty != null) {
			mv.addObject("realty", realty);
			mv.setViewName("realty/realtyUpdateView");
		}else {
			mv.addObject("message", "매물정보 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}	
	
	@RequestMapping(value="rsupdate.do", method=RequestMethod.POST)
	public void updateRealtyStatus(@RequestBody String param, HttpServletResponse response) throws ParseException {
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject)jparser.parse(param);
		
		int realty_no = ((Long)job.get("realty_no")).intValue();
		String realty_status = (String)job.get("realty_status");
		
		Realty realty = new Realty();
		realty.setRealty_no(realty_no);
		realty.setRealty_status(realty_status);
		
		int result = realtyService.updateRealtyStatus(realty);
		String sresult = Integer.toString(result);
		
		response.setContentType("text/html; charset=utf-8");	
		try {
			PrintWriter out = response.getWriter();
			out.append(sresult);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="rupdate.do", method=RequestMethod.POST)
	public String updateRealty(Realty realty, MultipartHttpServletRequest mtpRequest, Model model) throws IllegalStateException, IOException {
		
		MultipartFile updatefile0 = mtpRequest.getFile("realty_update_image0");
		MultipartFile updatefile1 = mtpRequest.getFile("realty_update_image1");
		MultipartFile updatefile2 = mtpRequest.getFile("realty_update_image2");
		MultipartFile updatefile3 = mtpRequest.getFile("realty_update_image3");
		MultipartFile updatefile4 = mtpRequest.getFile("realty_update_image4");
		MultipartFile updatefile5 = mtpRequest.getFile("realty_update_image5");
		MultipartFile updatefile6 = mtpRequest.getFile("realty_update_image6");
		MultipartFile updatefile7 = mtpRequest.getFile("realty_update_image7");
		
		MultipartFile image360 = mtpRequest.getFile("sh_360_image");
		
		String path = mtpRequest.getSession().getServletContext().getRealPath("files/realty/realtyNormalImages");
        	
    	if(realty.getRealty_image1().isEmpty() && updatefile0.getOriginalFilename() != "" && updatefile0.getSize() != 0) {
    		String saveFile0 = path+ "\\" + System.currentTimeMillis() + updatefile0.getOriginalFilename();
    		updatefile0.transferTo(new File(saveFile0));
    		realty.setRealty_image1(saveFile0.substring(saveFile0.lastIndexOf("\\")+1));
    	}
        	
    	if(realty.getRealty_image2().isEmpty() && updatefile1.getOriginalFilename() != "" && updatefile1.getSize() != 0) {
    		String saveFile1 = path+ "\\" + System.currentTimeMillis() + updatefile1.getOriginalFilename();
    		updatefile1.transferTo(new File(saveFile1));
    		realty.setRealty_image2(saveFile1.substring(saveFile1.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image3().isEmpty() && updatefile2.getOriginalFilename() != "" && updatefile2.getSize() != 0) {
    		String saveFile2 = path+ "\\" + System.currentTimeMillis() + updatefile2.getOriginalFilename();
    		updatefile2.transferTo(new File(saveFile2));
    		realty.setRealty_image3(saveFile2.substring(saveFile2.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image4().isEmpty() && updatefile3.getOriginalFilename() != "" && updatefile3.getSize() != 0) {
    		String saveFile3 = path+ "\\" + System.currentTimeMillis() + updatefile3.getOriginalFilename();
    		updatefile3.transferTo(new File(saveFile3));
    		realty.setRealty_image4(saveFile3.substring(saveFile3.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image5().isEmpty() && updatefile4.getOriginalFilename() != "" && updatefile4.getSize() != 0) {
    		String saveFile4 = path+ "\\" + System.currentTimeMillis() + updatefile4.getOriginalFilename();
    		updatefile4.transferTo(new File(saveFile4));
    		realty.setRealty_image5(saveFile4.substring(saveFile4.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image6().isEmpty() && updatefile5.getOriginalFilename() != "" && updatefile5.getSize() != 0) {
    		String saveFile5 = path+ "\\" + System.currentTimeMillis() + updatefile5.getOriginalFilename();
    		updatefile5.transferTo(new File(saveFile5));
    		realty.setRealty_image6(saveFile5.substring(saveFile5.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image7().isEmpty() && updatefile6.getOriginalFilename() != "" && updatefile6.getSize() != 0) {
    		String saveFile6 = path+ "\\" + System.currentTimeMillis() + updatefile6.getOriginalFilename();
    		updatefile6.transferTo(new File(saveFile6));
    		realty.setRealty_image7(saveFile6.substring(saveFile6.lastIndexOf("\\")+1));
    	}
    	
    	if(realty.getRealty_image8().isEmpty() && updatefile7.getOriginalFilename() != "" && updatefile7.getSize() != 0) {
    		String saveFile7 = path+ "\\" + System.currentTimeMillis() + updatefile7.getOriginalFilename();
    		updatefile7.transferTo(new File(saveFile7));
    		realty.setRealty_image8(saveFile7.substring(saveFile7.lastIndexOf("\\")+1));
    	}
		
        //360이미지 
        if(realty.getImage360().isEmpty()) {
        	realty.setImage360(null);
        }
        
        if(image360 != null) {
        	String path360 = mtpRequest.getSession().getServletContext().getRealPath("files/realty/realty360Images");
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
		
        int result = realtyService.updateRealty(realty);
        if(result > 0) {
        	return "redirect:rmylist.do?user_no=" + realty.getUser_no();
        }else {
			model.addAttribute("message", "매물 수정에 실패하였습니다.");
			return "common/error";
		}
	}
}
