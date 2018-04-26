package com.model;

import java.util.ArrayList;
import java.util.List;

public class Data {
	
	public int results;
	public List<RouteArr> route;
	public MinPrice min_price;
	
	public Data()
	{
		 route = new ArrayList<RouteArr>();
		 min_price=new MinPrice();
	}
	
	public Data(int n)
	{
		route = new ArrayList<RouteArr>(n);
		min_price=new MinPrice();
	}

}
