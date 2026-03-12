package org.zerock.security;
/* AccessDeniedHandler 구현체 
	= AccessDeniedHandler 인터페이스는 handle() 뿐임
		=> HttpServletRequest request, HttpServletResponse response를 파라미터로 사용하기 때문에 -> 직접 서블릿 API를 이용하는 처리가 가능
 		=> 코드에서 접근 제한이 걸리는 경우 리다이렉트 하는 방식으로 동작을 지정
	(사용) security-context.xml = 기존 error-page 속성을 => ref 속성 CustomAccessDeniedHandler 빈 등록해서 사용하면 됨    
*/
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;

import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.error("접근제한");
		response.sendRedirect("/accessError");
	}

}
