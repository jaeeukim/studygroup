package week_05;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/*
 * [9-14]
 *  다음은 화면으로부터 전화번호의 일부를 입력받아 일치하는 전화번호를 주어진 문자열 배열에서 찾아서 출력하는 프로그램이다 알맞은 코드를 넣어 프로그램을 완성하시오.
 * [Hint] Pattern, Matcher클래스를 사용할 것
 */
public class q9_14 {
	public static void main(String[] args) {
		String[] phoneNumArr = {
		"012-3456-7890",
		"099-2456-7980",
		"088-2346-9870",
		"013-3456-7890"
		};
		
		ArrayList list = new ArrayList();
		Scanner s = new Scanner(System.in);
		
		while(true) {
			System.out.print(">>");
			String input = s.nextLine().trim();
			if(input.equals("")) {
				continue;
			} else if(input.equalsIgnoreCase("Q")) {
				System.exit(0);
			}
			
			/*
			(1) . 알맞은 코드를 넣어 완성하시오
			 */
			// ----------------------------------------------------------
			String[] str = new String[4];
			for(int i = 0; i < str.length; i++) {
				str[i] = phoneNumArr[i].substring(0, 3) + phoneNumArr[i].substring(4, 8) + phoneNumArr[i].substring(9);
			}
			Pattern p = Pattern.compile(".*" + input + ".*");
			
			for(int i = 0; i < phoneNumArr.length; i++) {
				Matcher m = p.matcher(str[i]);
				if(m.matches()) {
					list.add(phoneNumArr[i]); 
				}
			}
			// ----------------------------------------------------------
	
			if(list.size()>0) {
				System.out.println(list);
				list.clear();
			} else {
				System.out.println("일치하는 번호가 없습니다."); 
			}
		} //while
	} // main

}


/*
 * [실행결과]
 * >>
 * >>
 * >>asdf
 * 일치하는 번호가 없습니다.
 * >>
 * >>
 * >>0
 * [012-3456-7890, 099-2456-7980, 088-2346-9870, 013-3456-7890]
 * >>234
 * [012-3456-7890, 088-2346-9870]
 * >>7890
 * [012-3456-7890, 013-3456-7890]
 * >>q
 */

/*
 * [답]
 * String pattern = ".*"+input+".*"; // input을 포함하는 모든 문자열
 * Pattern p = Pattern.compile(pattern);
 * for(int i=0; i< phoneNumArr.length;i++) {
 * 		String phoneNum = phoneNumArr[i];
 * 		String tmp = phoneNum.replace("-",""); // phoneNum '-' 에서 를 제거
 * 		Matcher m = p.matcher(tmp);
 * 		if(m.find()) { // 패턴과 일치하면 list에 phoneNum을 추가한다
 *			 list.add(phoneNum);
 *		 }
 * }
 */

