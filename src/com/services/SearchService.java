package com.services;

import com.model.RouteArr;
import com.model.Path;
import com.model.Data;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.model.Input;

public class SearchService {
	
	public Data getService(Input input) throws Exception {
		String l2[]=Latlong.getLatLongPositions(input.getTo());
		String l1[]=Latlong.getLatLongPositions(input.getFrom());
		String str=getpos(l1,l2,input.getMode());
		System.out.println(str);
		Data data=parse(str,l1,l2);
		return data;
	}
	
	public static String getpos(String l1[],String l2[],String t) throws Exception
    {
    	//System.out.println("test");
    	URL url;
    	HttpURLConnection conn = null;
    	int rs=0;
    	if(t.equals("Bus"))
    	{
    		url = new URL("http://localhost:8080/Minor_1/api/v1/bus?slat="+l1[0]+"&slong="+l1[1]+"&dlat="+l2[0]+"&dlong="+l2[1]);
    		System.out.println("url "+url);
    		conn = (HttpURLConnection) url.openConnection();
    		conn.setRequestMethod("GET");
    		conn.connect();
    		rs=conn.getResponseCode();
    	}
    	else if(t.equals("Metro"))
    	{
          	url = new URL("http://localhost:8080/Minor_1/api/v1/metro?slat="+l1[0]+"&slong="+l1[1]+"&dlat="+l2[0]+"&dlong="+l2[1]);
          	System.out.println("url "+url);
          	conn = (HttpURLConnection) url.openConnection();
          	conn.setRequestMethod("GET");
          	conn.connect();
          	rs=conn.getResponseCode();
    	}
    	else if(t.equals("Auto"))
    	{
          	url = new URL("http://localhost:8080/Minor_1/api/v1/auto?slat="+l1[0]+"&slong="+l1[1]+"&dlat="+l2[0]+"&dlong="+l2[1]);
          	System.out.println("url "+url);
          	conn = (HttpURLConnection) url.openConnection();
          	conn.setRequestMethod("GET");
          	conn.connect();
          	rs=conn.getResponseCode();
    	}
    	else if(t.equals("Mixed"))
    	{
          	url = new URL("http://localhost:8080/Minor_1/api/v1/mixed?slat="+l1[0]+"&slong="+l1[1]+"&dlat="+l2[0]+"&dlong="+l2[1]);
          	System.out.println("url "+url);
          	conn = (HttpURLConnection) url.openConnection();
          	conn.setRequestMethod("GET");
          	conn.connect();
          	rs=conn.getResponseCode();
    	}
     
    	String line;
    	String outputString="";
    	if(rs == 200)
    	{     
    		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    		while ((line = reader.readLine()) != null) {
    			outputString += line+"\n";
    		}
    	}
    	else
    		System.out.println("rs"+rs);
    	return outputString;
    }

    public static Data parse(String str,String l1[],String l2[]) throws JSONException, Exception
    {
	    JSONObject jsonObj = new JSONObject(str);
	    JSONArray arr=jsonObj.getJSONArray("routes");
	    JSONArray path;
	    JSONObject obj1;
	    Data data=new Data(arr.length());
	    RouteArr r1;
	    Path p;
	    int i,j;
	    data.results=jsonObj.getInt("results");
	    data.min_price.price=jsonObj.getJSONObject("min_price").getInt("price");
	    data.min_price.route_no=jsonObj.getJSONObject("min_price").getInt("route_no");
	    for(i=0;i<arr.length();i++)
	    {
	    	obj1=arr.getJSONObject(i);
	    	path=obj1.getJSONArray("path");
	    	r1=new RouteArr(path.length());
	    	r1.price=obj1.getInt("price");
	    	r1.route_no=obj1.getInt("route_no");
	    	r1.total_dist=obj1.getDouble("total_dist");
	    	r1.total_time=obj1.getDouble("total_time");
	    	r1.total_no_of_stops=obj1.getInt("total_no_of_stops");
	    	for(j=0;j<path.length();j++)
	    	{
	    		p=new Path();
	    		p.from=path.getJSONObject(j).getString("from");
	    		p.from_lat=path.getJSONObject(j).getDouble("from_lat");
	    		p.from_long=path.getJSONObject(j).getDouble("from_long");
	    		p.from_distance=path.getJSONObject(j).getDouble("from_distance");
	    		p.to=path.getJSONObject(j).getString("to");
	    		p.to_lat=path.getJSONObject(j).getDouble("to_lat");
	    		p.to_long=path.getJSONObject(j).getDouble("to_long");
	    		p.to_distance=path.getJSONObject(j).getDouble("to_distance");
	    		p.distance=path.getJSONObject(j).getDouble("distance");
	    		p.time=path.getJSONObject(j).getDouble("time");
	    		p.path_no=path.getJSONObject(j).getInt("path_no");
	    		p.no_of_stops=path.getJSONObject(j).getInt("no_of_stops");
	    		p.type=path.getJSONObject(j).getString("type");
	    		p.bus=path.getJSONObject(j).getString("bus");
	    		r1.p.add(p);
	    	}
	    	data.route.add(r1);
	    }
	    return data;
	}
    
    public static int getval(double lat1,double lon1,double lat2,double lon2,int ty) throws Exception
	{
		int rs=0;
		String l1=lat1+","+lon1;
		String add=lat2+","+lon2;
        URL url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?origins="+ URLEncoder.encode(l1+"", "UTF-8")+"&destinations="+URLEncoder.encode(add+"", "UTF-8")+"&mode=transit&key=AIzaSyBuJbLGReZLB1UMNUxAuXE3WUPMUVd9Sps");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();
        rs=conn.getResponseCode();
        String line, outputString = "";
        if(rs == 200)
        {
        	
        	BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        	while ((line = reader.readLine()) != null) {
        		outputString += line+"\n";
        	}
        }
        else
        	System.out.println("rs"+rs);
        //System.out.println(outputString);
        int k=parse2(outputString,ty);
        return k;
	}
    
    public static int parse2(String str,int ty) throws JSONException
	{
	    JSONObject jsonObj = new JSONObject(str);
	    JSONArray arr=jsonObj.getJSONArray("rows").getJSONObject(0).getJSONArray("elements");
	    int cnt=0;
	    if(!arr.getJSONObject(0).getString("status").equals("OK"))
        {
            cnt=-1;
            return cnt;
        }
	    if(ty==1)
	    {
	    	cnt=arr.getJSONObject(0).getJSONObject("duration").getInt("value");
	    }
	    else if(ty==2){
	    	cnt=arr.getJSONObject(0).getJSONObject("distance").getInt("value")/1000;
	    }
	    return cnt;
	}
	
}
