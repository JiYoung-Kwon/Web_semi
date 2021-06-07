package ksy;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybaFactory {
	private static SqlSessionFactory factory;	//static 으로 최초 1회 생성되는 SqlSessionFactory타입 참조변수를 선언
	
	static {	//static으로 선언하였기에 동일한 제어자를 씀
		try {
			Reader reader = Resources.getResourceAsReader("ksy/config.xml");
			//문자 스트림을 이용하는 Reader 클래스를 사용하여 소스 경로를 불러온다.
			factory = new SqlSessionFactoryBuilder().build(reader);
			//reader 로 읽어온 경로에 있는 파일의 구성요소 및 정의를 통하여 SqlSessionFactory 객체를 생성하고 주소를 참조변수에 저장하였다
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {	//getter
		return factory;
		
	}
	
}
