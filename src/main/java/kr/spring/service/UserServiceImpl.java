package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Role;
import kr.spring.entity.tb_user;
import kr.spring.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void join(tb_user vo) {
		String encPw = vo.getPassword();
		vo.setPassword(passwordEncoder.encode(encPw));
		vo.setRole(Role.MEMBER);
		userRepository.save(vo);
	}
	 

	@Override
	public boolean select(String username) {
		return userRepository.existsById(username);
	}

	@Override
	public tb_user getList(String username) {
		return userRepository.findById(username).get();
	}

	@Override
	   public tb_user update(tb_user vo) {
	       Optional<tb_user> optionalUser = userRepository.findById(vo.getUsername());

	       if (optionalUser.isPresent()) {
	           tb_user existingUser = optionalUser.get();
	           existingUser.setBno(vo.getBno());
	           existingUser.setIndustry(vo.getIndustry());
	           existingUser.setCom_name(vo.getCom_name());
	           existingUser.setPassword(passwordEncoder.encode(vo.getPassword())); // 비밀번호 업데이트

	           // 기타 필요한 필드들도 업데이트

	           // 업데이트된 회원 정보를 저장
	           return userRepository.save(existingUser);
	       } else {
	           return null;
	       }
	   }
	
	
	   @Override
	   public void delete(String username) {
	      
	       // username에 해당하는 사용자 정보를 삭제
	       userRepository.deleteById(username);
	   }

	    @Override
	    public int checkPassword(String username, String password) {
	        Optional<tb_user> optionalUser = userRepository.findById(username);

	        if (optionalUser.isPresent()) {
	            tb_user existingUser = optionalUser.get();
	            String storedPassword = existingUser.getPassword();

	            // 입력받은 비밀번호를 암호화하여 저장된 비밀번호와 비교
	            if (!passwordEncoder.matches(password, storedPassword)) {
	               return 0;
	            }else {
	               return 1;
	            }
	        } else {
	           return 0;
	        }
	    }

}
