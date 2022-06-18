package week_03;

/* 💢
 * [8-9]
 * 다음과 같은 조건의 예외클래스를 작성하고 테스트하시오.
 * [참고] 생성자는 실행결과를 보고 알맞게 작성해야한다.
 */
public class q8_9 {
	public static void main(String[] args) throws Exception
	{
	throw new UnsupportedFuctionException("지원하지 않는 기능입니다.",100); 
	}
}

// ------------------------------------------------------------------------------
// ...?? 풀기
class UnsupprotedFuctionException extends RuntimeException {
	// private final int ERR_CODE = 100;          100으로 선언하면 ERR_CODE = ErrorCode로 받을 수 없음
	private final int ERR_CODE;
	
	public UnsupprotedFuctionException(String Message, int ErrorCode){
		ErrorCode = 100;
		ERR_CODE = ErrorCode;
	}
	
	public int getErrorCode(){
		return ERR_CODE;
	}
	
	public String getMessage() {
		Exception e = new Exception();
		return e.getMessage(); 
	}
}

//------------------------------------------------------------------------------
//답
/*
 * 
 */
class UnsupprotedFuctionException extends RuntimeException {
	private final int ERR_CODE;
	
	UnsupprotedFuctionException(String message, int errorCode){
		super(message);
		ERR_CODE = errorCode;
	}
	
	UnsupportedFunctionException(String message){
		this(msg, 100);
	}
	
	public int getErrorCode(){
		return ERR_CODE;
	}
	/*
	 * 실행결과를 참고하고 작성 / super를 통해 부모로부터 오버라이딩
	 */
	public String getMessage() {
		return "[" + getErrCode() + "]" + super.getMessage();
	}
}