package red.bofan.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.apache.shiro.web.util.WebUtils;

public class CustomRolesAuthorizationFilter extends AuthorizationFilter{

/*	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        Subject subject = getSubject(request, response);
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        // If the subject isn't identified, redirect to login URL
        if (subject.getPrincipal() == null) {
        	//ajax
        	if("XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With"))){
        		//json
        		httpServletResponse.setCharacterEncoding("UTF-8"); 
        		PrintWriter out = httpServletResponse.getWriter(); 
        		out.write("{'msg':'未登录'}"); 
        		out.flush(); 
        		out.close();
        		return false;
        	}else{
        		saveRequestAndRedirectToLogin(request, response);
        	}
            
        } else {
*//*        	String username = subject.getPrincipal().toString();*//*
        	//ajax
        	if("XMLHttpRequest".equalsIgnoreCase(httpServletRequest.getHeader("X-Requested-With"))){
        		//json
        		httpServletResponse.setCharacterEncoding("UTF-8"); 
        		PrintWriter out = httpServletResponse.getWriter();
        		out.write("{'msg':'没有权限访问'}"); 
        		out.flush(); 
        		out.close();
        		return false;
        	}else{
        		// If subject is known but not authorized, redirect to the unauthorized URL if there is one
                // If no unauthorized URL is specified, just return an unauthorized HTTP status code
                String unauthorizedUrl = getUnauthorizedUrl();
                //SHIRO-142 - ensure that redirect _or_ error code occurs - both cannot happen due to response commit:
                if (StringUtils.hasText(unauthorizedUrl)) {
                    WebUtils.issueRedirect(request, response, unauthorizedUrl);
                } else {
                    WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);
                }
        	}
            
        }
        return false;
	}*/
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Subject subject = getSubject(request, response);  
        String[] rolesArray = (String[]) mappedValue;
		//没有角色限制，有权限访问
        if (rolesArray == null || rolesArray.length == 0) {
            return true;  
        }
		//若当前用户是rolesArray中的任何一个，则有权限访问
        for (int i = 0; i < rolesArray.length; i++) {
            if (subject.hasRole(rolesArray[i])) {
                return true;
            }
        }
        return false;  
	}

}
