package com.action;

import com.model.Input;
import com.model.Data;
import com.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.interceptor.SessionAware;

public class Submit extends ActionSupport implements ModelDriven<Input>, SessionAware{

	private static final long serialVersionUID = 1L;
	private Input input = new Input();
	private Data data=new Data();
	public Map<String, Object> session;
	
	
	public String execute() throws Exception {
		SearchService obj=new SearchService();
		setData(obj.getService(input));
		System.out.println(input.getMode());
		return input.getMode();
	}
	
	public void validate() {
		   if(StringUtils.isEmpty(input.getFrom())){
			   addFieldError("From","Cannot be blank");
		   }
		   if(StringUtils.isEmpty(input.getTo())){
			   addFieldError("To","Cannot be blank");
		   }
		   if(StringUtils.isEmpty(input.getMode())){
			   addFieldError("Mode","Cannot be blank");
		   }
	   }

	public void setData(Data data) {
		this.data=data;
	}
	
	public Data getData() {
		return this.data;
	}
	
	@Override
	public Input getModel() {
		return this.input;
	}
	
	public void setInput(Input input) {
		this.input=input;
	}
	
	public Input getInput() {
		return this.input;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
		
	}
}
