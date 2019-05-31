package org.kh.sunbang.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kh.sunbang.admin.model.service.AdminService;
import org.kh.sunbang.admin.model.vo.Apaging;
import org.kh.sunbang.admin.model.vo.Editor;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.user.model.vo.Premium;
import org.kh.sunbang.user.model.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	// AdminService DI
	@Autowired
	private AdminService adminService;

	// 풋터 이동
	@RequestMapping(value = "aboutus.do")
	public String moveAboutus() {
		return "admin/aboutus";
	}
	
	@RequestMapping(value = "project.do")
	public String moveProject(HttpServletResponse response, HttpServletRequest request) {
		
		FileInputStream fis = null;
		BufferedOutputStream bos = null;

		try {
			String pdfFileName = request.getSession().getServletContext().getRealPath("/files/admin/project.pdf");

			File pdfFile = new File(pdfFileName);

			// 클라이언트 브라우져에서 바로 보는 방법(헤더 변경)
			response.setContentType("application/pdf");

			// 파일 읽고 쓰는 건 일반적인 Write방식이랑 동일합니다. 다만 reponse 출력 스트림 객체에 write.
			fis = new FileInputStream(pdfFile);

			int size = fis.available(); // 지정 파일에서 읽을 수 있는 바이트 수를 반환
			byte[] buf = new byte[size]; // 버퍼설정
			int readCount = fis.read(buf);
			response.flushBuffer();
			bos = new BufferedOutputStream(response.getOutputStream());
			bos.write(buf, 0, readCount);
			bos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close(); // close는 꼭! 반드시!
				if (bos != null)
					bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "admin/project";
	}

	// 관리자 페이지 표시
	@RequestMapping("auhlistselect.do")
	public ModelAndView adminPageView(ModelAndView mv) {
		int chatCount = adminService.selectCountChat();

		// 새로 가입한 기업회원 수
		int newBUserCount = adminService.selectCountBUser();

		// 새로운 프리미엄 가입자 수
		Integer premiumCount = adminService.selectCountPremium();

		// 신고 미처리 리스트
		ArrayList<Report> rlist = adminService.selectUnHandledList();

		if (rlist != null) {
			mv.addObject("pcount", premiumCount);
			mv.addObject("bucount", newBUserCount);
			mv.addObject("ccount", chatCount);
			mv.addObject("rlist", rlist);
			mv.setViewName("admin/adminPage");
		} else {
			mv.addObject("message", "관리자 페이지 표시에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 결제페이지 이동
	@RequestMapping(value = "paymentPage.do")
	public String movePaymentPageMethod() {
		return "admin/premium/premiumPayment";
	}

	// 신고 관리------------------------------------------------------------------------------
	// 신고 관리 리스트
	@RequestMapping("arlistselect.do")
	public ModelAndView selectReportList(Apaging page, ModelAndView mv, HttpServletRequest request) {
		String keyword, selectval;
		String report_system = request.getParameter("report_system");
		page.setSystem(report_system);
		int currentPage = 1;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		page.setPage(currentPage);
		int limit = 10;
		page.setLimit(limit);

		if (request.getParameter("selectval") != null) {
			selectval = request.getParameter("selectval");
			keyword = request.getParameter("keyword");
			page.setSelectval(selectval);
			page.setKeyword(keyword);
		}

		ArrayList<Report> rlist = adminService.selectReportList(page);

		int listCount = 0;
		if (rlist != null) {
			listCount = rlist.size();
		}

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		page.setMaxpage(maxPage);
		page.setStartpage(startPage);
		page.setEndpage(endPage);

		if (rlist != null) {
			mv.addObject("rlist", rlist);
			mv.addObject("page", page);

			if (report_system.equals("realty")) {
				mv.setViewName("admin/report/reportManagementR");
			} else if (report_system.equals("interior")) {
				mv.setViewName("admin/report/reportManagementI");
			}
		} else {
			mv.addObject("message", "신고 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 신고 상세
	@RequestMapping("ardetailselect.do")
	public ModelAndView selectReportDetail(Report report, ModelAndView mv, HttpServletRequest request) {
		String report_system = request.getParameter("report_system");
		int report_no = Integer.parseInt(request.getParameter("report_no"));
		report.setReport_no(report_no);
		report.setReport_system(report_system);
		report = adminService.selectReportDetail(report);

		if (report != null) {
			mv.addObject("report", report);
			if (report.getReport_system().equals("realty")) {
				mv.setViewName("admin/report/realtyReportDetail");
			} else if (report.getReport_system().equals("interior")) {
				mv.setViewName("admin/report/interiorReportDetail");
			}
		} else {
			mv.addObject("message", "기업회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;

	}

	// 신고 처리
	@RequestMapping("artsupdate.do")
	public void updateReportStatus(Report report, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int report_no = Integer.parseInt(request.getParameter("report_no"));
		int report_status = Integer.parseInt(request.getParameter("status"));
		String report_system = request.getParameter("report_system");
		String contents_status = request.getParameter("contents_status");
		int contents_no = 0;
		
		if (request.getParameter("contents_no") != null) {
			contents_no = Integer.parseInt(request.getParameter("contents_no"));
		}

		report.setReport_no(report_no);
		report.setContents_no(contents_no);
		report.setReport_system(report_system);
		report.setReport_status(report_status);

		if (report_system.equals("realty")) {
			if (report_status == 1) {
				report.setContents_status("검수중");
			} 
			else if (report_status == 2){
				if (contents_status.equals("검수중")) {
					report.setContents_status("광고중");
				}
				else if (contents_status.equals("수정완료")) {
					report.setContents_status("광고중");
				}
			}
			else {
				if (contents_status.equals("검수중")) {
					report.setContents_status("광고중");
				}
			}
		} else if (report_system.equals("interior")) {
			if (report_status == 1) {
				report.setContents_status(Integer.toString(report_status));
			} else {
				if (contents_status.equals("검수중")) {
					report.setContents_status("0");
				}
			}
		}

		int result1 = 0, result2 = 0;

		if (report_status == 1) {
			result1 = adminService.updateContentsStatus(report);
			result2 = adminService.updateReportStatus(report);
		} else {
			if (contents_status.equals("검수중")) {
				result1 = adminService.updateContentsStatus(report);
			}
			else if (contents_status.equals("수정완료")) {
				result1 = adminService.updateContentsStatus(report);
			}
			result2 = adminService.updateReportStatus(report);
		}

		if (result2 > 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.parent.location.reload();";
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
			out.flush();
			out.close();
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "신고 상태 변경 실패!");
			view.forward(request, response);
		}

	}

	// 기업회원 관리페이지
	@RequestMapping("ablistselect.do")
	public ModelAndView selectBusinessList(Apaging page, ModelAndView mv, HttpServletRequest request) {
		String keyword, selectval;

		int currentPage = 1;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		page.setPage(currentPage);
		int limit = 10;
		page.setLimit(limit);

		if (request.getParameter("selectval") != null) {
			selectval = request.getParameter("selectval");
			keyword = request.getParameter("keyword");
			page.setSelectval(selectval);
			page.setKeyword(keyword);
		}

		ArrayList<PremiumFull> blist = adminService.selectBusinessList(page);

		int listCount = 0;
		if (blist != null) {
			listCount = blist.size();
		}

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		page.setMaxpage(maxPage);
		page.setStartpage(startPage);
		page.setEndpage(endPage);

		if (blist != null) {
			mv.addObject("blist", blist);
			mv.addObject("page", page);
			mv.setViewName("admin/user/businessUserManagement");
		} else {
			mv.addObject("message", "기업회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 기업 상태 변경
	@RequestMapping(value = "absupdate.do")
	public void updateBusinessStatus(PremiumFull pfull, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		pfull.setBusiness_user_no(Integer.parseInt(request.getParameter("buserno")));
		pfull.setStatus_agreement(request.getParameter("status"));
		pfull.setUser_no(Integer.parseInt(request.getParameter("user_no")));
		pfull.setUser_status(Integer.parseInt(request.getParameter("user_status")));

		int result1 = adminService.updateUserStatus(pfull);
		int result2 = adminService.updateBusinessStatus(pfull);

		if (result2 > 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.parent.location.reload();";
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
			out.flush();
			out.close();
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "기업회원 상태 변경 실패!");
			view.forward(request, response);
		}
	}

	// 프리미엄 결제 페이지
	@RequestMapping("aplistselect.do")
	public ModelAndView selectPremiumList(Apaging page, ModelAndView mv, HttpServletRequest request) {
		String keyword, selectval;

		int currentPage = 1;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		page.setPage(currentPage);
		int limit = 10;
		page.setLimit(limit);

		if (request.getParameter("selectval") != null) {
			selectval = request.getParameter("selectval");
			keyword = request.getParameter("keyword");
			page.setSelectval(selectval);
			page.setKeyword(keyword);
		}

		ArrayList<PremiumFull> plist = adminService.selectPremiumList(page);
		int listCount = 0;
		if (plist != null) {
			listCount = plist.size();
		}

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		page.setMaxpage(maxPage);
		page.setStartpage(startPage);
		page.setEndpage(endPage);

		if (plist != null) {
			mv.addObject("plist", plist);
			mv.addObject("page", page);
			mv.setViewName("admin/premium/premiumManagement");
		} else {
			mv.addObject("message", "프리미엄 결제 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 기업회원 상세
	@RequestMapping("abdetailselect.do")
	public ModelAndView selectBusinessDetail(ModelAndView mv, HttpServletRequest request) {
		int business_user_no = Integer.parseInt(request.getParameter("business_user_no"));
		int charge_no = 0;
		if (request.getParameter("charge_no") != null) {
			charge_no = Integer.parseInt(request.getParameter("charge_no"));
		}
		PremiumFull pref = new PremiumFull();
		pref.setBusiness_user_no(business_user_no);
		pref.setCharge_no(charge_no);
		pref = adminService.selectBusinessDetail(pref);
		if (pref != null) {
			mv.addObject("pref", pref);
			mv.setViewName("admin/user/businessUserDetail");
		} else {
			mv.addObject("message", "기업회원 상세 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 회원 상세
	@RequestMapping("audetailselect.do")
	public ModelAndView selectUserDetail(ModelAndView mv, HttpServletRequest request) {
		String user_id = request.getParameter("user_id");

		PremiumFull pref = adminService.selectUserDetail(user_id);
		if (pref != null) {
			mv.addObject("pref", pref);
			mv.setViewName("admin/user/businessUserDetail");
		} else {
			mv.addObject("message", "기업회원 상세 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 회원 관리 페이지
	@RequestMapping(value = "aulistselect.do")
	public ModelAndView selectUserList(Apaging page, ModelAndView mv, HttpServletRequest request) {
		String keyword, selectval;

		int currentPage = 1;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		page.setPage(currentPage);
		int limit = 10;
		page.setLimit(limit);

		if (request.getParameter("selectval") != null) {
			selectval = request.getParameter("selectval");
			keyword = request.getParameter("keyword");
			page.setSelectval(selectval);
			page.setKeyword(keyword);
		}

		ArrayList<User> ulist = adminService.selectUserList(page);
		int listCount = 0;
		if (ulist != null) {
			listCount = ulist.size();
		}

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		page.setMaxpage(maxPage);
		page.setStartpage(startPage);
		page.setEndpage(endPage);

		if (ulist != null) {
			mv.addObject("ulist", ulist);
			mv.addObject("page", page);
			mv.setViewName("admin/user/nomalUserManagement");
		} else {
			mv.addObject("message", "회원 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	// 회원상태 변경
	@RequestMapping(value = "ausupdate.do")
	public void updateUserStatus(PremiumFull pfull, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int status = Integer.parseInt(request.getParameter("status"));
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		pfull.setUser_status(status);
		pfull.setUser_no(user_no);
		int result = adminService.updateUserStatus(pfull);
		if (result > 0) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			String str = "";
			str = "<script language='javascript'>";
			str += "opener.parent.location.reload();";
			str += "self.close();"; // 창닫기
			str += "</script>";
			out.print(str);
			out.flush();
			out.close();
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "일반 회원 상태 변경 실패!");
			view.forward(request, response);
		}
	}

	// 회원 사유 변경
	@RequestMapping(value = "aurupdate.do")
	public String updateUserReasonLeave(PremiumFull pfull, HttpServletRequest request) {
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String reason = request.getParameter("reason");
		pfull.setReason_leave(reason);
		pfull.setUser_no(user_no);
		int result = adminService.updateUserReasonLeave(pfull);
		if (result > 0) {
			return "redirect:aulistselect.do?page=1";
		} else {
			return "common/error";
		}
	}

	// 가이드
	// ------------------------------------------------------------------------------
	// 가이드 목록 페이지
	@RequestMapping("aglistselect.do")
	public ModelAndView selectGuideAllList(ModelAndView mv, @RequestParam(name = "guide_system") String guide_system) {
		ArrayList<Guide> galist = adminService.selectGuideAllList(guide_system);
		if (galist != null) {
			mv.addObject("galist", galist);
			if (guide_system.equals("realty")) {
				mv.setViewName("admin/guide/realtyGuideList");
			} else {
				mv.setViewName("admin/guide/interiorGuideList");
			}
		} else {
			mv.addObject("message", "부동산 가이드 전체 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 가이드 상세 조회
	@RequestMapping("agdlselect.do")
	public ModelAndView selectGuideDetail(ModelAndView mv, HttpServletRequest request) {
		String guide_system = request.getParameter("guide_system");
		int guide_no = Integer.parseInt(request.getParameter("guide_no"));
		Guide guide = adminService.selectGuideDetail(guide_no);
		if (guide != null) {
			mv.addObject("guide", guide);
			if (guide_system.equals("realty")) {
				mv.setViewName("admin/guide/realtyGuideDetail");
			} else {
				mv.setViewName("admin/guide/interiorGuideDetail");
			}
		} else {
			mv.addObject("message", "가이드 상세 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 가이드 카테고리별 리스트
	@RequestMapping("agclselect.do")
	public ModelAndView selectGuideList(ModelAndView mv, HttpServletRequest request) {
		String guide_system = request.getParameter("guide_system");
		String category = request.getParameter("category");
		ArrayList<Guide> galist = adminService.selectGuideList(category);
		if (galist != null) {
			mv.addObject("galist", galist);
			if (guide_system.equals("realty")) {
				mv.setViewName("admin/guide/realtyGuideList");
			} else {
				mv.setViewName("admin/guide/interiorGuideList");
			}
		} else {
			mv.addObject("message", "가이드 카테고리별 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 가이드 삭제
	@RequestMapping("agdelete.do")
	public String deleteGuide(HttpServletRequest request) {
		String guide_system = request.getParameter("guide_system");
		int guide_no = Integer.parseInt(request.getParameter("guide_no"));
		int result = adminService.deleteGuide(guide_no);
		if (result > 0) {
			return "redirect:aglistselect.do?guide_system=" + guide_system;
		} else {
			return "common/error";
		}
	}

	// 가이드 등록페이지 표시
	@RequestMapping(value = "aginsertview.do")
	public String moveGuideInsertViewMethod(@RequestParam(name = "guide_system") String guide_system) {
		String view = "";
		if (guide_system.equals("realty")) {
			view = "admin/guide/realtyGuideInsert";
		} else {
			view = "admin/guide/interiorGuideInsert";
		}
		return view;
	}

	// 가이드 수정
	@RequestMapping(value = "agupdateview.do")
	public ModelAndView moveGuideUpdateViewMethod(ModelAndView mv, HttpServletRequest request) {
		String guide_system = request.getParameter("guide_system");
		int guide_no = Integer.parseInt(request.getParameter("guide_no"));
		Guide guide = adminService.selectGuideDetail(guide_no);
		if (guide != null) {
			mv.addObject("guide", guide);
			if (guide_system.equals("realty")) {
				mv.setViewName("admin/guide/realtyGuideUpdate");
			} else {
				mv.setViewName("admin/guide/interiorGuideUpdate");
			}
		} else {
			mv.addObject("message", "가이드 수정 화면 출력에 실패하였습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 가이드 등록
	@RequestMapping(value = "aginsert.do", method = RequestMethod.POST)
	public String guideInsertMethod(@RequestParam(name = "thumbnail", required = false) MultipartFile thumbnail,
			MultipartHttpServletRequest mrequest) {
		Guide guide = new Guide();
		guide.setGuide_system(mrequest.getParameter("guide_system"));
		guide.setCategory(mrequest.getParameter("category"));
		guide.setTitle(mrequest.getParameter("title"));
		guide.setContents(mrequest.getParameter("contents"));

		String savePath = mrequest.getSession().getServletContext().getRealPath("/files/admin/guide");
		String originFileName = thumbnail.getOriginalFilename();
		long fileSize = thumbnail.getSize(); // 파일 사이즈

		String saveFile = savePath + "\\" + System.currentTimeMillis() + originFileName;
		try {
			if (originFileName != "" && fileSize != 0) {
				thumbnail.transferTo(new File(saveFile));
				guide.setThumbnail(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int result = adminService.guideInsert(guide);
		
		if (result > 0) {
			return "redirect:aglistselect.do?guide_system=" + guide.getGuide_system();
		} else {
			return "common/error";
		}
	}

	// 가이드 수정
	@RequestMapping(value = "agupdate.do", method = RequestMethod.POST)
	public String guideUpdateMethod( MultipartHttpServletRequest mrequest) {
		Guide guide = new Guide();
		guide.setGuide_no(Integer.parseInt(mrequest.getParameter("guide_no")));
		guide.setGuide_system(mrequest.getParameter("guide_system"));
		guide.setCategory(mrequest.getParameter("category"));
		guide.setTitle(mrequest.getParameter("title"));
		guide.setContents(mrequest.getParameter("contents"));

		String savePath = mrequest.getSession().getServletContext().getRealPath("/files/admin/guide");
		String ofileName= mrequest.getParameter("othumbnail");
		
		MultipartFile thumbnail = mrequest.getFile("thumbnail");
		
		if(thumbnail.getOriginalFilename() != "" && thumbnail.getSize() != 0) {
			String originFileName = thumbnail.getOriginalFilename();
			long fileSize = thumbnail.getSize(); // 파일 사이즈

			String saveFile = savePath + "\\" + System.currentTimeMillis() + originFileName;
			try {
				if (originFileName != "" && fileSize != 0) {
					thumbnail.transferTo(new File(saveFile));
					guide.setThumbnail(saveFile.substring(saveFile.lastIndexOf("\\") + 1));
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			guide.setThumbnail(ofileName);
		}
		
		int result = adminService.updateGuide(guide);
		
		if (result > 0) {
			return "redirect:agdlselect.do?guide_system=" + guide.getGuide_system()+"&guide_no="+guide.getGuide_no();
		} else {
			return "common/error";
		}
	}

	// 파일 업로드
	@RequestMapping("file_uploader.do")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, Editor editor) {
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func=" + request.getParameter("callback_func");
		String return3 = "";
		String name = "";
		try {
			if (editor.getFiledata() != null && editor.getFiledata().getOriginalFilename() != null
					&& !editor.getFiledata().getOriginalFilename().equals("")) {
				// 기존 상단 코드를 막고 하단코드를 이용
				name = editor.getFiledata().getOriginalFilename()
						.substring(editor.getFiledata().getOriginalFilename().lastIndexOf(File.separator) + 1);
				String filename_ext = name.substring(name.lastIndexOf(".") + 1);
				filename_ext = filename_ext.toLowerCase();
				String[] allow_file = { "jpg", "png", "bmp", "gif" };
				int cnt = 0;
				for (int i = 0; i < allow_file.length; i++) {
					if (filename_ext.equals(allow_file[i])) {
						cnt++;
					}
				}
				if (cnt == 0) {
					return3 = "&errstr=" + name;
				} else {
					// 파일 기본경로
					String dftFilePath = request.getSession().getServletContext().getRealPath("/files/admin/guide/");
					// 파일 기본경로 _ 상세경로
					String filePath = dftFilePath + File.separator;
					File file = new File(filePath);
					if (!file.exists()) {
						file.mkdirs();
					}
					String realFileNm = "";
					SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
					String today = formatter.format(new java.util.Date());
					realFileNm = today + UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
					String rlFileNm = filePath + realFileNm;
					///////////////// 서버에 파일쓰기 /////////////////
					editor.getFiledata().transferTo(new File(rlFileNm));
					///////////////// 서버에 파일쓰기 /////////////////
					return3 += "&bNewLine=true";
					return3 += "&sFileName=" + name;
					return3 += "&sFileURL=/files/admin/upload/" + realFileNm;
				}
			} else {
				return3 += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + return1 + return2 + return3;
	}

	// 다중파일업로드
	@RequestMapping("file_uploader_html5.do")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		try {
			String sFileInfo = "";
			// 파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴
			String filename = request.getHeader("file-name");
			// 파일확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// 파일확장자를 소문자로 변경
			filename_ext = filename_ext.toLowerCase();
			// 이미지 검증 배열변수
			String[] allow_file = { "jpg", "png", "bmp", "gif" };
			// 돌리면서 확장자가 이미지인지
			int cnt = 0;
			for (int i = 0; i < allow_file.length; i++) {
				if (filename_ext.equals(allow_file[i])) {
					cnt++;
				}
			}
			// 이미지가 아님
			if (cnt == 0) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_" + filename);
				print.flush();
				print.close();
			} else {
				// 이미지이므로 신규 파일로 디렉토리 설정 및 업로드
				// 파일 기본경로
				String dftFilePath = request.getSession().getServletContext().getRealPath("/");
				// 파일 기본경로 _ 상세경로
				String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator + "multiupload"
						+ File.separator;
				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today = formatter.format(new java.util.Date());
				realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				String rlFileNm = filePath + realFileNm;
				///////////////// 서버에 파일쓰기 /////////////////
				InputStream is = request.getInputStream();
				OutputStream os = new FileOutputStream(rlFileNm);
				int numRead;
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				while ((numRead = is.read(b, 0, b.length)) != -1) {
					os.write(b, 0, numRead);
				}
				if (is != null) {
					is.close();
				}
				os.flush();
				os.close();
				///////////////// 서버에 파일쓰기 /////////////////
				// 정보 출력
				sFileInfo += "&bNewLine=true";
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				sFileInfo += "&sFileName=" + filename;
				sFileInfo += "&sFileURL=" + "\\sunbang\\resources\\editor\\multiupload\\" + realFileNm;
				PrintWriter print = response.getWriter();
				print.print(sFileInfo);
				print.flush();
				print.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
