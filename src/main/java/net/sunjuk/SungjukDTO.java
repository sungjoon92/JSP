package net.sunjuk;

public class SungjukDTO {// Data Transfer object 전송객체
							// Value Object
	private int sno;
	private String uname;
	private int kor;
	private int eng;
	private int mat;
	private int aver;
	private String addr;
	private String wdate;

	public SungjukDTO() {
		
	}

	/**
	 * @return the sno
	 */
	public int getSno() {
		return sno;
	}

	/**
	 * @param sno the sno to set
	 */
	public void setSno(int sno) {
		this.sno = sno;
	}

	/**
	 * @return the uname
	 */
	public String getUname() {
		return uname;
	}

	/**
	 * @param uname the uname to set
	 */
	public void setUname(String uname) {
		this.uname = uname;
	}

	/**
	 * @return the kor
	 */
	public int getKor() {
		return kor;
	}

	/**
	 * @param kor the kor to set
	 */
	public void setKor(int kor) {
		this.kor = kor;
	}

	/**
	 * @return the eng
	 */
	public int getEng() {
		return eng;
	}

	/**
	 * @param eng the eng to set
	 */
	public void setEng(int eng) {
		this.eng = eng;
	}

	/**
	 * @return the mat
	 */
	public int getMat() {
		return mat;
	}

	/**
	 * @param mat the mat to set
	 */
	public void setMat(int mat) {
		this.mat = mat;
	}

	/**
	 * @return the aver
	 */
	public int getAver() {
		return aver;
	}

	/**
	 * @param aver the aver to set
	 */
	public void setAver(int aver) {
		this.aver = aver;
	}

	/**
	 * @return the addr
	 */
	public String getAddr() {
		return addr;
	}

	/**
	 * @param addr the addr to set
	 */
	public void setAddr(String addr) {
		this.addr = addr;
	}

	/**
	 * @return the wdate
	 */
	public String getWdate() {
		return wdate;
	}

	/**
	 * @param wdate the wdate to set
	 */
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	

}// class end
