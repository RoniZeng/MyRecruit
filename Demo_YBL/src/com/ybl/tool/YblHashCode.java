package com.ybl.tool;

import java.security.GeneralSecurityException;

public class YblHashCode {
	public static void main(String[] args) {
		String a="ABc";
		
	}
	//º”√‹
	public String encrypt(String initial) throws GeneralSecurityException {
		int len=initial.length();
		String ans="";
		for(int i=0;i<len;i++){
			int x=initial.charAt(i);
			x=x*37+11;
			ans=ans+String.valueOf(x);
			//System.out.println(initial.charAt(i)+" "+x);
		}
		/*
		len=ans.length();
		for(int i=0;i<len;i++){
			System.out.print(ans.charAt(i));
		}*/
		return ans;
	}
	
	//Ω‚√‹
	public static String decrypt(String initial) throws GeneralSecurityException {
		return initial;
	}
}
