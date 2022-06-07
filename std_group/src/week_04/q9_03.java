package week_04;

/*
 * [9-3]
 * 다음과 같은 실행결과가 나오도록 코드를 완성하시오.
 */
// 나는 직접 subString을 사용했고 답지는 lastIndexOf를 사용한 후 subString을 사용했다.
public class q9_03 {
	public static void main(String[] args) {
		String fullPath = "c:\\jdk1.8\\work\\PathSeparateTest.java";
		String path = "";
		String fileName = "";
		/*
		(1) . 알맞은 코드를 넣어 완성하시오
		*/
		path = fullPath.substring(0, 14);
		fileName = fullPath.substring(15);
		
		//규연 언니
//		fullPath = fullPath.replaceAll("'\\'", "'\'");
//		int index = fullPath.lastIndexOf("\\");
//		path = fullPath.substring(0, index);
//		
//		fileName = fullPath.substring(index + 1);
				
		
		
		System.out.println("fullPath:"+fullPath);
		System.out.println("path:"+path);
		System.out.println("fileName:"+fileName);
	}
}

/*
 * 실행결과
 * fullPath:c:\jdk1.8\work\PathSeparateTest.java
 * path:c:\jdk1.8\work
 * fileName:PathSeparateTest.java
 */

// 답
 
/*
 * int pos = fullPath.lastIndexOf("\\");
 * if(pos!=-1) {
 * 		path = fullPath.substring(0, pos);
 * 		fileName = fullPath.substring(pos+1);
 * }
 */


