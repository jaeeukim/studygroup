package week_06;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoField;

/*
 * [10-7]
 *  2016년 12월 네번째 화요일의 날짜를 아래의 실행결과와 같은 형식으로 출력하시오.
 */
public class q10_07 {
	public static void main(String[] args) {
		
		for(int i = 1; i <= 31; i++) {
			LocalDate date16 = LocalDate.of(2016, 12, i);
			if(date16.get(ChronoField.ALIGNED_WEEK_OF_MONTH) == 4 && date16.get(ChronoField.DAY_OF_WEEK) ==2) {
				System.out.println(date16);
				break;
			} else {
				continue;
			}
		}
		
		
	}
}
/*
 * [답]
 * LocalDate date = LocalDate.of(2016, 12, 1);
 * System.out.println(date.with(dayOfWeekInMonth(4, TUESDAY)));
 */
/*
 * [실행결과]
 * 2016-12-27
 */