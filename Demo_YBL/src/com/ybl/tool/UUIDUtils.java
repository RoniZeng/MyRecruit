package com.ybl.tool;

import java.util.UUID;

/**
 * ��������ַ����Ĺ�����
 * @author 
 *
 */
public class UUIDUtils {
	/**
	 * ���������ַ���
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	public static void main(String[] args) {
		UUIDUtils u = new UUIDUtils();
		System.out.println(u.getUUID());
	}
}

