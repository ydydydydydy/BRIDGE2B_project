package kr.spring.service;

import java.util.List;

import kr.spring.entity.tb_company;
import kr.spring.entity.tb_request;
import kr.spring.entity.tb_solution;

public interface CollaborationService {

	public void request(tb_request vo);

	public List<tb_request> getList(String username);

	public List<tb_solution> getSolList(tb_request req_num);

	public tb_request getReqContent(Long req_num);

	public Long findLargestPostNumberByUsername(String username);

	public List<tb_request> getRequestsByUsername(String username);

	public void remove(Long req_num);

	public void modify(tb_request req_num, String caseData);

}