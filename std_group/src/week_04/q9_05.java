package week_04;
/*
 * [9-5]
 * 다음과 같이 정의된 메서드를 작성하고 테스트하시오.
 * 메서드명 : count
 * 기 능   : 주어진 문자열(src)에 찾으려는 문자열 (target) 이 몇 번 나오는지 세어서 반환한다.
 * 반환타입 : int
 * 매개변수 : String src
 * 			String target
 */
public class q9_05 {
	public static int count(String src, String target) {
		int count = 0; // 찾은 횟수
		int pos = 0; // 찾기 시작할 위치
		/*
		(1) 반복문을 사용해서 아래의 과정을 반복한다
		1. src에서 target 을 pos의 위치부터 찾는다.
		2. 찾으면 count의 값을 1 증가 시키고
		   pos의 값을 target.length만큼 증가시킨다.
		3. indexOf의 결과가 -1이면 반복문을 빠져나가서 count를 반환한다
		*/
		
		while(true) {
			pos = src.indexOf(target, pos);
			if(pos != -1) {
				count++;
				pos += target.length();
			} else {
				return count;				
			}
		}
		
		//for문
//		for(int i = 0; i < src.length(); i++) {
//            pos = src.indexOf(target, pos);
//            if(pos != -1) {
//                count++;
//                pos += target.length();
//            } else if(pos == -1) {
//                break;
//            }
//        }
//        return count;
    
		//보슬이 
//		while(src.indexOf(target, pos) != -1) {
//            pos = src.indexOf(target, pos) + target.length();
//            ++count;
//            }
//        return count;
		
		
	}
	public static void main(String[] args) {
		System.out.println(count("12345AB12AB345AB","AB"));
		System.out.println(count("12345","AB"));
	}
}

/*
 * [실행결과]
 * 3
 * 0
 */


//답

//pos = src.indexOf(target, pos);
//if(pos != -1) {
//	count++;
//	pos += target.length();
//} else {
//	break;				
//}
//return count;


