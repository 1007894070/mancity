package comm;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

public class MyRequestWrapper extends HttpServletRequestWrapper {
	Locale locale = null;

	public MyRequestWrapper(HttpServletRequest request) {
		super(request);
		HttpSession session = request.getSession();
		// TODO Auto-generated constructor stub
		String loc = request.getParameter("request_locale");
		if (loc != null) {
			String a[] = loc.split("_");
			session.setAttribute("i18n", new Locale(a[0], a[1]));
		}
		locale = (Locale) session.getAttribute("i18n");

	}

	public Locale getLocale() {
		if (locale != null) {
			return locale;
		} else {

			return super.getLocale();

		}
	}

}
