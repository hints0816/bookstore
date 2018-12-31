package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookTrade;

@WebServlet("/BookSaleServlet")
public class BookSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookSaleServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置对客户端请求进行重新编码的编码
		request.setCharacterEncoding("utf-8");
		//指定对服务器响应进行重新编码的编码
		response.setContentType("text/html;charset=utf-8");
		
		String salespersonid = (String) request.getSession().getAttribute("salespersonid");
		
		String bookid=request.getParameter("bookid");
		String tradenum=request.getParameter("tradenum");
		
		
		BookTrade bt=new BookTrade();
		bt.setSalespersonid(salespersonid);
		bt.setBookid(bookid);
		bt.setTradenum(tradenum);
		try {
			bt.addBook();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("booksale/BookSaleing.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
