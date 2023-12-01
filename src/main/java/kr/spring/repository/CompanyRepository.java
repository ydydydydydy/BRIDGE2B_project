package kr.spring.repository;

import java.util.List;
import kr.spring.entity.tb_company;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRepository extends JpaRepository<tb_company, Long> {

   @Query("SELECT t FROM tb_company t where t.com_name LIKE %?1%")
   List<tb_company> findCom_NameByContaining(String companyName);


	
	long count();
}