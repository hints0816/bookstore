package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.DBConnection;

/**
 * Servlet implementation class getUserServlet
 */
@WebServlet(description = "test my servlet", urlPatterns = { "/getUserServlet" })
public class getUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String resultstr="";
		//�������ݿ�
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "select id,name, password,sex,age from user";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				int id=rs.getInt("id");
				String name=rs.getString("name");
				String password=rs.getString("password");
				String sex=rs.getString("sex");
				int age=rs.getInt("age");
				resultstr=resultstr+"<tr><td>"+id+"</td><td>"+name+"</td><td>"+password+"</td><td>"+sex+"</td><td>"+age+"</td></tr>";
			}
			out.println("<html>");
	        out.println("<head><title>�û��б�</title></head>");
	        out.println("<body><table><th>�û�id</th><th>�û���</th><th>����</th><th>�Ա�</th><th>����</th>"+resultstr+"</table></body>");
	        out.println("</html>");
		}catch(Exception e){
			out.println("<html>"+
			                 "<head><title>����</title></head>"+
						     "<body>�����ˣ�["+e.getMessage()+"]</body>"+
		                 "</html>");
		}
		finally{
			DBConnection.close(rs, st, conn);
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
