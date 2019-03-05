package action;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LanguageAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String request_locale;
	HttpSession session;
	HttpServletRequest request;

	public String getRequest_locale() {
		return request_locale;
	}

	public void setRequest_locale(String requestLocale) {
		request_locale = requestLocale;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String ChangeLanguage() {
		Locale locale = Locale.getDefault();
		if ("zh_CN".equals(request_locale)) {
			locale = new Locale("zh", "CN");

			// ServletActionContext.getRequest().getSession().setAttribute("WW_TRANS_I18N_LOCALE",
			// locale);
			ActionContext.getContext().setLocale(locale);
		}
		if ("en_US".equals(request_locale)) {
			locale = new Locale("en", "US");

			ServletActionContext.getRequest().getSession().setAttribute("WW_TRANS_I18N_LOCALE", locale);
			ActionContext.getContext().setLocale(locale);
		}

		return "success";
	}
}
