package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

/**
 * Servlet Filter implementation class LoginFilter
 */
//
@WebFilter(filterName="/LoginFilter",urlPatterns="/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
    }
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request0 = (HttpServletRequest) arg0;  
	    HttpServletResponse response0 = (HttpServletResponse) arg1;  
	    
	    request0.setCharacterEncoding("utf-8");
	    response0.setCharacterEncoding("utf-8");
	    
	    
	    
	    HttpSession session=request0.getSession();
	    
	    //对登录页面&登录操作放行
	    String exceptPage = "demo.jsp;LoginValid.jsp;images/";  
	    if(null != exceptPage && !"".equals(exceptPage.trim())) {  
            String[] exceptPages = exceptPage.split(";");  
            for (String except : exceptPages) {  
                if(request0.getRequestURI().indexOf(except) != -1) {  
                    arg2.doFilter(arg0, arg1);  
                    return;  
                }  
                  
            }  
        }  
	    //session里的rname只要有值就放行
	   
	    if(session.getAttribute("usertype")!=null){
	    	String exceptPage1 = "LogoutServlet;bookinfo/;bookrank/;booksale/;bookimages/;user/;css/;images/;js/;templet/;BookRankServlet;BookSaleServlet;BookSettleServlet;CheckBookIdServlet;CheckMemberServlet;DeleteBookTradeServlet;updateNumberServlet"; //教师登录成功的放行
	        String exceptPage2 = "LogoutServlet;administrator/;user/;css/;images/;js/;templet/";
	        String usertype=(String)session.getAttribute("usertype");//在session中获取身份
		    if(usertype.equals("2")){//这里我犯了一个小错误，就是我用的是usertype==“2”
		    	if(null != exceptPage1 && !"".equals(exceptPage1.trim())) {  
		            String[] exceptPages1 = exceptPage1.split(";");  
		            for (String except1 : exceptPages1) {  
		                if(request0.getRequestURI().indexOf(except1) != -1) {  
		                    arg2.doFilter(arg0, arg1);  
		                    return;  
		                }  
		            }  
		        }
		    }else{
		    	if(null != exceptPage2 && !"".equals(exceptPage2.trim())) {  
		            String[] exceptPages2 = exceptPage2.split(";");  
		            for (String except2 : exceptPages2) {  
		                if(request0.getRequestURI().indexOf(except2) != -1) {  
		                    arg2.doFilter(arg0, arg1);  
		                    return;  
		                }  
		            }  
		        }
		    }
	    }else{
	    	//重定向到登录界面
	    	response0.sendRedirect(request0.getContextPath()+"/demo.jsp");
	    }
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
