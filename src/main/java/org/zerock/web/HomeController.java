package org.zerock.web;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.Criteria;
import org.zerock.domain.NewUserVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.PhotoVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.domain.boardVO;
import org.zerock.encryption.Encryption;
import org.zerock.service.BoardService;
import org.zerock.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	UserService service;

	@Inject
	BoardService Bservice;

	@Inject
	Encryption enc;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.POST)
	public String newUser(NewUserVO vo) throws Exception,SQLException {

		String check = service.checkUser(vo);
		if (check != null) {
			return "home";
		}

		String pw = vo.getUpw2();
		vo.setUpw2(enc.encyptPW(pw));

		service.newUser(vo);
		return "home";
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public String newUserGET(NewUserVO vo) throws Exception {

		return "home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String login(UserVO vo, Model model, HttpServletRequest request) throws Exception {

		//String ClientIp = request.getRemoteAddr();

		System.out.println(vo.getUid());
		String pw = vo.getUpw();
		vo.setUpw(enc.encyptPW(pw));
		UserVO userVO = service.login(vo);
		int id = service.checkID(vo.getUid());
		// System.out.println(userVO.getUid());
		if (userVO != null) { // ���� userVO.equals(null)�� �ϸ� �ȵȴ�.

			HttpSession session = request.getSession(true);

			Criteria cri = new Criteria();
			cri.setWriter(userVO.getUid());
			System.out.println(cri.getWriter());
			
			session.setAttribute("userInfo", userVO);

			model.addAttribute("list", Bservice.listCriteria(cri));
			PageMaker maker = new PageMaker();
			maker.setCri(cri);
			
			
			maker.setTotalCount(Bservice.totalCount(cri));
			
			model.addAttribute("pageMaker", maker);

			List<boardVO> boardvo = service.boardList();
			for (int i = 0; i < boardvo.size(); i++) {
				System.out.println(boardvo.get(i).getRegdate());
			}

			return "main";
		} else {
			if (id == 1) {
				model.addAttribute("loginFail", "1");
			} else {
				model.addAttribute("loginFail", "10");
			}

			return "home";
		}

	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String loginGET(UserVO vo, Model model, HttpServletRequest request, Criteria cri) throws Exception {
		
		HttpSession session = request.getSession(false);
		if (session != null) { // session�� null������ üũ�ϴ� ������ timeout�� �Ǽ� session
								// ���� �������� ��� �����̴�.
			if (session.getAttribute("userInfo") == null) {

				return "redirect:/";
			} // http://localhost:8086/main�� �α��� ���� �ٷ� �����ϴ� ���� ���´�. ���� main����������
				// �α����� �� �����Ǵ� session��ü�� ������ login�������� �̵�
		} else {
			return "redirect:/";
		}
		
		UserVO currentUser = (UserVO)session.getAttribute("userInfo");
		
		cri.setWriter(currentUser.getUid());
		model.addAttribute("list", Bservice.listCriteria(cri));

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(Bservice.totalCount(cri));

		model.addAttribute("pageMaker", maker);
		
		

		return "main";
	}

	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String logOutGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession(false);

		if (session != null) {// session�� null������ üũ�ϴ� ������ timeout�� �Ǽ� session
								// ���� �������� ��� �����̴�. ���� session���� ���� ���¿���
								// invalidate()�� �ϸ� �������ȴ�.
			session.invalidate();
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/checkID", method = RequestMethod.POST)
	public ResponseEntity<String> checkID(@RequestBody NewUserVO vo) {
		ResponseEntity<String> entity = null;
		int checkIDcount;

		System.out.println(vo.getUid2());
		try {
			checkIDcount = service.checkID(vo.getUid2());
			if (checkIDcount == 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void readPage(@RequestParam int bno, @RequestParam int page, Model model) throws Exception {
		System.out.println(bno + " " + page);
		model.addAttribute("boardVO", Bservice.read(bno));
		model.addAttribute("page", page);

	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam int bno) throws Exception {
		Bservice.remove(bno);

		// return "main"; //�̰����� ���� �� services �κ��� �������� ������ �ȴ�. �̰����� �ϸ� get�������
		// post ������� ���� ���پƮ�� post get �Ѵ� ��������
		return "redirect:/main?page=1#services";
	}

	@RequestMapping(value = "/newBoard", method = RequestMethod.GET)
	public String newBoard(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null) {
			if (session.getAttribute("userInfo") == null) {
				return "redirect:/";
			}
		} else {
			return "redirect:/";
		}

		return "newBoard";
	}

	@RequestMapping(value = "/addBoard", method = RequestMethod.POST)
	public String addBoard(boardVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);

		UserVO uvo = (UserVO) session.getAttribute("userInfo");

		vo.setWriter(uvo.getUid());
		System.out.println(vo.getTitle());
		System.out.println(vo.getContent());
		Bservice.addBoard(vo);

		return "redirect:/main?page=1#services";
	}

	// ���� ���� ���ε�
	@RequestMapping(value = "/photoUpload", method = RequestMethod.POST)
	public String photoUpload(HttpServletRequest request, PhotoVO vo) {
		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";
		try {
			if (vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null
					&& !vo.getFiledata().getOriginalFilename().equals("")) {
				// ������ �����ϸ�
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// ���� �⺻���
				String defaultPath = request.getSession().getServletContext().getRealPath("/");
				// ���� �⺻��� _ �󼼰��
				String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;
				File file = new File(path);
				System.out.println("path:" + path);
				// ���丮 �������� ������� ���丮 ����
				if (!file.exists()) {
					file.mkdirs();
				}

				// ������ ���ε� �� ���ϸ�(�ѱ۹����� ���� ���������� �ø��� �ʴ°��� ����)
				String realname = UUID.randomUUID().toString() + "." + ext;
				///////////////// ������ ���Ͼ��� /////////////////
				vo.getFiledata().transferTo(new File(path + realname));
				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=/resource/photo_upload/"
						+ realname;
			} else {
				file_result += "&errstr=error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
	}

	// �������Ͼ��ε�
	@RequestMapping(value = "/multiplePhotoUpload", method = RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// ��������
			String sFileInfo = "";
			// ���ϸ��� �޴´� - �Ϲ� �������ϸ�
			String filename = request.getHeader("file-name");
			// ���� Ȯ����
			String filename_ext = filename.substring(filename.lastIndexOf(".") + 1);
			// Ȯ���ڸ��ҹ��ڷ� ����
			filename_ext = filename_ext.toLowerCase();
			
			// ���� �⺻���
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			// ���� �⺻��� _ �󼼰��
			//String filePath = dftFilePath + "resources" + File.separator + "photo_upload" + File.separator;
			String filePath = "G:/upload/";
			System.out.println(filePath);
			
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;
			
			///////////////// ������ ���Ͼ��� /////////////////
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
			///////////////// ������ ���Ͼ��� /////////////////
			// ���� ���
			sFileInfo += "&bNewLine=true";
			// img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "/upload/" + realFileNm;
			System.out.println(realFileNm);
			PrintWriter print = response.getWriter();
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/calendarForm", method = RequestMethod.GET)
	public String calendarForm() throws Exception {
	
		return "redirect:/main#portfolio";
	}
	

	
	@RequestMapping(value="/searchList",method=RequestMethod.GET)
	public String searchList(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model) throws Exception{
		HttpSession loginSession = request.getSession(false);
		
		if(loginSession != null){
			if(loginSession.getAttribute("userInfo") == null){
				return "redirect:/";
			}
		}else{
			return "redirect:/";
		}
		
		System.out.println(cri.getSearchType());
		
		UserVO uvo = (UserVO)loginSession.getAttribute("userInfo");
		
		cri.setWriter(uvo.getUid());
		
		model.addAttribute("list", Bservice.listSearchCriteria(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		
		
		maker.setTotalCount(Bservice.totalSearchCount(cri));
		
		model.addAttribute("pageMaker", maker);
		
		model.addAttribute("type", cri.getSearchType());
		
		return "main";
		
	}
}
