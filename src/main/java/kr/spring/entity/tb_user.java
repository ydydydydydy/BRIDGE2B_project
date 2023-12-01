package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;

@Entity
@Data
@ToString
public class tb_user {

   @Id
   private String username; // Spring Sequrity에서는 id가 아닌 username으로 지정
   
   @Column(nullable = false)
   private String password; // Spring Sequrity에서는 pw가 아닌 password로 지정
   
   @Column(nullable = false)
   private String bno; // 사업자번호
   @Column(nullable = false)
   private String industry; // 업종
   @Column(nullable = false)
   private String com_name; // 기업명
   @Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
   private Date joined_at; // 가입일자
   @Enumerated(EnumType.STRING) // @Enumerated -> 열거형 (권한이 여러개이기 때문에)
   private Role role; // 권한정보
   
}










