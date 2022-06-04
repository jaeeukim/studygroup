package week_02;

/*
 * 아래의 EventHandler 를 익명 클래스(anonymous class)로 변경하시오.
 */
/*
 * ex) 세계에 곤충이 3만개가 있다는것을 설명해야하는데 
 * 이걸 전부 3만개를 작성할수 없으니 한줄로 3만개가있다. 하고 넘어갈때 사용하곤 한다.
 */

import java.awt.*;
import java.awt.event.*;

/*
class Exercise7_28 {
	public static void main(String[] args) {
		Frame f = new Frame();
		f.addWindowListener(new EventHandler());
	}
}

class EventHandler extends WindowAdapter {
	public void windowClosing(WindowEvent e) {
		e.getWindow().setVisible(false);
		e.getWindow().dispose();
		System.exit(0);
	}
}
*/

class Exercise7_28 {
	public static void main(String[] args) {
		Frame f = new Frame();
		f.addWindowListener(new EventHandler());
	}
}

class EventHandler extends WindowAdapter {
	public void windowClosing(WindowEvent e) {
		e.getWindow().setVisible(false);
		e.getWindow().dispose();
		System.exit(0);
	}
}


// 책 예제 7-27 똑같음!
/* 답
class Exercise7_28_2 {
	public static void main(String[] args) {
		Frame f = new Frame();
		f.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
					e.getWindow().setVisible(false);
					e.getWindow().dispose();
					System.exit(0);
			}
		});
	} // main
}
*/