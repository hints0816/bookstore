package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookTrade;
import model.Rank;

@WebServlet("/BookRankServlet")
public class BookRankServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookRankServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
		  response.setContentType("text/html;charset=utf-8");
		  
		  String ranktype=request.getParameter("ranktype");
		  String year=request.getParameter("year");
		  if(year==null)year="";
		  String month=request.getParameter("month");
		  if(month==null)month="";
		  String newmonth="";
		  String quarter=request.getParameter("quarter");
		  if(quarter==null)quarter="";
		 
		  	if(quarter.equals("1")){
		  		newmonth="01";
		  	}else if(quarter.equals("2")){
		  		newmonth="04";
		  	}else if(quarter.equals("3")){
		  		newmonth="07";
		  	}else{
		  		newmonth="10";
		  	}
		  String rankdate=request.getParameter("rankdate");
		  if(rankdate==null)rankdate="";
		  Rank bookrank=new Rank();
		  if(ranktype.equals("1")){
			  try {
					List<Rank> ranklist=null;
					ranklist = bookrank.bookrank(ranktype, rankdate);
					request.setAttribute("ranklist", ranklist);
					request.setAttribute("rankbook", "日图书销量排行榜");
					request.getRequestDispatcher("bookrank/BookRanking.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		  }else if(ranktype.equals("2")){
			  try {
					List<Rank> ranklist=null;
					ranklist = bookrank.bookrank(ranktype, year+"-"+month+"-01");
					request.setAttribute("ranklist", ranklist);
					request.setAttribute("rankbook", "月图书销量排行榜");
					request.getRequestDispatcher("bookrank/BookRanking.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		  }else if(ranktype.equals("3")){
			  try {
					List<Rank> ranklist=null;
					ranklist = bookrank.bookrank(ranktype, year+"-"+newmonth+"-01");
					request.setAttribute("ranklist", ranklist);
					request.setAttribute("rankbook", "季度图书销量排行榜");
					request.getRequestDispatcher("bookrank/BookRanking.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		  }else{
			  try {
					List<Rank> ranklist=null;
					ranklist = bookrank.bookrank(ranktype, year+"-01-01");
					request.setAttribute("ranklist", ranklist);
					request.setAttribute("rankbook", "年图书销量排行榜");
					request.getRequestDispatcher("bookrank/BookRanking.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
				}
		  }
		  
		 
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
