package week_10;
/*
 * [12-1]
 * 클래스 Box가 다음과 같이 정의되어 있을 때 다음 중 오류가 발생하는 문장은?
 * 경고가 발생하는 문장은?
 */
public class q12_01 {
	class Box<T> { // 지네릭 타입 T를 선언
		T item;
		
		void setItem(T item) {
			this.item = item; 
		}
		T getItem() { 
			return item; 
		}
	}
}

//a. Box<Object> b = new Box<String>();
//b. Box<Object> b = (Object)new Box<String>();
//c. new Box<String>().setItem(new Object());
//d. new Box<String>().setItem("ABC");

/*
 * [내가 생각한 답]
 * 오류발생 - a,b,c 
 * 		(참조타입에 사용된 지네릭타입과 생성자에 사용된 지네릭타입 매개변수는 동일해야만한다.
 * 		 당연히 형변환도 불가능하다.)
 * 경고발생 - ?
 */