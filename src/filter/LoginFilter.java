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
	    
	    //�Ե�¼ҳ��&��¼��������
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
	    //session���rnameֻҪ��ֵ�ͷ���
	   
	    if(session.getAttribute("usertype")!=null){
	    	String exceptPage1 = "LogoutServlet;bookinfo/;bookrank/;booksale/;bookimages/;user/;css/;images/;js/;templet/;BookRankServlet;BookSaleServlet;BookSettleServlet;CheckBookIdServlet;CheckMemberServlet;DeleteBookTradeServlet;updateNumberServlet"; //��ʦ��¼�ɹ��ķ���
	        String exceptPage2 = "LogoutServlet;administrator/;user/;css/;images/;js/;templet/";
	        String usertype=(String)session.getAttribute("usertype");//��session�л�ȡ���
		    if(usertype.equals("2")){//�����ҷ���һ��С���󣬾������õ���usertype==��2��
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
	    	//�ض��򵽵�¼����
	    	response0.sendRedirect(request0.getContextPath()+"/demo.jsp");
	    }
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
