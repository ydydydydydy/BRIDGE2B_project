package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.ToString;

@Entity // Board VO가 Database Table로 만들때 설정
@Data
@ToString
public class tb_company { // VO <--- ORM ----> TABLE

	@Id // PK 의미    
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int com_num; // 기업번호
	@Column(nullable = false)
	private String industry; // 업종
	@Column(nullable = false)
	private String com_name; // 기업명
	
	@Column(updatable = false) // 수정할때 작성자는 안바꿔 주겠다
	private String com_addr;  // 주소
	
	private String com_type; // 기업분류 - 대기업, 중견기업, 중소기업
}








