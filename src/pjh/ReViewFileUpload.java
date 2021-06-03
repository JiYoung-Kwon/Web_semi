package pjh;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/reviewUpload.do")
@MultipartConfig(
		location = "c:/Temp/",
		maxFileSize = 1024*1024*100,
		maxRequestSize = -1,
		fileSizeThreshold = -1
		)
public class ReViewFileUpload extends HttpServlet {
	ReViewDao dao;
	RequestDispatcher rd;
	final static String saveDir = "C:\\eclipse\\workspace\\Web_Semi\\WebContent\\PJH\\upload\\";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = "";
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		
		String contentType = req.getContentType();
		
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			return;
		}
		
		dao = new ReViewDao();
		ReViewVo rVo = new ReViewVo();
		Page page = new Page();
		List<ReViewAttVo> attList = new ArrayList<ReViewAttVo>();
		List<ReViewAttVo> delList = new ArrayList<ReViewAttVo>();
		boolean delFileFlag = true;
		Collection<Part> parts = req.getParts();

		for(Part p : parts) {
			if(p.getHeader("Content-Disposition").contains("filename=")) {
				String fileName = p.getSubmittedFileName();
				System.out.println(fileName);
				ReViewAttVo attVo = new ReViewAttVo();
				
				String date = sdf.format(new Date());
				
				if(p.getSize() > 0) {
					p.write(saveDir + date +"-" + fileName);
					p.delete();
					
					attVo.setSysAtt(date + "-" + fileName);
					attVo.setOriAtt(fileName);
					attList.add(attVo);
				}
			}else {
				String tagName = p.getName();
				String value = req.getParameter(tagName).trim();
				
				switch(tagName) {
				case "serial"		:
					rVo.setSerial(Integer.parseInt(value));
					rVo.setpSerial(Integer.parseInt(value));
					break;
				case "subject"		:
					rVo.setSubject(value);
					break;
				case "mid"			:
					rVo.setMid(value);
					break;
				case "gubun"		:
					rVo.setGubun(value);
					break;
				case "pwd"		:
					rVo.setPwd(value);
					break;
				case "doc"		:
					rVo.setDoc(value);
					break;				
				case "delFile":
					if(delFileFlag) {
						String[] delFiles = req.getParameterValues(tagName);
						for(String f : delFiles) {
							ReViewAttVo attVo = new ReViewAttVo();
							attVo.setSysAtt(f);
							delList.add(attVo);
						}
						delFileFlag = false;
					}
					break;
				case "nowPage"		:
					page.setNowPage(Integer.parseInt(value));
					break;
				case "findStr"		:
					page.setFindStr(value);
					break;
				}
			}
		}
		
		System.out.println(attList.size());
		rVo.setAttList(attList);
		rVo.setDelList(delList);
		System.out.println(rVo.getAttList());
	
		flag = req.getParameter("flag");

		switch(flag) {
		case "insert"		:
			dao.insert(rVo);
			break;
		case "update":
			dao.update(rVo);
			break;

		}
		
		rd = req.getRequestDispatcher("./PJH/review/re_search.jsp");
		rd.include(req, resp);

	}
	
}
