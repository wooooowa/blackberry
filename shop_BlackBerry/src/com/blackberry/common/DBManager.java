/*
**********************************************
*@source : DBManger.java
*@description: Connection 객체를 취득, 사용이 끝난 자원을
*              해제하는 클래스
**********************************************
*DATE           AUTHOR          DESCRIPTTION
***********************************************
*2018/07/16      박초롱                            최초작성
***********************************************
*/

package com.blackberry.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//공통으로 사용하니까 common으로 package생성

// 싱글톤 패턴을 활용한 공유방법
public class DBManager {
	// 생성자, static
	// 객체생성을 단 한번만 실행하고
	// 다른 클래스에서 사용 할 때는 한번 생성된
	// 객체를 빌려다가 공유의 목적으로 사용하게 만드는 방법
	
	// 인스턴스의 주소를 저장하기 위한 참조변수
	private static Connection conn;
	// Connection 관련 정보 상수
	private final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASS = "1234";
	
	// 생성자를  private으로 만들어 은닉화시킨다.
	// => 외부에서 인스턴스를 생성하지 못하도록 선언
	// => 이유 : 공유해서 사용하려고 하는데 다른 개발자가 
	//         객체생성을 해서 사용하면 공유의 의미가 없음
	//         (사용자의 실수를 막는 용도)
	private DBManager() {
		
	}
	// 인스턴스를 생성 또는 기존 인스턴스를 반환하는
	public static Connection getConnection() {
		conn = null;
		
		if(conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USER, PASS);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
	
	// SELECT 수행후 자원 해제를 위한 메서드 close
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn != null) {
				try {
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(rs != null) {
				try {
					rs.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// insert, delete, update 수행 후 자원해제를 위한 메서드
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(conn != null) {
				try {
					conn.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
}
