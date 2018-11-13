package com.blackberry.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.blackberry.dto.BoardDTO;
import com.blackberry.dto.CriteriaDTO;
import com.blackberry.mybatis.SqlMapConfig;

public class BoardDAO {

	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;

	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	

	public static BoardDAO getInstance() {
		return instance;
	}
	// 게시판 리스트 가져오기
	public List<BoardDTO> boardListAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = new ArrayList<>();
		try {
			list = sqlSession.selectList("boardList", criDto);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
		
	}
	
	// 게시판 페이지네이션
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.selectOne("countPaging", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;  //15
	}
	
	// 검색한 키워드로 게시글목록 가져오기
	public List<BoardDTO> boardSearch(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = null;
		
		try {
			list = sqlSession.selectList("SearchList", criDto);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
		
	}
	
	// boardDetail
	public BoardDTO boardDetailView(String bno){
		sqlSession = sqlSessionFactory.openSession();
		BoardDTO bDto = null;
		
		try {
			bDto = sqlSession.selectOne("boardDetailView", bno);			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return bDto;
		
	}
	// 게시글 조회수 증가
	public void viewCnt(String bno, HttpSession countSession) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			long update_time = 0;
			int result = 0;
			// 조회수를 증가할 때 생기는 read_time 게시글번호가 없으면
			// 현재 처음 조회수를 1 증가하는 경우
			if(countSession.getAttribute("read_time_" + bno) != null) {
				update_time = (long)countSession.getAttribute("read_time_" + bno);
			}
			// 현재 시간을 담는다.
			long current_time = System.currentTimeMillis();
			
			// 현재 시간과 조회수 1증가한 시간을 비교해서 24시간(1일)이 지났으면
			// 조회수 1 증가
			if(current_time - update_time > 24 * 60 * 60 * 1000) {
				result = sqlSession.update("viewCnt", bno);
				sqlSession.commit();
				// 조회수 1 증가한 시간을 session에 담는다.
				countSession.setAttribute("read_time_" + bno, current_time);
			}
			/*sqlSession.update("viewCnt", bno);
			sqlSession.commit();*/
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	// 새글등록
	public int boardInsert(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.insert("boardInsert", bDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public int boardUpdate(BoardDTO bDto) {
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		try {
			result = sqlSession.update("boardUpdate", bDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
}
