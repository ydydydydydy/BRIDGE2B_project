package kr.spring.entity;

import lombok.Data;

@Data
public class PageMaker { // 페이징처리 클래스

	private Criteria cri; // 현재 몇 페이지인지 정보와 게시글을 몇개씩 볼 것인지 그리고
	                      // 현재 페이지에서 몇번 글 부터 시작해야하는 정보를 가지고 있는 객체가 있어야
	                      // 페이징 처리가 가능하다
	
	private long totalCount; // 총 게시글의 수 : 총게시글의 수를 알아야 몇페이지가 나오는지 알 수 있다
	
	private int startPage; // 시작페이지 번호
	
	private int endPage; // 끝페이지 번호
	
	private boolean prev; // 이전버튼
	
	private boolean next; // 다음버튼
	
	private int displayPageNum = 5; // 하단에 몇개의 페이지를 보여줄 것인지
	// 1 2 3 4 5 
	
	// 총 게시글의 수를 구하는 메소드
//	public void setTotalCount(Criteria cri2, long totalCount) {
//	    this.totalCount = totalCount;
//	    makePagein();
//	}
	 public PageMaker(Criteria cri, long totalCount) {
	        this.cri = cri;
	        this.totalCount = totalCount;
	        makePagein();
	    }
	
	public void makePagein() {
		// 1. 화면에 보여질 마지막 페이지 번호
		// 현재 하단에 보여줄 페이지 개수는? 1 2 3 4 5 6 7 8 9 10
		// 질문. 내가 현재 7페이지를 보고 있다. 그렇다면 우측끝에 있는 마지막 페이지 번호는? 10
		// 질문. 내가 현제 13페이지를 보고 있다. 그렇다면 우측끝에 있는 마지막 페이지 번호는? 20
		// 7 / 10.0 -> 소수발생 시 올림 -> 1 * 10 -> 10
		// 13 / 10.0 -> 2 * 10 -> 20
		endPage =  (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		// 2. 화면에 보여질 시작 페이지 번호
		// 현재 7페이지 -> 10(마지막) - 10(보여줄 페이지 개수) + 1
		// 현재 15페이지 -> 20(마지막) - 10(보여줄 페이지 개수) + 1
		startPage = (endPage - displayPageNum) + 1;
		
		if(startPage <= 0) {
			startPage = 1; // 혹시라도 startPage가 0보다 작거나 같다면 1부터 시작할 수 있게
		}
		
		// 3.최종페이지가 맞는지 유효성 검사
		// 예) 실제로 글이 101개라면 10개 페이지 + 1페이지만 더 만들어줘야한다
		// 마지막 페이지 계산
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		// 4.화면에 보여질 마지막 페이지 유효성 체크
		if (tempEndPage < endPage) {
			endPage = tempEndPage; // 마지막 페이지가 진짜로 구한 페이지 숫자보다 높으면 치환
		}
		
		// 5.이전, 다음 페이지 버튼 존재여부
		prev = (startPage == 1) ? false : true;
		next = (endPage < tempEndPage) ? true : false;
		
	}
	
	
	
	
}







