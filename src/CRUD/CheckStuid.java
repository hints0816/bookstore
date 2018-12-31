package CRUD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Util.DBConnection;

public class CheckStuid {

	public static boolean checkid(String Stuid)throws SQLException{
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean successflag1=false;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from user where name='"+Stuid+"'";
			st = conn.createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()==true) successflag1=true;
		} finally {
			DBConnection.close(rs, st, conn);
		}
		return successflag1;
	}
}