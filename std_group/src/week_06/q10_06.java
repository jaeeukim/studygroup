package week_06;

import java.util.Calendar;
import java.util.Date;
 
/*
 * [10-6]
 * 자신이 태어난 날부터 지금까지 며칠이 지났는지 계산해서 출력하시오.
 */
public class q10_06 {
	public static void main(String[] args) {

		Calendar birth = Calendar.getInstance();
		Calendar now = Calendar.getInstance();
		birth.set(1997, 5 -1, 30);
		
		int diff = (int) ((now.getTimeInMillis() - birth.getTimeInMillis())/(60*60*24*1000));
		System.out.println("birthday="+birth.get(Calendar.YEAR) + "-" + (birth.get(Calendar.MONTH)+1) +"-"
				+ birth.get(Calendar.DATE));
		System.out.println("today   ="+now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH)+1) +"-"
				+ now.get(Calendar.DATE));
		System.out.println(diff + " days");
	}
}

//[답]
//public static void main(String[] args) {
//	LocalDate birthDay = LocalDate.of(2000, 1, 1); // 자신의 생일을 지정
//	LocalDate now = LocalDate.now();
//	long days = birthDay.until(now, ChronoUnit.DAYS);
//	System.out.println("birth day="+birthDay);
//	System.out.println("today ="+now);
//	System.out.println(days +" days");
//}
