package encrytion;

import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;

public class RSA {
		// RSA로 전달받은 암호문 복호화
		public String decryptRsa(Key privateKey, String cipherText) throws Exception {
			
		    Cipher cipher = Cipher.getInstance("RSA");	// 사용 알고리즘을 RSA로 지정
		    byte[] encryptedBytes = hexToByteArray(cipherText);  // 복호화를 위해 암호문을 바이트 배열로 변환
		    cipher.init(Cipher.DECRYPT_MODE, privateKey);  // cipher엔진 동작모드를 복호화 연산모드로 설정하고 키 지정
		    byte[] decryptedBytes = cipher.doFinal(encryptedBytes);  // 복호화 연산 수행
		    String decryptedValue = new String(decryptedBytes, "utf-8");  // 복호화 된 평문을 UTF-8 인코딩 방식의 문자열로 변환
		   
		    return decryptedValue;
		}
		
		public static byte[] hexToByteArray(String hex) {
		    if (hex == null || hex.length() % 2 != 0) {
		        return new byte[]{};
		    }

		    byte[] bytes = new byte[hex.length() / 2];
		    for (int i = 0; i < hex.length(); i += 2) {
		        byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
		        bytes[(int) Math.floor(i / 2)] = value;
		    }
		    return bytes;
		}
}
