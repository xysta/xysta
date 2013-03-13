package com.xysta.web.util;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	
	public static String getTimeString(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
	}
}
