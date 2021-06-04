package kjy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

@WebServlet(urlPatterns = "/boardUpload")
@MultipartConfig(location = "C:/Temp/", maxFileSize = 1024 * 1024 * 100, maxRequestSize = -1, fileSizeThreshold = -1)

public class BoardFileUpload extends HttpServlet {
	BoardGameDao dao;
	RequestDispatcher rd;

	final static String saveDir = "C:\\eclipse\\workspace\\Web_Semi\\WebContent\\KJY\\upload\\";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = ""; // insert, update, repl

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");

		String contentType = req.getContentType();

		if (contentType == null || !contentType.toLowerCase().startsWith("multipart/")) {
			return;
		}

		dao = new BoardGameDao();
		BoardGameVo bVo = new BoardGameVo();
		Page page = new Page();

		Collection<Part> parts = req.getParts();
		for (Part p : parts) {
			if (p.getHeader("Content-Disposition").contains("filename=")) { // file tag
				String fileName = p.getSubmittedFileName();
				bVo.setOriAtt(fileName);

				String date = sdf.format(new Date());

				if (p.getSize() > 0) {
					p.write(saveDir + date + "-" + fileName);
					p.delete();
					bVo.setSysAtt(date + "-" + fileName);
				}

			} else { // file tag가 아닌 경우
				String tagName = p.getName();
				String value = req.getParameter(tagName).trim();

				switch (tagName) {
				case "bName":
					bVo.setbName(value);
					break;
				case "eName":
					bVo.seteName(value);
					break;
				case "expl":
					bVo.setExpl(value);
					break;
				case "diff":
					bVo.setDiff(value);
					break;
				case "minPerson":
					bVo.setMinPerson(Integer.parseInt(value));
					break;
				case "maxPerson":
					bVo.setMaxPerson(Integer.parseInt(value));
					break;
				case "minTime":
					bVo.setMinTime(Integer.parseInt(value));
					break;
				case "maxTime":
					bVo.setMaxTime(Integer.parseInt(value));
					break;
				case "store":
					bVo.setStore(value);
					break;
				case "genre":
					bVo.setGenre(value);
					break;
				case "gubun":
					bVo.setGubun(value );
				case "findStr":
					page.setFindStr(value);
					break;
				case "nowPage":
					page.setNowPage(Integer.parseInt(value));
					break;
				}
			}
		}

		flag = req.getParameter("flag");

		switch (flag) {
		case "insert":
			dao.insert(bVo);
			break;

		case "update": 
			dao.update(bVo); 
			break;
		}

		rd = req.getRequestDispatcher("./KJY/board/search.jsp");
		rd.include(req, resp);

	}
}