package week_2;
/*
 * [7-24]
 * 다음 중 인터페이스의 장점이 아닌 것은?
 * 		5. 패키지간의 연결을 도와준다.
 */
// p.60 & p.290

/*
 * [7-25] 
 *  Outer 클래스의 내부 클래스 Inner 의 멤버변수 iv의 값을 출력하시오.
 *  실행결과 : 100
 *  
 *  class Outer{
 *  	class Inner{
 *  		int iv = 100;
 *  	}
 *  }
 *  
 *  class Exercise7_25{
 *  	public static void main(String[] args){
 *  		(1) 알맞은 코드를 작성하시오.
 *  	}
 *  }
 *  
 *  
 */

class Outer {
	class Inner{
		int iv = 100;
	}
}

class Exercise7_25{
	public static void main(String[] args) {
		Outer o = new Outer();
		Outer.Inner oi = o.new Inner();
		System.out.println(oi.iv);
	}
}

/*
 * (1) : Outer o = new Outer();
 * 		 Outer.Inner oi = o.new Inner();
 * 		 System.out.println(oi.iv);
 */
