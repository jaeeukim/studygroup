package week_04;

/*
 * [9-7]
 * 다음과 같이 정의된 메서드를 작성하고 테스트하시오.
 * 메서드명 : contains
 * 기   능 : 첫 번째 문자열(src) 에 두 번째 문자열(target) 이 포함되어 있는지 확인한다.
 *			포함되어 있으면 true 그렇지 않으면 false를 반환한다.
 * 반환타입 : boolean
 * 매개변수 : String src
 * `		String target
 * 
 * [Hint] String indexOf() 클래스의 를 사용할 것
 */
public class q9_07 {
	/*
	(1) contains . 메서드를 작성하시오
	*/
	public static boolean contains(String str, String target) {
		int idx = str.indexOf(target);
		if(idx == -1) {
			return false;
		} else {
			return true;			
		}
	}
	
	
	
	public static void main(String[] args) {
		System.out.println(contains("12345","23"));
		System.out.println(contains("12345","67"));
	}
}

/*
 * [실행결과]
 * true
 * false
 */

