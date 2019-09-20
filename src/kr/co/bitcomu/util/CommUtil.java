package kr.co.bitcomu.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.security.MessageDigest;

/**
 * 이 클래스는 공통적으로 사용하는 모듈을 모아 놓은 클래스이다.
 *
 * @since 2019-07-23
 * @author sj Yu
 *
 */

public class CommUtil {
	public SimpleDateFormat loginSdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");

	private static final String DATE_FORMAT = "yyyy-MM-dd";
	private static final String DATE_FORMAT_TIME = "yyyy-MM-dd HH:mm:ss";

	
	
	/**
	 * 년/월/일 시:분:초를 구하여 문자열로 반환한다.
	 * 
	 * @return
	 */
	public static String getDate() {
		return getDate(DATE_FORMAT_TIME);
	}

	/**
	 * formatString를 구하여 문자열로 반환한다.
	 * 
	 * @return
	 */

	public static String getDate(String formatString) {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		DateFormat df = new SimpleDateFormat(formatString);
		return df.format(c.getTime());
	}

	/**
	 * parseDate를 구하여 문자열로 반환한다.
	 * 
	 * @return
	 */
	public static String getDate(Date parseDate) {
		Calendar c = Calendar.getInstance();
		c.setTime(parseDate);
		DateFormat df = new SimpleDateFormat(DATE_FORMAT);
		return df.format(c.getTime());
	}



	
	/**
	 *  회원가입 이메일 인증 코드를 위한 난수 생성기(숫자만 6자리)
	 * 
	 * @return
	 */
	public static String randomKey() {
		return String.valueOf(new Random().nextInt(900000) + 100000);
	}
	
	
	
	/**
	 *  비밀번호 찾기를 위한 난수 생성기(문자 + 숫자 조합 20개)
	 * 
	 * @return
	 */
	public static String randomKeyByPassword() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 20; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		return temp.toString();

	}
	
	
	/**
	 *  이메일 전송 코드 체크
	 * 
	 * @param randomNum
	 * @param emailKey
	 * @param failMsg
	 * @return
	 */
	
	public static boolean emailChk(String randomNum, String sendNum) {
		if (!randomNum.equals(sendNum)) return false;
		return true;
	}
	
	
}