/**
 *  로그인이 필요한 페이지가 로그인 상태로 들어왔는지 체크
 *  로그인이 되어 있지 않다면 로그인폼 페이지로 이동시킨다.
 */
package kr.co.bitcomu.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.bitcomu.repository.vo.User;

public class AuthFilter implements Filter {
	private List<String> list = new ArrayList<>();
	@Override
	public void init(FilterConfig config) throws ServletException {
		// web.xml 등록된 param-name 태그의 값..
		String[] pages = config.getInitParameter("pages").split(";");
		for (String page : pages) {
			list.add(page.trim());
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		// 사용자가 요청한 URL
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		uri = uri.substring(contextPath.length());
		
		// 로그인이 필요하지 않은 Path에 속하는지 체크
		int index = list.indexOf(uri);
		
		
		// 로그인이 필요한 페이지만 체크해야 한다.
		if (index == -1) {
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("user");
			if (user == null) {
				res.sendRedirect(req.getContextPath() + "/user/userLoginAuth.do");
				return;
			}
		}
		// 로그인 체크 통과된 경우...
		chain.doFilter(request, response);
	}

}
