package week_08;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

/*
 * [11-10]
 * 다음 예제의 빙고판은 1~30사이의 숫자들로 만든 것인데 숫자들의 위치가 잘 
 * 섞이지 않는다는 문제가 있다. 이러한 문제가 발생하는 이유와 이 문제를 개선하기 위한
 * 방법을 설명하고 이를 개선한 새로운 코드를 작성하시오.
 */

//내가 생각한이유
/*
 * 자체적인 저장방식에 따라 순서가 결정되기 때문에 저장 순서를 저장하기 위해서는
 * LinkedHashSet을 사용해야한다.
 */


public class q11_10 {
	public static void main(String[] args) {
		// Set set = new HashSet();
		Set set = new LinkedHashSet();
		int[][] board = new int[5][5];
		
		for(int i=0; set.size() < 25; i++) {
			set.add((int)(Math.random()*30)+1+"");
		}
		
		Iterator it = set.iterator();
		
		for(int i=0; i < board.length; i++) {
			for(int j=0; j < board[i].length; j++) {
				board[i][j] = Integer.parseInt((String)it.next());
				System.out.print((board[i][j] < 10 ? " " : " ")	+ board[i][j]);
			}
			System.out.println();
		}
	} // main
}


//답
/* ArrayList list = new ArrayList(set); 
 * Collections.shuffle(list);
 * 
 * Iterator it = list.iterator();
 */




