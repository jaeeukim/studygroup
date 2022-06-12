package week_05;
/*
 * [9-11]
 * 커맨드라인으로 2~9사이의 두 개의 숫자를 받아서 두 숫자사이의 구구단을 출력하는 프로그램을 작성하시오.
 * 예를 들어 3과5 를 입력하면 3단부터 5단까지 출력한다.
 */
public class q9_11 {
	public static void main(String[] args) {
		if(args.length != 2) {
			System.out.println("시작 단과 끝 단 두 개의 정수를 입력해주세요");
			System.out.println("USAGE : GugudanTest 3 5");
		}
		
		int[] numArr = new int[args.length];
		for(int i = 0; i < args.length; i++) {
			numArr[i] = Integer.parseInt(args[i]);
			if(numArr[i] > 9 || numArr[i] < 2) {
				System.out.println("단의 범위는 2와 9사이의 값이어야 합니다.");
				System.out.println("USAGE : GugudanTest 3 5");
				break;
			}
		}
	
		int from = Math.min(numArr[0], numArr[1]);
		int to = Math.max(numArr[0], numArr[1]);
		
		for(int i = from; i <= to; i++) {
			for(int j = 1; j < 10; j++) {
				System.out.printf(i + "*" + j + "=%d\n", i*j);
			}
			System.out.println("");
		}
		
	}

}


