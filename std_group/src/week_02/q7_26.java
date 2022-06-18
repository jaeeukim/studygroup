package week_02;

/*
 * Outer 클래스의 내부 클래스 Inner 멤버변수 iv의 값을 출력하시오.
 * 실행결과 : 200
 */

/*
class Outer{
	static class Inner{
		int iv = 200;
	}
}

class Exercise7_26{
	public static void main(String[] args) {
		(1) 알맞은 코드를 넣어 완성하시오.
		System.out.println(oi.iv);
	}
}
*/

class Outer{
	static class Inner{
		int iv = 200;
	}
}

class Exercise7_26{
	public static void main(String[] args) {
		Outer.Inner oi = new Outer.Inner();
		System.out.println(oi.iv);
	}
}

/*
 * (1) : Outer.Inner oi = new Outer.Inner();
		 System.out.println(oi.iv);
 */

