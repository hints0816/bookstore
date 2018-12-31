package Util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBConnection {
	
	private static String driverName;
	private static String url;
	private static String user;
	private static String password;

	private DBConnection() {
	}
	
	static{
		loadConfig();
	}
	//通过配置文件读取数据
	public static void loadConfig(){
		
		try {
			InputStream inStream = DBConnection.class.getResourceAsStream("/config/jdbc.properties");
			Properties prop = new Properties();
			prop.load(inStream);
			user = prop.getProperty("jdbc.username");
			password = prop.getProperty("jdbc.password");
			driverName = prop.getProperty("jdbc.driver");
			url = prop.getProperty("jdbc.url");
		} catch (IOException e) {
			throw new RuntimeException("读取数据库配置文件异常！",e);
		}
	}
	
	static {
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException {
		System.out.println("OK!");
		return DriverManager.getConnection(url, user, password);
	}

	public static void close(ResultSet rs, Statement st, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (st != null) {
					st.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
