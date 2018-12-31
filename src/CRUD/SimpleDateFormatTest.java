package CRUD;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SimpleDateFormatTest {
public static void main(String[] args) {
	Date date=new Date();
	System.out.println(date);
	SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-mm-dd");
	try {
		Date date1=sdf1.parse("2013-12-12");
		System.out.println(date1);
	} catch (ParseException e) {
		e.printStackTrace();
	}
//	String str1=sdf1.format(date);
}
}
