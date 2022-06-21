package week_06;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
 
/*
 * [10-1]
 *  Calendar 클래스와 SimpleDateFormat클래스를 이용해서 2010년의 매월 두 번째
 * 일요일의 날짜를 출력하시오.
 */
public class q10_01 {
	public static void main(String[] args) {
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd은 F번째 E요일입니다.");
		
		for(int i = 0; i <= 11; i++) {
			for(int j = 1; j <= 31; j++) {
				cal.set(2010, i, j);
				Date date = cal.getTime();
				if(cal.get(Calendar.DAY_OF_WEEK_IN_MONTH) == 2 && cal.get(Calendar.DAY_OF_WEEK) == 1) {
					System.out.println(sdf.format(date));
				}				
			}
		}
	}
}

//[규연언니 답]
// Calendar cal = Calendar.getInstance();
//SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//SimpleDateFormat sdf2 = new SimpleDateFormat("F번째 E요일입니다.");
//for(int i = 0; i < 12; i++) {
//    for(int j = 1; j <= 31 ; j++) {
//        cal.set(2010, i, j);
//        Date day = cal.getTime();
//        if(sdf2.format(day).equals("2번째 일요일입니다.")) {
//            System.out.println(sdf1.format(day) + "은 " + sdf2.format(day));
//        }
//    }
//}



//[정답]
//Calendar cal = Calendar.getInstance();
//cal.set(2010,0,1); // cal의 날짜를 2010년 1월  1일로 설정한다
//for(int i=0; i < 12;i++) {
//	int weekday = cal.get(Calendar.DAY_OF_WEEK); // 1일의 요일을 구한다
//
//	// 두 번째 일요일은 1일의 요일에 따라 달라진다
//	// 1일이 일요일인 경우에는 두번째 일요일은 8일이고
//	// 1일이 다른 요일일 때는  16에서 1일의 요일(weekday)을 빼면 알 수 있다
//	int secondSunday = (weekday==1) ? 8 : 16 - weekday;
//
//	// 두 번째 일요일(secondSunday)로 cal의 날짜(DAY_OF_MONTH)를 바꾼다
//	cal.set(Calendar.DAY_OF_MONTH, secondSunday);
//
//	Date d = cal.getTime(); // Calendar를 Date로 변환한다
//	System.out.println(new SimpleDateFormat("yyyy-MM-dd 은 F번째 E요일입니다.").format(d));
//	// 1 . 날짜를 다음달 일로 변경한다
//	cal.add(Calendar.MONTH, 1);
//	cal.set(Calendar.DAY_OF_MONTH,1);
//}


//[실행결과]
//2010-01-10은 2번째 일요일입니다
//2010-02-14은 2번째 일요일입니다
//2010-03-14은 2번째 일요일입니다
//2010-04-11은 2번째 일요일입니다
//2010-05-09은 2번째 일요일입니다
//2010-06-13은 2번째 일요일입니다
//2010-07-11은 2번째 일요일입니다
//2010-08-08은 2번째 일요일입니다
//2010-09-12은 2번째 일요일입니다
//2010-10-10은 2번째 일요일입니다
//2010-11-14은 2번째 일요일입니다
//2010-12-12은 2번째 일요일입니다