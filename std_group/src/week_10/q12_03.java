package week_10;
/* ★
 * [12-3]
 * 다음 중 올바르지 않은 문장을 모두 고르시오.
 */
public class q12_03 {
	/*
	class Box<T extends Fruit> { // T 지네릭 타입 를 선언
		T item;
		void setItem(T item) { 
			this.item = item; 
		}
		T getItem() { 
			return item; 
		}
	}
	*/
}
//a. Box<?> b = new Box();
//b. Box<?> b = new Box<>();
//c. Box<?> b = new Box<Object>();
//d. Box<Object> b = new Box<Fruit>();
//e. Box b = new Box<Fruit>();
//f. Box<? extends Fruit> b = new Box<Apple>();
//g. Box<? extends Object> b = new Box<? extends Fruit>()

/*
 * [내가 생각한 답]
 * a, c, d, e, g
 * 아닌 이유 - a : <?>은 ? extends Object인데 생성자 부분은 통일되지 않음
 * 		   - c : <Object>가 Fruit보다 큰 범위이기 때문
 * 		   - d : 지네릭타입이 통일되지 않음
 * 		   - e : 마찬가지로 통일되지 않음
 * 	  	   - g : 지네릭타입을 지정하지않음
 */

/*
 * [답]
 * c, d, g
 * a는 객체 생성에 지네릭타입을 지정하지 않아도 문제가 되지는 않기 때문이다.
 * e는 가능은 하나 Box<?>b의 사용을 권장함.
 */


