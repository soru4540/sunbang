package org.kh.sunbang.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kh.sunbang.admin.model.service.AdminService;
import org.kh.sunbang.admin.model.vo.Guide;
import org.kh.sunbang.admin.model.vo.PremiumFull;
import org.kh.sunbang.admin.model.vo.Report;
import org.kh.sunbang.user.model.vo.Premium;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "adminPage.do")
	public String moveAdminPageMethod() {
		return "admin/adminPage";
	}

	@RequestMapping(value = "paymentPage.do")
	public String movePaymentPageMethod() {
		return "admin/premium/premiumPayment";
	}

	@RequestMapping("aulistselect.do")
	public ModelAndView selectUnHandledList(ModelAndView mv) {

		ArrayList<Report> rlist = adminService.selectUnHandledList();

		if (rlist != null) {
			mv.addObject("rlist", rlist);
			mv.setViewName("admin/adminPage");
		} else {
			mv.addObject("message", "미처리 신고 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	@RequestMapping("abdetailselect.do")
	public ModelAndView selectBusinessDetail(ModelAndView mv, HttpServletRequest request) {
		int business_user_no = Integer.parseInt(request.getParameter("business_user_no"));
		PremiumFull pref = adminService.selectBusinessDetail(business_user_no);
		if (pref != null) {
			mv.addObject("pref", pref);
			mv.setViewName("admin/user/businessUserDetail");
		} else {
			mv.addObject("message", "가이드 상세 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

	@RequestMapping("aplistselect.do")
	public ModelAndView selectPremiumList(ModelAndView mv, HttpServletRequest request) {
		// 페이지별로 출력되는 게시글 전체 조회 처리용 컨트롤러
		// 출력될 페이지 기본값 지정
		int currentPage = 1;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// 한 페이지에 출력할 목록 갯수 지정
		int limit = 10;
		// 테이블에 저장된 전체 목록 갯수 조회
		int listCount = adminService.selectListCount();

		// 현재 페이지에 출력할 목록 조회
		ArrayList<PremiumFull> plist = adminService.selectPremiumList(currentPage, limit);
		// System.out.println("list : " + list);

		// 총 페이지수 계산 : 목록이 마지막 1개일 때 1페이지로 처리
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지그룹(10개 페이지를 한 그룹으로 처리)에
		// 보여줄 시작 페이지 수
		// 현재 페이지가 13이면 그룹은 11~20이 보여지게 함
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		if (plist != null) {
			mv.addObject("plist", plist);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			mv.setViewName("admin/premium/premiumManagement");
		} else {
			mv.addObject("message", "프리미엄 결제 목록 조회에 실패하였습니다.");
			mv.setViewName("common/error");
		}

		return mv;
	}

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

	@RequestMapping("agdlselect.do")
	public ModelAndView selectGuideAllList(ModelAndView mv, HttpServletRequest request) {
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

		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

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
		System.out.println(guide);

		int result = adminService.guideInsert(guide);
		if (result > 0) {
			return "redirect:aglistselect.do?guide_system=" + guide.getGuide_system();
		} else {
			return "common/error";
		}
	}

	/*@RequestMapping(value = "/file_uploader")
	public String file_uploader(HttpServletRequest request, HttpServletResponse response, Editor editor) {
		System.out.println("fileuploader실행");
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
					String filePath = dftFilePath + "upload" + File.separator;
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
	@RequestMapping(value = "/file_uploader_html5")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("fileUploaderhtml5.do 실행");
		try {
			String sFileInfo = "";
			// 파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴
			String name = request.getHeader("file-name");
			String ext = name.substring(name.lastIndexOf(".") + 1);
			// 파일 기본경로
			String defaultPath = request.getSession().getServletContext().getRealPath("/");
			// 파일 기본경로 _ 상세경로
			String path = defaultPath + "files" + File.separator+ "admin" + File.separator+ "guide" + File.separator+ "upload" + File.separator;
			System.out.println("path : " + path);
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realname = UUID.randomUUID().toString() + "." + ext;
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(path + realname);
			int numRead;
			// 파일쓰기
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null) {
				is.close();
			}
			os.flush();
			os.close();
			sFileInfo += "&bNewLine=true&sFileName=" + name + "&sFileURL=" + "/files/admin/guide/upload/" + realname;
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
