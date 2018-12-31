package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.persistence.*;

import Util.DBConnection;

import java.util.Date;


/**
 * The persistent class for the administrators database table.
 * 
 */
@Entity
@Table(name="administrators")
@NamedQuery(name="Administrator.findAll", query="SELECT a FROM Administrator a")
public class Administrator implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String administratorid;

	private String accountname;

	private String administratorage;

	private String administratorbirthday;

	private String administratorname;

	private String administratorsex;

	public Administrator() {
	}

	public String getAdministratorid() {
		return this.administratorid;
	}

	public void setAdministratorid(String administratorid) {
		this.administratorid = administratorid;
	}

	public String getAccountname() {
		return this.accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getAdministratorage() {
		return this.administratorage;
	}

	public void setAdministratorage(String administratorage) {
		this.administratorage = administratorage;
	}

	public String getAdministratorbirthday() {
		return this.administratorbirthday;
	}

	public void setAdministratorbirthday(String administratorbirthday) {
		this.administratorbirthday = administratorbirthday;
	}

	public String getAdministratorname() {
		return this.administratorname;
	}

	public void setAdministratorname(String administratorname) {
		this.administratorname = administratorname;
	}

	public String getAdministratorsex() {
		return this.administratorsex;
	}

	public void setAdministratorsex(String administratorsex) {
		this.administratorsex = administratorsex;
	}
	
	public Administrator getByAccount()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Administrator as= new Administrator();
		try {
			conn = DBConnection.getConnection();
			String sql="select * from administrators where accountname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.accountname);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				as.setAdministratorid(rs.getString("administratorid"));
				as.setAdministratorname(rs.getString("administratorname"));
				as.setAdministratorage(rs.getString("administratorage"));
				as.setAdministratorbirthday(rs.getString("administratorbirthday"));
				as.setAdministratorsex(rs.getString("administratorsex"));
				as.setAccountname(rs.getString("accountname"));
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return as;
	}
}