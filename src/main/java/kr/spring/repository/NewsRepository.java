package kr.spring.repository;

import java.util.List;
import kr.spring.entity.tb_news;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsRepository extends JpaRepository<tb_news, String> {


	public Page<tb_news> findAll(Pageable pageable);
	
	long count();
}