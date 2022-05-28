package control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class log {
	static Logger log = LoggerFactory.getLogger(log.class);
	public static void main(String[] args) {
		String msg = "로그 테스트 중입니다.";
		
		log.info("log test info");
		log.warn("test log : {}", msg);
	}

}
