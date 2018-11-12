package com.blackberry.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.blackberry.common.DBManager;
import com.blackberry.dto.MemberDTO;
import com.blackberry.mybatis.SqlMapConfig;

public class MemberDAO {

		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();

		SqlSession sqlSession;

		private MemberDAO() {}
		
		private static MemberDAO instance = new MemberDAO();
		

		public static MemberDAO getInstance() {
			return instance;  // getInstance를 호출하는 곳에 instance값(=new MemberDAO())을 줌 
	}
		
	// 회원가입
	public int memInsert(MemberDTO mDto) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.insert("memInsert", mDto);
			sqlSession.commit();  // insert, update, delete만 반드시 commit!!!
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	// 회원가입 페이지 ID중복체크 (Ajax)
	public String confirmID(String id) {
		String result = null;
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("confirmID", id);
			if(result != null) {
				result = "-1";
			} else {
				result = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
		
	// 비밀번호수정 페이지 현재 비밀번호와 일치하는지 확인
	public String confirmPW(String id, String pw) {
		String msg = null;
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		try {
			msg = sqlSession.selectOne("confirmPW", mDto);
			
			if(msg != null) {
				msg = "-1";
			} else {
				msg = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return msg;
	}
		
	// 로그인 기능 체크
	public MemberDTO LoginCheck(String id, String pw) {

		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		
		try {
			mDto = sqlSession.selectOne("LoginCheck", mDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	// 회원정보 수정 (비밀번호 제외)
	public int memUpdate(MemberDTO mDto) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();

		try {
			result = sqlSession.update("memUpdate", mDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	// 회원비밀번호수정(일반정보 제외)
	public int pwUpdate(String id, String pw) {
		int result = 0;
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPw(pw);
		
		try {
			result = sqlSession.update("pwUpdate", mDto);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 회원 탈퇴(삭제)
	public int deleteMember(String userid) {
		int flag = 0;
		sqlSession = sqlSessionFactory.openSession();
		try {
			flag = sqlSession.delete("deleteMember", userid);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return flag;
	}
	
// ====================================================================	
	/*Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<MemberDTO> list = new ArrayList<>();
	int result = 0;
	MemberDTO mDto;
	
	public int memInsert(MemberDTO mDto) {
		try {
			conn = DBManager.getConnection();
			String sql = "INSERT INTO member2(id, pw, name, phone, email, zipcode, addr1, addr2) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ? ) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getId() );
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getName() );
			pstmt.setString(4, mDto.getPhone());
			pstmt.setString(5, mDto.getEmail());
			pstmt.setString(6, mDto.getZipcode());
			pstmt.setString(7, mDto.getAddr1() );
			pstmt.setString(8, mDto.getAddr2());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		
		return result;
	}
	// 로그인시 회원여부 체크
	public MemberDTO LoginCheck(String uid, String upw) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM member2 "
					+ "WHERE id = ? AND pw = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String zipcode = rs.getString("zipcode");
				String addr1 = rs.getString("addr1");
				String addr2 = rs.getString("addr2");
				Date regdate = rs.getDate("regdate");
				
				mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2, regdate);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mDto;
	}
	
	public int memUpdate(MemberDTO mDto) {
		try {
			conn = DBManager.getConnection();
			String sql = "UPDATE member2 SET "
					+ "name = ?, "
					+ "phone = ?, "
					+ "email = ?, "
					+ "zipcode = ?, "
					+ "addr1 = ?, "
					+ "addr2 = ? "
					+ "WHERE id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getPhone());
			pstmt.setString(3, mDto.getEmail());
			pstmt.setString(4, mDto.getZipcode());
			pstmt.setString(5, mDto.getAddr1());
			pstmt.setString(6, mDto.getAddr2());
			pstmt.setString(7, mDto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	// Ajax를 활용한 ID 중복체크
	public String confirmID(String userid) {
		String msg = "";
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT id FROM member2 "
					+ "WHERE id = ? "; 
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 중복된 아이디
				msg = "-1";
			} else {
				msg = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}

		
		return msg;
	}
	
	// Ajax를 활용한 PW 중복체크
		public String confirmPW(String userid, String userpw) {
			String msg = "";
			try {
				conn = DBManager.getConnection();
				String sql = "SELECT id FROM member2 "
						+ "WHERE id = ? AND pw = ? "; 
				pstmt =conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, userpw);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					// 현재password일치
					msg = "-1";
				} else {
					msg = "1";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return msg;
		}
		
	// PassWord 수정
		public int pwUpdate(String userId, String userPw) {
			try {
				conn = DBManager.getConnection();
				String sql = "UPDATE member2 SET "
						+ "pw = ? "
						+ "WHERE id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userPw);
				pstmt.setString(2, userId);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
			return result;
		}*/
// =======================================================
}
