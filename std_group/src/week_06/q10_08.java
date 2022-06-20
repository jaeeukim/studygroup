package week_06;
/*
 * [10-8]
 * 서울과 뉴욕간의 시차가 얼마인지 계산하여 출력하시오.
 */
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoField;
 
public class q10_08 {
	public static void main(String[] args) {
		ZoneId sid = ZoneId.of("Asia/Seoul"); 
		ZoneId nid = ZoneId.of("America/New_York"); 
	
		ZonedDateTime seoulTime = ZonedDateTime.now();
		ZonedDateTime nyTime = ZonedDateTime.now().withZoneSameInstant(nid);
		
		ZoneOffset seoulOf = seoulTime.getOffset();
		int sec1 = seoulOf.get(ChronoField.OFFSET_SECONDS);
		ZoneOffset nyOf = nyTime.getOffset();
		int sec2 = nyOf.get(ChronoField.OFFSET_SECONDS);
		int diff = (sec1 - sec2) /(60*60);
		
		System.out.println(seoulTime);
		System.out.println(nyTime);		
		System.out.println("sec1=" + sec1);
		System.out.println("sec2=" + sec2);
		System.out.println("diff=" + diff +" hrs");
	}
}

//[실행결과]
//2016-01-28T23:01:00.136+09:00[Asia/Seoul]
//2016-01-28T09:01:00.138-05:00[America/New_York]
//sec1=32400
//sec2=-18000
//diff=14 hrs
