package week_06;

import java.text.DecimalFormat;
 
/*[10-3]
 * 문자열 “123,456,789.5”를 소수점 첫 번째 자리에서 반올림하고 그 값을 만 단
 * 위마다 콤마 로(,) 구분해서 출력하시오 
 */
public class q10_03 {
	public static void main(String agrs[]) {
		String data = "123,456,789.5";
		
		DecimalFormat df1 = new DecimalFormat("#,###.##");
		DecimalFormat df2 = new DecimalFormat("#");
		DecimalFormat df3 = new DecimalFormat("#,####"); // "#,###0"으로도 가능하다.
		
		// parseInt메서드는 콤마가있는 문자열을 숫자로 변환할수 없다.
		try {
			Number num = df1.parse(data);
			double d = num.doubleValue();
			
			System.out.println("data:"+data);
			System.out.println("반올림:"+ df2.format(d));  //Math.round
			// System.out.println("반올림:"+ Math.round(d));도 가능
			System.out.println("만단위:"+df3.format(d));
			
		}catch(Exception e) {
		}
	}
	

}


//답
/*
 * DecimalFormat df = new DecimalFormat("#,###.##"); // 변환할 문자열의 형식을 지정
 * DecimalFormat df2 = new DecimalFormat("#,####");
 * 
 * try{ 
 * Number num = df.parse(data);
 * double d = num.doubleValue();
 * System.out.println("data:"+data);
 * System.out.println(" :"+Math.round(d)); 반올림
 * System.out.println(" :"+df2.format(d)); 
 * ...
 */



/*
 * [실행결과]
 * data:123,456,789.5
 * 반올림:123456790
 * 만단위:1,2345,6790
 */
