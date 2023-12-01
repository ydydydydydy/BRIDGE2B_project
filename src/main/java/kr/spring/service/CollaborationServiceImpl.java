package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.tb_company;
import kr.spring.entity.tb_request;
import kr.spring.entity.tb_solution;
import kr.spring.repository.CompanyRepository;
import kr.spring.repository.SolutionRepository;
import kr.spring.repository.CollaborationRepository;

@Service
public class CollaborationServiceImpl implements CollaborationService {

	@Autowired
	private SolutionRepository solutionRepository;
	@Autowired
	private CollaborationRepository collaborationRepository;

	@Override
	public void request(tb_request vo) {
		// TODO Auto-generated method stub
		collaborationRepository.save(vo);

	}

	@Override
	public List<tb_request> getList(String username) {
		List<tb_request> list = collaborationRepository.findByUsernameUsername(username);
		return list;
	}

	@Override
	public List<tb_solution> getSolList(tb_request req_num) {
		List<tb_solution> list = solutionRepository.findByReq_num(req_num);
		return list;
	}

	@Override
	public tb_request getReqContent(Long req_num) {
		Optional<tb_request> list = collaborationRepository.findById(req_num);
		return list.get();
	}
	@Override
	public Long findLargestPostNumberByUsername(String username) {
        return collaborationRepository.findMaxPostNumberByUsername(username);
    }

	   @Override
	    public List<tb_request> getRequestsByUsername(String username) {
	        return collaborationRepository.findByUsernameUsername(username);
	    }

	@Override
	public void remove(Long req_num) {
		collaborationRepository.deleteById(req_num);
	}
	@Override
	   public void modify(tb_request req_num, String caseData) {
	      List<tb_solution> list = solutionRepository.findByReq_num(req_num);
	      list.get(0).setMarketing_cases(caseData);
	      solutionRepository.save(list.get(0));
	      System.out.println("저장 완료");
	   }
}