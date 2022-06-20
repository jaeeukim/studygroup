package week_06;
 
import java.time.LocalDate;
import java.time.Month;
import java.time.Period;
import java.util.Calendar;

/* 왜안되는지 모르겠음 ㅜㅠ
 * [10-5]
 * 다음과 같이 정의된 메서드를 작성하고 테스트하시오.
 * 메서드명 : getDayDiff
 * 기   능 : yyyymmdd형식의 두 문자열을 넘겨받으면 두 날짜의 차이를 일(day)단위로 반환한다.
 * 			단, 첫 번째 날짜 빼기 두 번째 날짜의 결과를 반환한다.
 * 만일 주어진 문자열이 유효하지 않으면 0을 반환한다.
 * 반환타입 : int
 * 매개변수 : String yyyymmdd1 - 시작날짜 
 * 			String yyyymmdd2 - 끝 날짜
 */
public class q10_05 {

	/*
	(1) getDayDiff . 메서드를 작성하시오
	*/
	private static int getDayDiff(String yyyymmdd1, String yyyymmdd2) {
	    
		try {
			int start_year = Integer.parseInt(yyyymmdd1.substring(0, 4));
			int start_month = Integer.parseInt(yyyymmdd1.substring(4, 6));
			int start_date = Integer.parseInt(yyyymmdd1.substring(6, 8));
			int end__year = Integer.parseInt(yyyymmdd2.substring(0, 4));
			int end_month = Integer.parseInt(yyyymmdd2.substring(4, 6));
			int end__date = Integer.parseInt(yyyymmdd2.substring(6, 8));			

			Calendar cal1 = Calendar.getInstance();
			Calendar cal2 = Calendar.getInstance();
			
			cal1.set(start_year, start_month, start_date);
			cal2.set(end__year, end_month, end__date);
//			System.out.println(cal1.getTime());
//			System.out.println(cal2.getTime());
			System.out.println(cal1.get(Calendar.DAY_OF_MONTH) - cal2.get(Calendar.DAY_OF_MONTH));
			return (int)((cal1.getTimeInMillis() - cal2.getTimeInMillis()) / (60*60*1000*24));
		} catch (Exception e){
			return 0;
		}
		
	}
	
	
	public static void main(String[] args){
		System.out.println(getDayDiff("20010103","20010101"));
		System.out.println(getDayDiff("20010103","20010103"));
		System.out.println(getDayDiff("20010103","200103"));
	}

}


/*
 * [실행결과]
 * 2
 * 0
 * 0
 */



