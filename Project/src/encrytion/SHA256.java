package encrytion;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	
	// SHA256으로 암호화하는 메서드
	public String enc256(String pwd) throws NoSuchAlgorithmException {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(pwd.getBytes());
		
		return bytesToHex(md.digest());
	}
	
	// 바이트 형식의 문자열을 16진수 문자열로 변환해주는 메서드
	private String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        
        return builder.toString();
    }
}