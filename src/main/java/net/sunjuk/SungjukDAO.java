package net.sunjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class SungjukDAO {  //Data Access Object
							//데이터베이스관련 로직 구현
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public SungjukDAO() {
		dbopen = new DBOpen();
	}// end
	
	
	//행 추가
	/*
	 * public int inselt() { int cnt = 0; try { con = dbopen.getConnection();
	 * StringBuilder sql = new StringBuilder(); sql.
	 * append("INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate) ");
	 * sql.append("VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");
	 * 
	 * pstmt = con.prepareStatement(sql.toString()); pstmt.setString(1, uname);
	 * pstmt.setInt(2, kor); pstmt.setInt(3, eng); pstmt.setInt(4, mat);
	 * pstmt.setInt(5, aver); pstmt.setString(6, addr);
	 * 
	 * 
	 * cnt = pstmt.executeUpdate();
	 * 
	 * } catch (Exception e) { System.out.println("행추가 실패:" + e); } finally {
	 * DBClose.close(con, pstmt); } // end return cnt; }// create() end
	 */
	//행 추가
	public int create(SungjukDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate) ");
			sql.append("VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	}// create() end

	//행 전체목록
	public ArrayList<SungjukDTO> list() {
		// 데이터베이스에서 가져온 데이터(rs)를 한꺼번에 모아서 (ArrayList)
		// sungjukList.jsp 에서 사용한다
		ArrayList<SungjukDTO> list = null;

		try {
			con = dbopen.getConnection();// 오라클 DB 연결

			sql = new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
			sql.append(" FROM sungjuk");
			sql.append(" ORDER BY wdate DESC");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<SungjukDTO>(); //전체행을 저장
				do {
					//커서가 가리키는 한 줄 저장
					SungjukDTO dto = new SungjukDTO();
					dto.setSno(rs.getInt("sno"));
					dto.setUname(rs.getString("uname"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setAver(rs.getInt("aver"));
					dto.setWdate(rs.getString("wdate"));
					
					list.add(dto); //list에 저장
				}while(rs.next());
			} else {
				list = null;
			} // if end

		} catch (Exception e) {
			System.out.println("목록실패:" + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return list;
	}// list end
	
	
	//행 상세목록
	public SungjukDTO read(int sno) {
		
		SungjukDTO dto =null;
		
		try {
			con = dbopen.getConnection();// 오라클 DB 연결

			sql = new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
			sql.append(" FROM sungjuk");
			sql.append(" WHERE sno=?" );
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
				
			}//if end
		
		} catch (Exception e) {
			System.out.println("상세보기 실패:" +e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}//read end
	
	
	//행삭제
	public int delete(int sno) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk ");
			sql.append(" WHERE sno = ? ");
			 
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			cnt=pstmt.executeUpdate();	
			
		} catch (Exception e) {
			System.out.println("삭제실패:" +e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//delete end
	
	
	public int updateproc(SungjukDTO dto) {
		int cnt= 0;
		try {
			con=dbopen.getConnection();
			//db오픈
			sql=new StringBuilder();
			//문자열 합치는 기능
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate ");
			sql.append(" WHERE sno = ? ");
			
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			pstmt.setInt(7, dto.getSno());
			cnt=pstmt.executeUpdate();		
		} catch (Exception e) {
			System.out.println("수정실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}//updateproc end
	
	
	
	
	
}
