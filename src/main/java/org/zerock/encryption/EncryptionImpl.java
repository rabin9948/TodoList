package org.zerock.encryption;

import java.security.MessageDigest;

import org.springframework.stereotype.Repository;

@Repository
public class EncryptionImpl implements Encryption {

	@Override
	public String encyptPW(String pw) throws Exception {
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(pw.getBytes());
		
		byte byteData[] = md.digest();
		
		StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1)); // 뒤에 16은 16진수로 표현을 한다는 것이다. 즉 진수를 표현하는 것이다.
        }
        
        
		return sb.toString();
	}
	
}
