package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookInfo;
import model.BookTrade;
import net.sf.json.JSONArray;

@WebServlet("/CheckBookIdServlet")
public class CheckBookIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckBookIdServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���öԿͻ�������������±���ı���
		request.setCharacterEncoding("utf-8");
		//ָ���Է�������Ӧ�������±���ı���
		response.setContentType("text/html;charset=utf-8");
			
		String bookid=request.getParameter("bookid");
		
		BookInfo bi=new BookInfo();
		
		boolean exist=true;
		try {
			exist = bi.checkBookById(bookid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			if(exist==false){
				if(bookid.equals("")){
					String jsonarray= "['']";
					response.getWriter().write(JSONArray.fromObject(jsonarray).toString());
				}else{
					String jsonarray= "['��Ų�����']";
					response.getWriter().write(JSONArray.fromObject(jsonarray).toString());
				}
	}else{
		String jsonarray= "['']";
		response.getWriter().write(JSONArray.fromObject(jsonarray).toString());
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
