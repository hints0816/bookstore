package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BookInfo;
import model.BookMember;
import model.BookTrade;
import model.SaleSlip;

@WebServlet("/BookSettleServlet")
public class BookSettleServlet extends HttpServlet {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BookSettleServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置对客户端请求进行重新编码的编码
		request.setCharacterEncoding("utf-8");
		//指定对服务器响应进行重新编码的编码
		response.setContentType("text/html;charset=utf-8");
			
		String salespersonid = (String) request.getSession().getAttribute("salespersonid");
		
		String memid = request.getParameter("memid");
		try {
			SaleSlip ss=new SaleSlip();
			ss.setSalerid(salespersonid);
			ss.addSaleSlip(memid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("booksale/BookSaleing.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
