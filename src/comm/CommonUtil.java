package comm;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtil {

	public static String getStringTime() {
		String id = null;
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		id = sdf.format(date);
		return id;
	}

	public static String getStringID(String start) {
		String time = getStringTime();
		return start + time;
	}

	public static String getTime() {
		String id = null;
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		id = sdf.format(date);
		return id;
	}
}
