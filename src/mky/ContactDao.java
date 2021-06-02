package mky;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mky.MybaFactory;

public class ContactDao {
	SqlSession sqlSession;
	
	public ContactDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("sqlSession 생성시 오류 발생");
			}else {
				System.out.println("정상적으로 sqlSession이 생성됨.");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}


}
