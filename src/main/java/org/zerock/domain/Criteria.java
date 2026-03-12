package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* pageNum과 amount값을 전달하는 용도의 클래스 */
@Setter
@Getter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	// 생성자를 통해서 기본값을 1페이지, 1개로 지정
	public Criteria() {
		this(1,1);
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
