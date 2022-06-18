package week_03;

/*
 * [8-10]
 * 아래의 코드가 수행되었을때의 실행결과를 적으시오.
 */
public class q8_10 {
	public static void main(String[] args) {
		try {
			method1();
			System.out.println(6);
		} catch(Exception e) {
			System.out.println(7);
		}
	}
		
	static void method1() throws Exception {
		try {
			method2();
			System.out.println(1);
		} catch(NullPointerException e) {
			System.out.println(2);
			throw e;
		} catch(Exception e) {
			System.out.println(3);
		} finally {
			System.out.println(4);
		}
		System.out.println(5);
	} // method1()
		
	static void method2() {
		throw new NullPointerException();
	}
}

//------------------------------------------------------------------------------
/*
 * 실행결과
 * 2
 * 4
 * 7
 */




