package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Util.DBConnection;

public class Users {
	private String accountname;
	private String password;
	private String usertype;
	
	public Users() {
		super();
	}
	public String getAccountname() {
		return accountname;
	}
	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	
	private Map<String, String> errors = new HashMap<String, String>();
	public Map<String, String> getErrors() {
		        return errors;
    }
	public void setErrors(Map<String, String> errors) {
         this.errors = errors;
    }
	public boolean checkUser() {
	boolean isOk = true;
	if(this.accountname==null||this.accountname.equals("")) {
		isOk = false;
		errors.put("accountname", "用户名不能为空！");}
	if (this.password == null || this.password.equals("")){
	    isOk = false;
	    errors.put("password", "用户密码不能为空！");}
	if (this.usertype == null || this.usertype.equals("")){
	    isOk = false;
	    errors.put("usertype", "请选择用户类型！");}
	return isOk;  
	}
	
	public boolean validlogin()throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user where accountname=? and password=? and usertype=?";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, this.accountname);
			ps.setString(2, this.password);
			ps.setString(3, this.usertype);
			
			rs=ps.executeQuery();
			if(rs.next()==true) successflag=true;
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
	
	public void addUser()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="insert into user"
					+ "(accountname,password,usertype) "
					+ "values(?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.accountname);
			ps.setString(2, this.password);
			ps.setString(3, this.usertype);
			
			ps.executeUpdate();
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public List<Users> getAllUserInfo()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Users> bmlist =new ArrayList<Users>(); 
		try {
			conn = DBConnection.getConnection();
			String sql="select * from user";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				Users bm= new Users();
				bm.setAccountname(rs.getString("accountname"));
				bm.setUsertype(rs.getString("usertype"));
				bm.setPassword(rs.getString("password"));
				bmlist.add(bm);
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return bmlist;
	}
	
	public void delUserById(String accountname)throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from user where accountname="+accountname;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public void UpdatePassword()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update user set password='123456'"
					   + "where accountname="+this.accountname;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
}
