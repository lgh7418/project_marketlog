package com.company.common;

import java.util.List;
import java.util.Map;

public class CommonUtils {
	// 공백 또는 null 체크
	public static boolean isEmpty(Object obj) {

		if(obj == null) return true;
		if ((obj instanceof String) && (((String)obj).trim().length() == 0)) { return true; }
	        if (obj instanceof Map) { return ((Map<?, ?>) obj).isEmpty(); }
	        if (obj instanceof Map) { return ((Map<?, ?>)obj).isEmpty(); } 
	        if (obj instanceof List) { return ((List<?>)obj).isEmpty(); }
	        if (obj instanceof Object[]) { return (((Object[])obj).length == 0); }

		return false;

	}
	
	// pc버전 주소를 모바일 버전으로 변경
	public static String changeAddress(String address) {
		if (address.indexOf("://m.") == -1) {
			if (address.indexOf("https://") != -1) {
				address = address.substring(8);
				address = "https://m." + address;
			}
			if (address.indexOf("http://") != -1) {
				address = address.substring(9);
				address = "https://m." + address;
			}
		}
		return address;
	}
}
