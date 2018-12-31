package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BookMember;
import model.BookTrade;

import net.sf.json.JSONArray;

@WebServlet("/CheckMemberServlet")
public class CheckMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckMemberServlet() {
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
			String memid = request.getParameter("memid");
			String salespersonid = (String) session.getAttribute("salespersonid"); 
			  
			BookMember bm = new BookMember();
			BookMember bm2 = new BookMember();
			BookTrade bt = new BookTrade();
			bm.setMemid(memid);
			double total=0;
			String sum="";
			String memname="";
			String memlevel="";
			String discount="";
			try {
				total = bm.checkmem(salespersonid);
				bm2 = bm.getMemInfo();
				memlevel = bm.getMemLevel();
				discount = bm.getMemDiscount(memlevel);
				memname = bm2.getMemname();
			} catch (Exception e) {
				e.printStackTrace();
			}
			List<String> datas = new ArrayList<String>();
				if(total==0){
					try {
						sum = String.valueOf(total);
						String oriprice =  bt.getBookSum(salespersonid);
						String jsonarray= "['"+oriprice+"']";
						response.getWriter().write(JSONArray.fromObject(jsonarray).toString());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else{
					sum = String.valueOf(total);
					datas.add(sum);
					datas.add(memname);
					datas.add(discount);
			response.getWriter().write(JSONArray.fromObject(datas).toString());
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
