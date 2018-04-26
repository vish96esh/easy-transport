package com.model;

import java.util.List;
import java.util.ArrayList;

public class RouteArr {
    public List<Path> p;
    public int total_no_of_stops;
    public double total_time;
    public double total_dist;
    public int price;
    public int route_no;
    public RouteArr(int n)
    {
        p=new ArrayList<Path>(n);
        route_no=0;
    }
    
    public RouteArr()
    {
		p=new ArrayList<Path>();
    }
    
    public List<Path> getP()
    {
    	return this.p;
    }
    
    public void setP(List<Path> p)
    {
    	this.p=p;
    }
    
    public int getTotal_no_of_stops()
    {
    	return this.total_no_of_stops;
    }
    
    public void setTotal_no_of_stops(int total_no_of_stops)
    {
    	this.total_no_of_stops=total_no_of_stops;
    }
    
    public double getTotal_time()
    {
    	return this.total_time;
    }
    
    public void setTotal_time(double total_time)
    {
    	this.total_time=total_time;
    }
    
    public double getTotal_dist()
    {
    	return this.total_dist;
    }
    
    public void setTotal_dist(double total_dist)
    {
    	this.total_dist=total_dist;
    }
    
    public int getPrice()
    {
    	return this.price;
    }
    
    public void setPrice(int price)
    {
    	this.price=price;
    }
    
    public int getRoute_no()
    {
    	return this.route_no;
    }
    
    public void setRoute_no(int route_no)
    {
    	this.route_no=route_no;
    }
}
