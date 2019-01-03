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
        System.out.println("使用种子缺省是当前系统时间的毫秒数的Random对象生成[0,10)内随机整数序列");
        for (int i = 0; i < len; i++) {
        	String tem=String.valueOf(r3.nextInt(10));
            System.out.println(tem);
            code+=tem;
        }
        System.out.println(code);
        return code;
	}
}
