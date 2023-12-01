package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.spring.entity.tb_request;
import kr.spring.entity.tb_solution;

@Repository // 메모리로 올리기 위한 어노테이션 (생략가능)
public interface SolutionRepository extends JpaRepository<tb_solution, Long>{
													// <> -> 테이블명, PK 데이터타입
	
	//public List<tb_solution> findByReq_num(Long req_num);
	
	@Query("SELECT s FROM tb_solution s WHERE s.req_num = :req_num")
	public List<tb_solution> findByReq_num(@Param("req_num") tb_request req_num);




}