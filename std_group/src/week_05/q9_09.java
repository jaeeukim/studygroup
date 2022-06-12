package week_05;

/* 못하겠슈...
 * [9-9]
 * 다음과 같이 정의된 메서드를 작성하고 테스트하시오.
 * 메서드명 : delChar
 * 기   능 :  주어진 문자열에서 금지된 문자들을 제거하여 반환한다
 * 반환타입 : String
 * 매개변수 : String src- 변환할 문자열
 * 			String delCh - 제거할 문자들로 구성된 문자열
 * [힌트]  StringBuffer와 String클래스의 charAt(int i)과 indexOf(int ch) 사용 
 */
public class q9_09 {
	/*
	(1) delChar . 메서드를 작성하시오
	*/
	public static String delChar(String src, String delCh) {
		StringBuffer sb = new StringBuffer(src.length());
		
		for(int i = 0; i < sb.length(); i++) {
			for(int ch = 0; ch < delCh.length(); ch++) {
				if(sb.charAt(i) == delCh.charAt(ch)) {
					sb.deleteCharAt(i);
				}
			}
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		System.out.println("(1!2@3^4~5)"+" -> "
					+ delChar("(1!2@3^4~5)","~!@#$%^&*()"));
		System.out.println("(1 2 3 4\t5)"+" -> "
					+ delChar("(1 2 3 4\t5)"," \t"));
	}
}

/*
 * [실행결과]
 * (1!2@3^4~5) -> 12345
 * (1 2 3 4 5) -> (12345)
 */

/*
 * [답]
 * public static String delChar(String src, String delCh) {
 * 		StringBuffer sb = new StringBuffer(src.length());
 * 		for(int i=0; i < src.length();i++) {
 * 			char ch = src.charAt(i);
 * 			// ch가 delCh에 포함되있지 않으면(indexOf())로 못찾으면 sb에 추가
 * 			if(delCh.indexOf(ch)==-1) // indexOf(int ch)를 호출
 * 				sb.append(ch);
 * 		}
 * 		return sb.toString(); // StringBuffer String 에 저장된 내용을 으로 반환
 * }

 */

