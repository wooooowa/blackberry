package com.blackberry.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.blackberry.dto.ProductDTO;
import com.blackberry.mybatis.SqlMapConfig;

public class ProductDAO {
	
	// MyBatis (환경)셋팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// mapper에 접근하기 위한 	SqlSession
	SqlSession sqlSession;
	
	// 싱글톤으로 new 없이 사용하기 때문에
	// 다른 곳에 new로 객체생성 못하게 private으로 막음
	private ProductDAO() {}
	
	// 싱글톤 패넡 - 객체생성 1회 실시 후 공유해서 사용
	// 객체생성 1회 실시
	private static ProductDAO instance = new ProductDAO();
	
	// 외부에서 getInstance()를 활용하여 1회 실시한 객체를 공유
	public static ProductDAO getInstance() {
		return instance;
	}
	
	// 실제 동작들
	
	// Best 상품목록 출력 (Index페이지)
	public List<ProductDTO> bestView(){
		sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO> bestList = null;
		
		try {
			bestList = sqlSession.selectList("bestView");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return bestList;
	}
	
	// new 상품목록 출력 (Index페이지)
	public List<ProductDTO> newView(){
		sqlSession = sqlSessionFactory.openSession();
		List<ProductDTO> newList = null;
		
		try {
			newList = sqlSession.selectList("newView");
			for (ProductDTO productDTO : newList) {
				System.out.println(productDTO.getP_name()+ "\t");
				System.out.println(productDTO.getP_img()+ "\t");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return newList;
	}
	
	
// ===================================================================	
// Mybtis 사용하기전 DBManger와 PreparStatement 방식으로 구현한 DAO객체
	/*Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductDTO> list = new ArrayList<>();
	int result = 0;
	
	public ArrayList<ProductDTO> bestview(){
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM best_pro_view ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price = rs.getInt("p_price");
				String p_img = rs.getString("p_img");
				Date p_indate = rs.getDate("p_indate");
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price, p_img, p_indate);
				list.add(pDto);
			}
			System.out.println("=============>");
			for (ProductDTO productDTO : list) {
				System.out.print(productDTO.getP_code() + "\t");
				System.out.print(productDTO.getP_name() + "\t");
				System.out.print(productDTO.getP_price() + "\t");
				System.out.print(productDTO.getP_img() + "\t");
				System.out.print(productDTO.getP_indate() + "\t");
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
*/
// ========================================================================	
}
