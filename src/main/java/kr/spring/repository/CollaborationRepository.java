package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.spring.entity.tb_company;
import kr.spring.entity.tb_request;

@Repository // 메모리로 올리기 위한 어노테이션 (생략가능)
public interface CollaborationRepository extends JpaRepository<tb_request, Long>{
                              // <> -> 테이블명, PK 데이터타입
	public List<tb_request> findByUsernameUsername(String username);

	 @Query("SELECT MAX(p.req_num) FROM tb_request p WHERE p.username.username = :username")
	 public Long  findMaxPostNumberByUsername(@Param("username") String username);

	
	
	
}