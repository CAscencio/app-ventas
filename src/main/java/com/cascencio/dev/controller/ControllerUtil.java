package com.cascencio.dev.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ControllerUtil {
	
	private ControllerUtil() {}

	public static void responseJson(HttpServletResponse response, String data) {
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(data);
			out.flush();
		} catch (Exception e) {
			System.out.println("Error inseperado :c");
		}
	}
}
