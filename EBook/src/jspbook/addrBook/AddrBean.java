package jspbook.addrBook;

import java.sql.*;
import java.util.*;

public class AddrBean {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String Url = "jdbc:mysql://localhost:3306/jsp02";
	String dbId="root";
	String dbPass="jsw0101151!";
	
	
	// ������ ���̽� ���� �޼���
	void connect(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(Url,dbId,dbPass);
			System.out.println("���� ����");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	// �ű� �ּҷ� �߰� �޼���
	public boolean insertDB(AddrBook addrbook){
		// ����
		connect();
		
		//������ �ۼ�
		String sql="insert into address_book(ab_name,ab_email,ab_birth,ab_tel,ab_comdept, ab_memo) values(?,?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrbook.getAb_name());
			pstmt.setString(2, addrbook.getAb_email());
			pstmt.setString(3, addrbook.getAb_birth());
			pstmt.setString(4, addrbook.getAb_tel());
			pstmt.setString(5, addrbook.getAb_comdept());
			pstmt.setString(6, addrbook.getAb_memo());
			pstmt.executeUpdate();
		}catch(SQLException e){
			return false;
		}
		return true;
	}
	
	// ����
	public boolean deleteDB(int ab_id){
		// ����
		connect();
		// ������ �ۼ�
		String sql = "Delete from address_book where ab_id=?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ab_id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			return false;
		}
			return true;
		// DAO
	}
	
	// ����
	public boolean updateDB(AddrBook addrbook)throws ClassNotFoundException, SQLException{
		// ����
				connect();
				// ������ �ۼ�
				String sql = "Update address_book set ab_name=?,ab_email=?,ab_birth=? ,ab_tel=?, ab_comdept=?, ab_memo=? where ab_id = ?";
				try{
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, addrbook.getAb_name());
					pstmt.setString(2, addrbook.getAb_email());
					pstmt.setString(3, addrbook.getAb_birth());
					pstmt.setString(4, addrbook.getAb_tel());
					pstmt.setString(5, addrbook.getAb_comdept());
					pstmt.setString(6, addrbook.getAb_memo());
					pstmt.setInt(7, addrbook.getAb_id());
					pstmt.executeUpdate();
				}catch(SQLException e){
					return false;
				}
				return true;
	}
	// Ư�� ��Ϻ���
	//public AddrBook getDB(){
		
	//}
	// ��ü ��Ϻ���
	public ArrayList<AddrBook>getDBList(){
		connect();
		ArrayList<AddrBook> datas=new ArrayList<AddrBook>();
		String sql="select * from address_book";
		try{
			pstmt=conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				AddrBook addrbook = new AddrBook();
				addrbook.setAb_id(rs.getInt("ab_id"));
				addrbook.setAb_name(rs.getString("ab_name"));
				addrbook.setAb_email(rs.getString("ab_email"));
				addrbook.setAb_comdept(rs.getString("ab_comdept"));
				addrbook.setAb_birth(rs.getString("ab_birth"));
				addrbook.setAb_tel(rs.getString("ab_tel"));
				addrbook.setAb_memo(rs.getString("ab_memo"));
				datas.add(addrbook);
				System.out.println(datas);
			}
			}catch(SQLException e){
			e.printStackTrace();
			}
		return datas;
	}
	
	public AddrBook getDB(int gb_id) throws ClassNotFoundException, SQLException{
		connect();
		String sql = "select * from address_book where ab_id=?";
		AddrBook addrbook = new AddrBook();
		
		try{
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs= pstmt.executeQuery();
			
			rs.next();
			addrbook.setAb_id(rs.getInt("ab_id"));
			addrbook.setAb_name(rs.getString("ab_name"));
			addrbook.setAb_email(rs.getString("ab_email"));
			addrbook.setAb_birth(rs.getString("ab_birth"));
			addrbook.setAb_tel(rs.getString("ab_tel"));
			addrbook.setAb_comdept(rs.getString("ab_comdept"));
			addrbook.setAb_memo(rs.getString("ab_memo"));
			
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return addrbook;
	}
}
