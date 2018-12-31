package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Util.DBConnection;

public class BookMember {
	private String memid;
	private String memname;
	private String memnumber;
	private String memlevel;
	private String memamount;
	private String memdate;
	
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getMemname() {
		return memname;
	}
	public void setMemname(String memname) {
		this.memname = memname;
	}
	public String getMemnumber() {
		return memnumber;
	}
	public void setMemnumber(String memnumber) {
		this.memnumber = memnumber;
	}
	public String getMemlevel() {
		return memlevel;
	}
	public void setMemlevel(String memlevel) {
		this.memlevel = memlevel;
	}
	public String getMemamount() {
		return memamount;
	}
	public void setMemamount(String memamount) {
		this.memamount = memamount;
	}
	public String getMemdate() {
		return memdate;
	}
	public void setMemdate(String memdate) {
		this.memdate = memdate;
	}
	
	private Map<String, String> errors = new HashMap<String, String>();
	public Map<String, String> getErrors() {
		        return errors;
    }
	public void setErrors(Map<String, String> errors) {
         this.errors = errors;
    }
	public boolean checkBookMember() {
	boolean isOk = true;
	if(this.memid==null||this.memid.equals("")) {
		isOk = false;
		errors.put("memid", "会员编号不能为空！");}
	if (this.memname == null || this.memname.equals("")){
	    isOk = false;
	    errors.put("memname", "会员名字不能为空！");}
	if (this.memnumber == null || this.memnumber.equals("")){
	    isOk = false;
	    errors.put("memnumber", "电话号码不能为空！");}
	if(this.memdate== null || this.memdate.equals("")){ 
		isOk = false;
	    errors.put("memdate", "入会日期不能为空！");}
	return isOk;  
	}
	
	private Map<String, String> errors2 = new HashMap<String, String>();
	public Map<String, String> getErrors2() {
		        return errors2;
    }
	public void setErrors2(Map<String, String> errors2) {
         this.errors2 = errors2;
    }
	public boolean checkBookMember2() {
	boolean isOk = true;
	if(this.memid==null||this.memid.equals("")) {
		isOk = false;
		errors.put("memid", "会员编号不能为空！");}
	if (this.memname == null || this.memname.equals("")){
	    isOk = false;
	    errors.put("memname", "会员名字不能为空！");}
	if (this.memnumber == null || this.memnumber.equals("")){
	    isOk = false;
	    errors.put("memnumber", "电话号码不能为空！");}
	if(this.memlevel== null || this.memlevel.equals("")){ 
		isOk = false;
	    errors.put("memlevel", "会员等级不能为空！");}
	return isOk;  
	}
	
	public double checkmem(String salespersonid)throws Exception{
		double total=0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="call Proc_memberprice(?,?,@total);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, salespersonid);
			ps.setString(2, this.memid);
			
			rs=ps.executeQuery();
			while(rs.next()==true){
				total=Double.valueOf(rs.getString("total"));
			}
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return total;
	}
	
	public void updateMemamount()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql=" update member set "
					+ " memamount=memamount+?"
					+ " where memid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.memamount);
			ps.setString(2, this.memid);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	public BookMember getMemInfo()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BookMember bm= new BookMember();
		try {
			conn = DBConnection.getConnection();
			String sql="select * from member where memid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.memid);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				bm.setMemid(rs.getString("memid"));
				bm.setMemname(rs.getString("memname"));
				bm.setMemnumber(rs.getString("memnumber"));
				bm.setMemdate(rs.getString("memdate"));
				bm.setMemamount(rs.getString("memamount"));
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return bm;
	}
	
	
	public List<BookMember> getAllMemInfo()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BookMember> bmlist =new ArrayList<BookMember>(); 
		try {
			conn = DBConnection.getConnection();
			String sql="select * from member";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				BookMember bm= new BookMember();
				bm.setMemid(rs.getString("memid"));
				bm.setMemname(rs.getString("memname"));
				bm.setMemnumber(rs.getString("memnumber"));
				bm.setMemdate(rs.getString("memdate"));
				bm.setMemamount(rs.getString("memamount"));
				bmlist.add(bm);
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return bmlist;
	}
	
	public String getMemLevel()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String level= "";
		try {
			conn = DBConnection.getConnection();
			String sql="select * from member_level where memid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.memid);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				level = rs.getString("memlevel");
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return level;
	}
	
	public String getMemDiscount(String memlevel)throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String discount= "";
		try {
			conn = DBConnection.getConnection();
			String sql="select * from level_discount where memlevel=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memlevel);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				discount = rs.getString("discount");
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return discount;
	}
	
	public void addMember()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="insert into member"
					+ "(memid,memname,memnumber,memamount,memdate) "
					+ "values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.getMemid());
			ps.setString(2, this.getMemname());
			ps.setString(3, this.getMemnumber());
			ps.setString(4, this.getMemamount());
			ps.setString(5, this.getMemdate());
			
			ps.executeUpdate();
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public void addLevel(String memid)throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="insert into member_level"
					+ "(memid,memlevel) "
					+ "values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			ps.setString(2, "1");
			
			ps.executeUpdate();
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public void UpdateMember()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update member set memname=?,memnumber=?,memamount=?"
					   + "where memid="+this.memid;
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.memname);
			ps.setString(2, this.memnumber);
			ps.setString(3, this.memamount);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public void delMemById(String memid)throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from member where memid="+memid;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	//查重
	public boolean checkMemberById(String memid) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from member where memid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			rs=ps.executeQuery();
			if(rs.next()==true) successflag=true;
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
}
