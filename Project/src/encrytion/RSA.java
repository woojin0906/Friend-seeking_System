package encrytion;

import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;

public class RSA {

//		// 공개, 개인키 생성후 키 저장
//		public void createKeyBox(Key publicKey, Key privateKey) throws NoSuchAlgorithmException {
//			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
//			generator.initialize(2048); // 키 사이즈가 부족하지 않게 넉넉하게 줌
//			
//			KeyPair keyPair = generator.genKeyPair();
//			publicKey = keyPair.getPublic();
//			privateKey = keyPair.getPrivate();
//		}
		
		// RSA로 전달받은 평문 암호화
		public String encrytionRSA(String plainText, Key publicKey) throws Exception {
			
			Cipher cipher = Cipher.getInstance("RSA"); 			// 사용 알고리즘을 RSA로 지정
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);		// cipher엔진 동작모드를 암호화 연산모드로 설정하고 키 지정
			byte[] arrCipherData = cipher.doFinal(plainText.getBytes());		// 암호화 연산 수행
			String cipherText = new String(arrCipherData);			// 바이트 문자열을 문자열로 변환
			
			return cipherText;
		}
		
		// RSA로 전달받은 암호문 복호화
		public String decryptionRSA(String cipherText, Key privateKey) throws Exception {
			
			Cipher cipher = Cipher.getInstance("RSA"); 			// 사용 알고리즘을 RSA로 지정
			cipher.init(Cipher.DECRYPT_MODE, privateKey);		// cipher엔진 동작모드를 복호화 연산모드로 설정하고 키 지정
			byte[] arrData = cipher.doFinal(cipherText.getBytes());		// 복호화 연산 수행
			String plainText = new String(arrData);			// 바이트 문자열을 문자열로 변환
			
			return plainText;
		}
}
