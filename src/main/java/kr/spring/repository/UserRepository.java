package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kr.spring.entity.tb_user;


public interface UserRepository extends JpaRepository<tb_user, String>{

}
