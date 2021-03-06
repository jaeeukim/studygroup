package week_04;

import java.util.Arrays;

/*๐ข join์ผ๋ก ํ์ง๊ฑฐ๋ฆฌ ์ข ํ๋ค
 * [9-6]
 * ๋ค์๊ณผ ๊ฐ์ด ์ ์๋ ๋ฉ์๋๋ฅผ ์์ฑํ๊ณ  ํ์คํธํ์์ค.
 * ๋ฉ์๋๋ช : fillZero
 * ๊ธฐ   ๋ฅ : ์ฃผ์ด์ง ๋ฌธ์์ด (์ซ์)๋ก ์ฃผ์ด์ง ๊ธธ์ด์ ๋ฌธ์์ด๋ก ๋ง๋ค๊ณ  ์ผ์ชฝ ๋น ๊ณต๊ฐ์ '0'์ผ๋ก ์ฑ์ด๋ค.
 * 			๋ง์ผ ์ฃผ์ด์ง ๋ฌธ์์ด์ด null์ด๊ฑฐ๋ ๋ฌธ์์ด์ ๊ธธ์ด๊ฐ length์ ๊ฐ๊ณผ ๊ฐ์ผ๋ฉด ๊ทธ๋๋ก ๋ฐํํ๋ค.
 * 			๋ง์ผ ์ฃผ์ด์ง length์ ๊ฐ์ด 0๋ณด๋ค ๊ฐ๊ฑฐ๋ ์์ ๊ฐ์ด๋ฉด ๋น ๋ฌธ์์ด("")์ ๋ฐํํ๋ค.
 * ๋ฐํํ์ : String
 * ๋งค๊ฐ๋ณ์ ๋ณํํ  ๋ฌธ์์ด : String src - ๋ณํํ ๋ฌธ์์ด
 * 					   int length - ๋ณํํ ๋ฌธ์์ด์ ๊ธธ์ด
 */
public class q9_06 {
	public static String fillZero(String src, int length) {
		/* (1) fillZero . ๋ฉ์๋๋ฅผ ์์ฑํ์์ค
		1. src๊ฐ ๋์ด๊ฑฐ๋ src.length()๊ฐ length์ ๊ฐ์ผ๋ฉด src๋ฅผ ๊ทธ๋๋ก ๋ฐํํ๋ค
		2. length์ ๊ฐ์ด 0 ๋ณด๋ค ๊ฐ๊ฑฐ๋ ์์ผ๋ฉด ๋น ๋ฌธ์์ด("")์ ๋ฐํํ๋ค
		3. src์ ๊ธธ์ด๊ฐ length์ ๊ฐ๋ณด๋ค ํฌ๋ฉด src๋ฅผ length๋งํผ ์๋ผ์ ๋ฐํํ๋ค
		4. ๊ธธ์ด๊ฐ length์ธ char๋ฐฐ์ด์ ์์ฑํ๋ค
		5. 4์์ ์์ฑํ char๋ฐฐ์ด์ '0'์ผ๋ก ์ฑ์ด๋ค
		6. src์์ ๋ฌธ์๋ฐฐ์ด์ ๋ฝ์๋ด์  4์์ ์์ฑํ ๋ฐฐ์ด์ ๋ณต์ฌํ๋ค
		7. 4์์ ์์ฑํ ๋ฐฐ์ด๋ก String์ ์์ฑํด์ ๋ฐํํ๋ค
		*/
		//1
		if(src==null || src.length()==length) {
			return src;
		}
		//2
		else if(length <= 0) {
			return "";
		}
		//3
		else if(src.length() > length) {
			src = src.substring(0, length);
			return src;
		} 
		//4, 5
		char[] cArr = new char[length];
		for(int i = 0; i < cArr.length; i++) {
			cArr[i] = '0';
		}
		//6
		char[] temp = new char[src.length()];
		for(int i = 0; i < src.length(); i++) {
			temp[i] = src.charAt(i);
		}
		System.arraycopy(temp, 0, cArr, length-temp.length, temp.length);
		//๋ต : System.arraycopy(src.toCharArray(),0,chArr,length-src.length(),src.length());
		//๊ฐ๋จํ๊ฒ ์์ฝํด๋..
		
		return new String(cArr);			
		//join ์ ์๋๋ ํ๋๋ฐ ๊ทธ๋ฅ.. String์ผ๋ก ๋ฌถ์ผ๋ฉด ๋์ด์๋คใใใ
		
//		String s = "";
//		for(int i = 0; i < length; i++) {
//			s += c[i];
//		}
	}
	public static void main(String[] args) {
		String src = "12345";
		System.out.println(fillZero(src,10));
		System.out.println(fillZero(src,-1));
		System.out.println(fillZero(src,3));
	}
}

/*
 * [์คํ๊ฒฐ๊ณผ]
 * 0000012345
 * 
 * 123
 */


