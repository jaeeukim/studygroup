package week_03;

/* ๐ข
 * [8-9]
 * ๋ค์๊ณผ ๊ฐ์ ์กฐ๊ฑด์ ์์ธํด๋์ค๋ฅผ ์์ฑํ๊ณ  ํ์คํธํ์์ค.
 * [์ฐธ๊ณ ] ์์ฑ์๋ ์คํ๊ฒฐ๊ณผ๋ฅผ ๋ณด๊ณ  ์๋ง๊ฒ ์์ฑํด์ผํ๋ค.
 */
public class q8_9 {
	public static void main(String[] args) throws Exception
	{
	throw new UnsupportedFuctionException("์ง์ํ์ง ์๋ ๊ธฐ๋ฅ์๋๋ค.",100); 
	}
}

// ------------------------------------------------------------------------------
// ...?? ํ๊ธฐ
class UnsupprotedFuctionException extends RuntimeException {
	// private final int ERR_CODE = 100;          100์ผ๋ก ์ ์ธํ๋ฉด ERR_CODE = ErrorCode๋ก ๋ฐ์ ์ ์์
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
//๋ต
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
	 * ์คํ๊ฒฐ๊ณผ๋ฅผ ์ฐธ๊ณ ํ๊ณ  ์์ฑ / super๋ฅผ ํตํด ๋ถ๋ชจ๋ก๋ถํฐ ์ค๋ฒ๋ผ์ด๋ฉ
	 */
	public String getMessage() {
		return "[" + getErrCode() + "]" + super.getMessage();
	}
}