package com.ybl.tool;

import java.util.Random;

public class YblRand {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//stringRand(6);
	}
	
	public String stringRand(int len){
		String code = new String();
		Random r3 = new Random();
        System.out.println();
        System.out.println("ʹ������ȱʡ�ǵ�ǰϵͳʱ��ĺ�������Random��������[0,10)�������������");
        for (int i = 0; i < len; i++) {
        	String tem=String.valueOf(r3.nextInt(10));
            System.out.println(tem);
            code+=tem;
        }
        System.out.println(code);
        return code;
	}
}
