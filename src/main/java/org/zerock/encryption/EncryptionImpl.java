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
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1)); // �ڿ� 16�� 16������ ǥ���� �Ѵٴ� ���̴�. �� ������ ǥ���ϴ� ���̴�.
        }
        
        
		return sb.toString();
	}
	
}
