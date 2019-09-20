package kr.co.bitcomu.common.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyAppSqlConfig {
	private static final SqlSession sqlMapper;
	static {
		try {
			//환경설정 로딩
			String resource = "config/mybatis/sqlMapConfig.xml";
			//로딩 읽기
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory sqlFactory = new SqlSessionFactoryBuilder().build(reader);
//			sqlMapper = sqlFactory.openSession();
			//true값을 주면 자동commit . false는 내가 줘야한다
			sqlMapper = sqlFactory.openSession(true);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(
					"Error initializing MyAppSqlConfig class. Cause: " + e);
		}
	}

	public static SqlSession getSqlSessionInstance() {
		return sqlMapper;
	}
}