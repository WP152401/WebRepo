package org.dimigo.util;

public class CommonUtil {
	public static boolean isEmpty(String input) {
		return input == null || "".equals(input.trim());
	}
	public static void main(String[] args) {
		String uri = "/login.do";
		
		// login �� �����ϱ�
		String actionName = uri.substring(uri.lastIndexOf("/")+1); //login.do
		actionName.substring(0,actionName.indexOf("."));
		System.out.println("actionName :" + actionName);
	}
}
