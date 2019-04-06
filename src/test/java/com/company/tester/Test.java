package com.company.tester;

public class Test {

	public static void main(String[] args) {
		String address = "http://blog.naver.com";

		int result = address.indexOf("naver");	// 미포함 시 -1
		System.out.println(result);
		
		if (address.indexOf("https://") != -1) {
			address = address.substring(7);
			address = "https://m." + address;
		}
		if (address.indexOf("http://") != -1) {
			address = address.substring(7);
			address = "https://m." + address;
		}
	}
}
