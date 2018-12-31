package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.persistence.*;

import Util.DBConnection;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * The persistent class for the salesperson database table.
 * 
 */
@Entity
@NamedQuery(name="Salesperson.findAll", query="SELECT s FROM Salesperson s")
public class Salesperson implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String salespersonid;

	private String accountname;

	private String salesage;

	private String salesbirthday;

	private String salesname;

	private String salessex;

	public Salesperson() {
	}

	public String getSalespersonid() {
		return this.salespersonid;
	}

	public void setSalespersonid(String salespersonid) {
		this.salespersonid = salespersonid;
	}

	public String getAccountname() {
		return this.accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getSalesage() {
		return this.salesage;
	}

	public void setSalesage(String salesage) {
		this.salesage = salesage;
	}

	public String getSalesbirthday() {
		return this.salesbirthday;
	}

	public void setSalesbirthday(String salesbirthday) {
		this.salesbirthday = salesbirthday;
	}

	public String getSalesname() {
		return this.salesname;
	}

	public void setSalesname(String salesname) {
		this.salesname = salesname;
	}

	public String getSalessex() {
		return this.salessex;
	}

	public void setSalessex(String salessex) {
		this.salessex = salessex;
	}
	
	@Transient//���ע����ȡ���־û�
	private Map<String, String> errors = new HashMap<String, String>();
	public Map<String, String> getErrors() {
		        return errors;
    }
	@Transient
	public void setErrors(Map<String, String> errors) {
         this.errors = errors;
    }
	
	public boolean checkSales() {
	boolean isOk = true;
	if(this.salespersonid==null||this.salespersonid.equals("")) {
		isOk = false;
		errors.put("salespersonid", "����Ա�Ų���Ϊ�գ�");}
	if (this.salesname == null || this.salesname.equals("")){
	    isOk = false;
	    errors.put("salesname", "����Ա���ֲ���Ϊ�գ�");}
	if (this.salesage == null || this.salesage.equals("")){
	    isOk = false;
	    errors.put("salesage", "���䲻��Ϊ�գ�");}
	if(this.salessex== null || this.salessex.equals("")){ 
		isOk = false;
	    errors.put("salessex", "�Ա���Ϊ�գ�");}
	if(this.salesbirthday== null || this.salesbirthday.equals("")){ 
		isOk = false;
	    errors.put("salesbirthday", "�������ڲ���Ϊ�գ�");}
	if(this.accountname== null || this.accountname.equals("")){ 
		isOk = false;
	    errors.put("accountname", "�û�������Ϊ�գ�");}
	return isOk;  
	}
	
	
	public Salesperson getByAccount()throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Salesperson ss= new Salesperson();
		try {
			conn = DBConnection.getConnection();
			String sql="select * from salesperson where accountname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.accountname);
			
			rs=ps.executeQuery();
			
			while(rs.next()==true){
				ss.setSalespersonid(rs.getString("salespersonid"));
				ss.setSalesname(rs.getString("salesname"));
				ss.setSalesage(rs.getString("salesage"));
				ss.setSalesbirthday(rs.getString("salesbirthday"));
				ss.setSalessex(rs.getString("salessex"));
				ss.setAccountname(rs.getString("accountname"));
			}	
		} catch(Exception e){
			throw e;
		}finally {
			DBConnection.close(rs, ps, conn);
		}
		return ss;
	}
}