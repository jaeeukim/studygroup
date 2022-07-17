package week_10;
/*
 * [12-2]
 * 지네릭 메서드 makeJuice()가 아래와 같이 정의되어 있을 때 이 메서드를 
 * 올바르게 호출한 문장을 모두 고르시오.
 * (Apple과 Grape는 Fruit의 자손이라고 가정하자.
 */
public class q12_02 {
	class Juicer {
//		static <T extends Fruit> String makeJuice(FruitBox<T> box) {
//			String tmp = "";
//			for(Fruit f : box.getList())
//				tmp += f + " ";
//			return tmp;
//			}
	}
}
//a. Juicer.<Apple>makeJuice(new FruitBox<Fruit>());
//b. Juicer.<Fruit>makeJuice(new FruitBox<Grape>());
//c. Juicer.<Fruit>makeJuice(new FruitBox<Fruit>());
//d. Juicer.makeJuice(new FruitBox<Apple>());
//e. Juicer.makeJuice(new FruitBox<Object>());
/*
 * [내가 생각한 답]
 * 올바르게 호출한 문장 : c, d
 * 		  선택한 이유 : 일단 a, b는 타입 불일치
 * 					  e 는 Fruit의 부모이다.
 */


