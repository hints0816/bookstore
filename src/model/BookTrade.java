package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import Util.DBConnection;

public class BookTrade {
	private String salespersonid;
	private String bookid;
	private String tradenum;
	private String tradesum;
	private String tradetime;
	
	
	public String getSalespersonid() {
		return salespersonid;
	}
	public void setSalespersonid(String salespersonid) {
		this.salespersonid = salespersonid;
	}
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getTradenum() {
		return tradenum;
	}
	public void setTradenum(String tradenum) {
		this.tradenum = tradenum;
	}
	public String getTradesum() {
		return tradesum;
	}
	public void setTradesum(String tradesum) {
		this.tradesum = tradesum;
	}
	public String getTradetime() {
		return tradetime;
	}
	public void setTradetime(String tradetime) {
		this.tradetime = tradetime;
	}
	public void addBook()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="CALL Proc_addbooktrade(?,?,?);";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.getSalespersonid());
			ps.setString(2, this.bookid);
			ps.setString(3, this.getTradenum());
		
			ps.executeUpdate();
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public List<BookTrade> displaysale(String salespersonid)throws SQLException{
		List<BookTrade> trade=new ArrayList<BookTrade>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from booktrade where salespersonid=? order by tradetime";
			ps = conn.prepareStatement(sql);
			ps.setString(1, salespersonid);
			rs=ps.executeQuery();
			while(rs.next()==true){
				BookTrade bt=new BookTrade();
				bt.setBookid(rs.getString("bookid"));
				bt.setTradenum(rs.getString("tradenum"));
				bt.setTradesum(rs.getString("tradesum"));
				bt.setTradetime(rs.getString("tradetime"));
				trade.add(bt);
			}
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return trade;
	}
	
	public String getBookSum(String salespersonid)throws Exception{
		DecimalFormat df=new DecimalFormat("######0.00");
		String sum = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql="select sum(tradesum) as trsum from booktrade where salespersonid=?";
			ps = conn.prepareStatement(sql);	
			ps.setString(1, salespersonid);
			rs=ps.executeQuery();
			while(rs.next()==true){
				double bd=rs.getDouble("trsum");
				sum=df.format(bd);
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return sum;
	}
	//清空交易备份表
	public void delBookTradeById()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from booktrade where bookid = ? and salespersonid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.bookid);
			ps.setString(2, this.salespersonid);
			ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}		finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public void updateBookTrade()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql=" update booktrade set "
					+ " tradenum=?,tradesum=?"
					+ " where bookid=? and salespersonid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.tradenum);
			ps.setString(2, this.tradesum);
			ps.setString(3, this.bookid);
			ps.setString(4, this.salespersonid);
			
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	//交易备份表是否已经存在改同名id的商品
	public boolean determineTrade(String bookid,String salespersonid) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from booktrade where bookid = ? and salespersonid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookid);
			ps.setString(2, salespersonid);
			rs=ps.executeQuery();
			if(rs.next()==true) successflag=true;
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
	
	public String getCount(String salespersonid) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String count = "";
		try {
			conn = DBConnection.getConnection();
			String sql = "select sum(tradenum) as count from booktrade where salespersonid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, salespersonid);
			rs=ps.executeQuery();
			if(rs.next()==true){
				count = rs.getString("count");
			}
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return count;
	}
}
