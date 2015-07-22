package comm;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IbatisUtil {

	private static SqlMapClient sqlmap;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("comm/SqlMapConfig.xml");
			sqlmap = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public static SqlMapClient getSqlmap() {
		return sqlmap;
	}
	
}
