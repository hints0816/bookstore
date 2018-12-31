package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import Util.DBConnection;

public class Rank {
	private String bookname;
	private String bookcount;
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookcount() {
		return bookcount;
	}
	public void setBookcount(String bookcount) {
		this.bookcount = bookcount;
	}
	
	//œ˙¡ø≈≈––
	public List<Rank> bookrank(String type,String date)throws SQLException{
		List<Rank> rank=new ArrayList<Rank>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "call Proc_bookrank(?,?);";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, type);
			ps.setString(2, date);
			
			rs=ps.executeQuery();
			while(rs.next()==true){
				Rank rk=new Rank();
				rk.setBookname(rs.getString("bookname"));
				rk.setBookcount(rs.getString("bookcount"));
				rank.add(rk);
			}
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return rank;
	}
	
}
