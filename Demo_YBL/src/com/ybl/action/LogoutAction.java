package com.ybl.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport{

	public void logout(){
		Map session = ActionContext.getContext().getSession();
		session.clear();
	}
}
