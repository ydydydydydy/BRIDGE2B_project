package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;

@Entity
@Data
@ToString
public class tb_exp_company {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY) // 1씩 증가
   private int exp_num; // 활용번호
   
   @Column(nullable = false)
   private String com_name; // 기업명
   @ManyToOne
   @JoinColumn(name = "article_num", referencedColumnName = "article_num") // 외래키 설정
   private tb_article article_num; // 사례번호
   @Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
   private Date created_at; // 생성일자
   @Column(nullable = false)
   private String industry; // 업종
}










