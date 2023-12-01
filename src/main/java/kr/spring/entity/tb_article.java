package kr.spring.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.sun.istack.NotNull;

import lombok.Data;
import lombok.NonNull;
import lombok.ToString;

@Entity
@Data
@ToString
public class tb_article {

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private int article_num; // 사례번호
   
   @Column(nullable = false)
   private String consumption_target; // 소비층
   @Column(nullable = true)
   private String consumption_period; // 기간
   @Column(nullable = false)
   private String consumption_promotion; // 방식
   @Column(nullable = false)
   private String consumption_budget; // 예산
}










