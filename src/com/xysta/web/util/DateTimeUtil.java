package com.xysta.web.util;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	
	public static String getTimeString(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		return df.format(new Date());
	}
}
