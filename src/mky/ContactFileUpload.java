package mky;

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

@WebServlet(urlPatterns = "/contactUpload.do")
@MultipartConfig(
	   location = "c:/temp/",
	   maxFileSize = 1024*1024*100,
	   maxRequestSize = -1,
	   fileSizeThreshold = -1
)

public class ContactFileUpload extends HttpServlet{
	ContactDao dao;
	RequestDispatcher rd;
	
	final static String saveDir = "C:\\eclipse\\workspace\\Web_Semi\\WebContent\\MKY\\upload\\";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = ""; //insert, update, repl
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSS");
		
		String contentType = req.getContentType();
		if(contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			return;
		}
		
		dao = new ContactDao();
		ContactVo cVo = new ContactVo();
		Page page = new Page();
		List<ContactAttVo> attList = new ArrayList<ContactAttVo>();
		List<ContactAttVo> delList = new ArrayList<ContactAttVo>();
		boolean delFileFlag = true; // 삭제파일 처리 여부
		System.out.println("확인");
		System.out.println(req.getAttribute("mid"));
		System.out.println(req.getAttribute("nowPage"));
		System.out.println(req.getAttribute("findStr"));
		System.out.println(req.getAttribute("serial"));

		if (contentType != null &&  contentType.toLowerCase().startsWith("multipart/")) {
            // getParts()를 통해 Body에 넘어온 데이터들을 각각의  Part로 쪼개어 리턴
		Collection<Part> parts = req.getParts();
		System.out.println(parts.size());
		for(Part p : parts) {
			System.out.printf("파라미터 명 : %s, contentType :  %s,  size : %d bytes \n", p.getName(),
					p.getContentType(), p.getSize());
			if( p.getHeader("Content-Disposition").contains("filename=")) { // file tag
				String fileName = p.getSubmittedFileName();
				ContactAttVo attVo = new ContactAttVo();
				
				String date = sdf.format(new Date());

				if(p.getSize()>0) {
					p.write(saveDir + date + "-" + fileName);
					p.delete();

					attVo.setSysAtt(date + "-" + fileName);
					attVo.setOriAtt(fileName);
					attList.add(attVo);
				}
			}else { // 일반 tag
				String tagName = p.getName();
				String value = req.getParameter(tagName).trim();
				
				switch(tagName) {
					case "serial":
						cVo.setSerial(Integer.parseInt(value));
						cVo.setpSerial(Integer.parseInt(value));
						break;
					case "subject":
						cVo.setSubject(value);
						break;
					case "mid":
						cVo.setMid(value);
						break;
					case "irum":
						cVo.setIrum(value);
						break;
					case "store":
						cVo.setStore(value);
						break;
					case "doc":
						cVo.setDoc(value);
						break;
					case "delFile":
						if(delFileFlag) {
							String[] delFiles = req.getParameterValues(tagName);
							for(String f : delFiles) {
								ContactAttVo attVo = new ContactAttVo();
								attVo.setSysAtt(f);
								delList.add(attVo);
							}
							delFileFlag = false;
						}
						break;
							
						/* page 객체에 담음 */
					case "nowPage":
						page.setNowPage(Integer.parseInt(value));
						break;
					case "findStr":
						page.setFindStr(value);
						break;
				
					}
				}
			}
		}
			cVo.setAttList(attList);
			cVo.setDelList(delList);
			
			flag = req.getParameter("flag");
		
			switch(flag) {
			case "insert":
				dao.insert(cVo);
				break;
//			case "update":
//				dao.update(cVo);
//				break;
			}
			
			rd = req.getRequestDispatcher("./MKY/contact/contact_search.jsp");
			rd.include(req, resp);		
		
		}
		

	@Override
	public void init() throws ServletException {
	
	}
	
	
	
}
