package org.zerock.domain;
/* 계약(상품) 테이블 */
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.Data;

@Data
public class ContractVO {
    private Long contract_id;       // 계약 ID
    private String customer_id;     // 고객 ID (계약자 참조)
    private String insured_id;      // 피보험자 ID
    private String product_name;    // 보험 상품 이름

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start_date;        // 계약 시작일

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date end_date;           // 계약 종료일 또는 만기일

    private String status;           // 계약 상태 
    private Date reg_date;           // 계약 등록일
    
    // 매퍼 별칭 컬럼용 필드 추가 (DB에 없고 조회용)
    private String customerName;  // 고객명
    private String insuredName;   // 피보험자명
    
}
