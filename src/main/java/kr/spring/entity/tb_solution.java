package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.ToString;

@Entity // Board VO가 Database Table로 만들때 설정
@Data
@ToString
public class tb_solution { // VO <--- ORM ----> TABLE

	@Id // PK 의미 
	@GeneratedValue(strategy = GenerationType.IDENTITY)   // 1씩 증가하면서 넣기 -> auto_incrementr와 같음
	@Column(nullable = false)
	private  Long sol_num;  // 솔루션 번호
	@ManyToOne
	@JoinColumn(name = "req_num", referencedColumnName = "req_num") // 외래키 설정
	private tb_request req_num;  // 의뢰 번호
	
	@Column(nullable = false)
	private String sol_content;  // 솔루션 내용
	
	@Column
	private String company1;  // 추천 업종
	
	@Column
	private String company2;
	
	@Column
	private String company3;
	
	@Column(nullable = false)
	private String reco_industry;  // 추천 업종
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date created_at;  // 생성일자
	
	 @Column
	   private String marketing_strategy; // 마케팅 전략
	   
	   @Column
	   private String marketing_cases; // 마케팅 사례

}








