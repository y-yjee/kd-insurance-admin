package org.zerock.security;
/* PasswordEncoder = Spring Security 비밀번호 암호화 검증을 위한 인터페이스 */
/* Spring Security에서 비밀번호를 인코딩하지 않고 그대로 비교하기 위해 작성된 PasswordEncoder 구현 클래스
   => 교육용 또는 테스트 용도 */
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoOpPasswordEncoder implements PasswordEncoder {

	// encode() = 비밀번호를 암호화 (이 예제에서는 암호화없이 평문 그대로 반환)
	// (참고) CharSequence = 문자 시퀀스를 표현하는 인터페이스(String, StringBuilder 등등 포함)
	//                       => 그래서 다양한 입력값 지원 가능함(String, StringBuilder, CharBuffer 등등)
	@Override
	public String encode(CharSequence rawPassword) {
		return rawPassword.toString(); // 암호화 없이 그대로 반환됨
	}

	// 입력값과 저장값을 비교
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		return rawPassword.toString().equals(encodedPassword); // 평문 비교
	}

}
