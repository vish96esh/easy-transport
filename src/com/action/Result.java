package com.action;

import com.model.Path;
import com.model.RouteArr;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import java.util.Map;
import java.util.List;


public class Result extends ActionSupport {
	
	public Map<String,Object> session;
	
	private static final long serialVersionUID = 1L;
	private  RouteArr route=new RouteArr();
	
	public RouteArr getRoute()
	{
		return this.route;
	}
	
	public void setRoute(RouteArr route)
	{
		this.route=route;
	}
	
	public String execute() throws Exception
	{
		RouteArr r=new RouteArr();
		HttpSession session=ServletActionContext.getRequest().getSession(false);
		r.p=(List<Path>)session.getAttribute("p");
		r.price=(Integer)session.getAttribute("price");
		r.total_no_of_stops=(Integer)session.getAttribute("total_no_of_stops");
		r.route_no=(Integer)session.getAttribute("route_no");
		r.total_dist=(Double)session.getAttribute("total_dist");
		r.total_time=(Double)session.getAttribute("total_time");
		setRoute(r);
		return "success";
	}
		

}
