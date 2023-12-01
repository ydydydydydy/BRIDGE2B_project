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
public class tb_request { // VO <--- ORM ----> TABLE

	@Id // PK 의미 
	@GeneratedValue(strategy = GenerationType.IDENTITY)   // 1씩 증가하면서 넣기 -> auto_incrementr와 같음
	@Column(nullable = false)
	private  Long req_num;  // 의뢰 번호
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username") // 외래키 설정
	private tb_user username;  // 회원 이메일
	
	@Column(nullable = false)
	private String req_content;  // 의뢰 내용
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date req_at;  // 의뢰 날짜
	
	@Column(nullable = true)
	private String req_keyword;  // 키워드
	
	@Column(nullable = false)
	private boolean is_paid;  // 결제 여부

}







