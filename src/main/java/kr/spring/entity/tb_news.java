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
public class tb_news {

   @Id
   private String news_num; // 뉴스번호
   
   @Column(nullable = false)
   private String news_id; // 소비층
   @Column(nullable = true)
   private String news_date; // 기간
   @Column(nullable = false)
   private String news_name; // 방식
   @Column(nullable = false)
   private String news_reporter; // 예산
   @Column(nullable = false)
   private String news_title; // 예산
   @Column(nullable = false)
   private String news_content; // 예산
   @Column(nullable = false)
   private String news_url; // 예산

}










