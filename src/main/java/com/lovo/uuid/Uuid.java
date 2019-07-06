package com.lovo.uuid;

import java.util.UUID;

public class Uuid {
	
	public static String uuid() {
		String uuid = null;
		for (int i = 0; i < 1; i++) {  
			uuid = UUID.randomUUID().toString().replaceAll("-","");  
		}
		return uuid;
	}
	
	
	public static void main(String[] args) {
		System.out.println(Uuid.uuid());
	}
}
