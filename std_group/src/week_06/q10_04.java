package week_06;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

/*
 * [10-4]
 * 화면으로부터 날짜를 “2007/05/11”의 형태로 입력받아서 무슨 요일인지 출력하
 * 는 프로그램을 작성하시오.
 * 단 입력된 날짜의 형식이 잘못된 경우 메세지를 보여주고 다시 입력받아야 한다.
 */
public class q10_04 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		
		System.out.println("날짜를 yyyy/MM/dd의 형태로 입력해주세요. (입력예:2007/05/11)");
		System.out.print(">>");
	
		Date user = null;
		
		while(sc.hasNextLine()) {
			try {
				user = df.parse(sc.nextLine());
				break;
			} catch (ParseException e) {
				System.out.println("날짜를 yyyy/MM/dd의 형태로 입력해주세요. (입력예:2007/05/11)");
			}			
		}
		

		SimpleDateFormat sdf = new SimpleDateFormat("E요일");
		
		System.out.println("입력하신 날짜는 " + sdf.format(user) + " 입니다.");
		
		
		
	}
}


/*
 * [실행결과]
 * 날짜를 yyyy/MM/dd의 형태로 입력해주세요.(입력예 :2007/05/11)
	>>2009-12-12
	날짜를 yyyy/MM/dd의 형태로 입력해주세요.(입력예 :2007/05/11)
	>>2009/12/12
	입력하신 날짜는 토요일입니다
 */



