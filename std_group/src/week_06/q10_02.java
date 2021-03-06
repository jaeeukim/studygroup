package week_06;

import java.text.SimpleDateFormat;
import java.time.temporal.ChronoField;
import java.util.Calendar;
import java.util.Date;
 
/*
 * [10-2]
 * 어떤 회사의 월급날이 매월 21일이다. 
 * 두 날짜 사이에 월급날이 몇 번있는지 계산해서 반환하는 메서드를 작성하고 테스트 하시오.
 */
public class q10_02 {
	static int paycheckCount(Calendar from, Calendar to) {
		/*
		(1) . 아래의 로직에 맞게 코드를 작성하시오
		1. from 또는 to가 null이면 0을 반환한다
		2. from 와 to가 같고 날짜가 21일이면 1을 반환한다
		3. to와 from 이 몇 개월 차이인지 계산해서 변수 monDiff에 담는다
		4. monDiff 가 음수이면 0을 반환한다
		5. 만일 from의 일(DAY_OF_MONTH)이 21일이거나 이전이고
		   to의 일(DAY_OF_MONTH)이 21일이거나 이후이면 monDiff의 값을 1 증가시킨다
		6. 만일 from의 일(DAY_OF_MONTH)이 21일 이후고
		   to의 일(DAY_OF_MONTH)이 21일 이전이면 monDiff의 값을 1 감소시킨다
		*/
		if(from.get(Calendar.YEAR) <= to.get(Calendar.YEAR)) {
			if(from == null || to == null) {
				return 0;
			} else if(from == to && from.get(Calendar.DAY_OF_MONTH) == 21) {
				return 1;
			} 
			int monDiff = to.get(Calendar.MONTH) - from.get(Calendar.MONTH);
			if(monDiff < 0) {
				return 0;
			} else if (from.get(Calendar.DAY_OF_MONTH) <= 21 && to.get(Calendar.DAY_OF_MONTH) >= 21) {
				monDiff++;
			} else if(from.get(Calendar.DAY_OF_MONTH) > 21 && to.get(Calendar.DAY_OF_MONTH) < 21) {
				monDiff--;
			}
			return monDiff;
		} else {
			return 0;
		}
	}
	static void printResult(Calendar from, Calendar to) {
		Date fromDate = from.getTime();
		Date toDate = to.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.print(sdf.format(fromDate)+" ~ "	+sdf.format(toDate)+":");
		System.out.println(paycheckCount(from, to));
	}
	public static void main(String[] args) {
		Calendar fromCal = Calendar.getInstance();
		Calendar toCal = Calendar.getInstance();
		
		fromCal.set(2010,0,1);
		toCal.set(2010,0,1);
		printResult(fromCal, toCal);
		
		fromCal.set(2010,0,21);
		toCal.set(2010,0,21);
		printResult(fromCal, toCal);
		
		fromCal.set(2010,0,1);
		toCal.set(2010,2,1);
		printResult(fromCal, toCal);
		
		fromCal.set(2010,0,1);
		toCal.set(2010,2,23);
		printResult(fromCal, toCal);
		
		fromCal.set(2010,0,23);
		toCal.set(2010,2,21);
		printResult(fromCal, toCal);
		
		fromCal.set(2011,0,22);
		toCal.set(2010,2,21);
		printResult(fromCal, toCal);
	}
				
}

/*
 * // 1. from또는 to가 null이면 0을 반환한다
	if(from==null || to==null) return 0;
	// 2. from와 to가 같고 날짜가 21일이면 1을 반환한다
	if(from.equals(to) && from.get(Calendar.DAY_OF_MONTH)==21) {
		return 1;
	}
	int fromYear = from.get(Calendar.YEAR);
	int fromMon = from.get(Calendar.MONTH);
	int fromDay = from.get(Calendar.DAY_OF_MONTH);
	int toYear = to.get(Calendar.YEAR);
	int toMon = to.get(Calendar.MONTH);
	int toDay = to.get(Calendar.DAY_OF_MONTH);
	
	// 3. to와 from이 몇 개월 차이인지 계산해서 변수 monDiff에 담는다
	int monDiff = (toYear * 12 + toMon) - (fromYear * 12 + fromMon);
	
	// 4. monDiff가 음수이면 0을 반환한다
	if(monDiff < 0) return 0;
	
	// 5. from (DAY_OF_MONTH) 21 만일 의 일 이 일이거나 이전이고
	// to (DAY_OF_MONTH) 21 monDiff 1 . 의 일 이 일이거나 이후이면 의 값을 증가시킨다
	if(fromDay <= 21 && toDay >= 21)
		monDiff++;
	
	// 6. 만일 from의 일(DAY_OF_MONTH)이 21일 이후고
	// to의 일(DAY_OF_MONTH)이 일 21이전이면 monDiff의 값을 1 감소시킨다
	if(fromDay > 21 && toDay < 21)
		monDiff--;
 * 
 */
//[실행결과]
//2010-01-01 ~ 2010-01-01:0
//2010-01-21 ~ 2010-01-21:1
//2010-01-01 ~ 2010-03-01:2
//2010-01-01 ~ 2010-03-23:3
//2010-01-23 ~ 2010-03-21:2
//2011-01-22 ~ 2010-03-21:0

