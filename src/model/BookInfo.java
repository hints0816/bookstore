package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import Util.DBConnection;

public class BookInfo {
	private String bookid;
	private String bookname;
	private String author;
	private String price;
	private String category;
	private String publish;
	private String publish_date;
	private String bookcount;
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}
	public String getBookcount() {
		return bookcount;
	}
	public void setBookcount(String bookcount) {
		this.bookcount = bookcount;
	}
	
	private Map<String, String> errors = new HashMap<String, String>();
	public Map<String, String> getErrors() {
		        return errors;
    }
	public void setErrors(Map<String, String> errors) {
         this.errors = errors;
    }
	public boolean checkBook() {
	boolean isOk = true;
	if(this.bookid==null||this.bookid.equals("")) {
		isOk = false;
		errors.put("bookid", "书号不能为空！");
		}
	if(this.bookname==null||this.bookname.equals("")) {
		isOk = false;
		errors.put("bookname", "书名不能为空！");
	}
	if(this.author==null||this.author.equals("")) {
		isOk = false;
		errors.put("author", "作者不能为空！");
	}
	if(this.price==null||this.price.equals("")) {
		isOk = false;
		errors.put("price", "价格不能为空！");
	}
	if(this.category==null||this.category.equals("")) {
		isOk = false;
		errors.put("category", "图书类别不能为空！");
	}
	if(this.publish==null||this.publish.equals("")) {
		isOk = false;
		errors.put("publish", "出版社不能为空！");
	}
	if(this.publish_date==null||this.publish_date.equals("")) {
		isOk = false;
		errors.put("publish_date", "出版日期不能为空！");
	}
	if(this.bookcount==null||this.bookcount.equals("")) {
		isOk = false;
		errors.put("bookcount", "库存不能为空！");
	}
	return isOk;  
	}
	
	@Test
	public String getsum(String num,String bid)throws Exception{
		DecimalFormat df=new DecimalFormat("######0.00");
		String sum = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int n=Integer.parseInt(num);
		try {
			conn = DBConnection.getConnection();
			String sql="select price from bookinfo where bookid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bid);
			
			rs=ps.executeQuery();
			while(rs.next()==true){
				double bd=rs.getDouble("price");
				sum=df.format(bd * n);
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return sum;
	}
	
	//差重
	public boolean checkBookById(String bookid) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from bookinfo where bookid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookid);
			rs=ps.executeQuery();
			if(rs.next()==true) successflag=true;
		} finally {
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
	
	public BookInfo getBookInfo()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BookInfo bi= new BookInfo();
		try {
			conn = DBConnection.getConnection();
			String sql="select * from bookinfo where bookid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.bookid);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				bi.setBookid(rs.getString("bookid"));
				bi.setBookname(rs.getString("bookname"));
				bi.setAuthor(rs.getString("author"));
				bi.setCategory(rs.getString("category"));
				bi.setBookcount(rs.getString("bookcount"));
				bi.setPublish(rs.getString("publish"));
				bi.setPublish_date(rs.getString("publish_date"));
				bi.setPrice(rs.getString("price"));
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return bi;
	}
	public List<BookInfo> getAllBookInfo()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BookInfo> bil= new ArrayList<BookInfo>();
		try {
			conn = DBConnection.getConnection();
			String sql="select * from bookinfo";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				BookInfo bi= new BookInfo();
				bi.setBookid(rs.getString("bookid"));
				bi.setBookname(rs.getString("bookname"));
				bi.setAuthor(rs.getString("author"));
				bi.setCategory(rs.getString("category"));
				bi.setBookcount(rs.getString("bookcount"));
				bi.setPublish(rs.getString("publish"));
				bi.setPublish_date(rs.getString("publish_date"));
				bi.setPrice(rs.getString("price"));
				bil.add(bi);
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return bil;
	}
	
	public void AddBook()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into bookinfo(bookid,bookname,author,price,category,publish,publish_date,bookcount)"
					   + " values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.valueOf(this.bookid));
			ps.setString(2, this.getBookname());
			ps.setString(3, this.getAuthor());
			ps.setString(4, this.getPrice());
			ps.setString(5, this.getCategory());
			ps.setString(6, this.getPublish());
			ps.setString(7, this.getPublish_date());
			ps.setString(8, this.getBookcount());
			ps.executeUpdate();
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	public void UpdateBook()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update bookinfo set bookname=?,author=?,price=?,category=?,publish=?,publish_date=?,bookcount=?"
					   + "where bookid="+this.bookid;
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.bookname);
			ps.setString(2, this.author);
			ps.setString(3, this.price);
			ps.setString(4, this.category);
			ps.setString(5, this.publish);
			ps.setString(6, this.publish_date);
			ps.setString(7, this.bookcount);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	public void delBookById(String bookid)throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from bookinfo where bookid="+bookid;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} finally {
			DBConnection.close(rs, ps, conn);
		}
	}
	
	public List<BookInfo> searchBook(String bookname,String publish,String author,String category)throws SQLException{
		List<BookInfo> bookinfo=new ArrayList<BookInfo>();
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from bookinfo where bookname like CONCAT('%',?,'%') and publish like CONCAT('%',?,'%') and author like CONCAT('%',?,'%') and category like CONCAT('%',?,'%');";
			st = conn.prepareStatement(sql);
			st.setString(1, bookname);
			st.setString(2, publish);
			st.setString(3, author);
			st.setString(4, category);
			rs=st.executeQuery();
			while(rs.next()==true){
				BookInfo bi= new BookInfo();
				bi.setBookid(rs.getString("bookid"));
				bi.setBookname(rs.getString("bookname"));
				bi.setAuthor(rs.getString("author"));
				bi.setCategory(rs.getString("category"));
				bi.setBookcount(rs.getString("bookcount"));
				bi.setPublish(rs.getString("publish"));
				bi.setPublish_date(rs.getString("publish_date"));
				bi.setPrice(rs.getString("price"));
				bookinfo.add(bi);
			}
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return bookinfo;
	}
}
