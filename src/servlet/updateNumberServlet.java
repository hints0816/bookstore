package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookInfo;
import model.BookMember;
import model.BookTrade;

import net.sf.json.JSONArray;

@WebServlet("/updateNumberServlet")
public class updateNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateNumberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置对客户端请求进行重新编码的编码
		request.setCharacterEncoding("utf-8");
		//指定对服务器响应进行重新编码的编码
		response.setContentType("text/html;charset=utf-8");
			HttpSession session = request.getSession();
			String salespersonid = (String) session.getAttribute("salespersonid"); 
			String bookid=request.getParameter("bookid");
			String sum=request.getParameter("sum"); 
			
			System.out.println(salespersonid);
			System.out.println(bookid);
			System.out.println(sum);
			
			BookTrade bt = new BookTrade();
			BookInfo bi = new BookInfo();
			bt.setBookid(bookid);
			bt.setTradenum(sum);
			String booktotal;
			try {
				booktotal = bi.getsum(sum, bookid);
				bt.setTradesum(booktotal);
				bt.setSalespersonid(salespersonid);
				bt.updateBookTrade();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
