<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.opensymphony.xwork2.util.ValueStack" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EasyTransport</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>-->
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <!--[endif]-->

</head>

<body>
	<s:set name="fromUser" value="input.from"/>
	<s:set name="toUser" value="input.to"/>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">EasyTransport</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Sort By</p>
                <div class="list-group">
                    <%//session.setAttribute("array",r);%>
                    <a href="Sort?s=p" class="list-group-item">Price</a>
                    <a href="Sort?s=t" class="list-group-item">Time </a>
                    <a href="Sort?s=c" class="list-group-item">Comfort</a>
                </div>
            </div>

            <div class="col-md-9">

				<s:iterator value="data.route">
					<div class="row">

                    	<div class="col-sm-12 col-lg-12 col-md-12">
                        	<div class="thumbnail">
                           
                           
	                           	<div class="caption" style="height: 200px">   
	                           		<s:iterator value="p">
	                           			<div class="col-sm-3 col-lg-4 col-md-4">
	                                		<h4>
	                                		<s:set name="fromVal" value="from"/>

											<s:if test="%{#fromVal==''}">
											
                                				<s:property value="#fromUser"/>
                                			</s:if>
                                			<s:else> 
                                				<s:property value="from" />
                                			</s:else>
	                                		 -->
	                                		 </h4>
	                               		</div>
	                               		<div class="col-sm-3 col-lg-4 col-md-4">
	                                		<h4>
											<s:set name="toVal" value="to"/>

											<s:if test="%{#toVal==''}">
											
                                				<s:property value="#toUser"/>
                                			</s:if>
                                			<s:else> 
                                				<s:property value="to" />
                                			</s:else>
											
											</h4>
	                               		</div>
	                               		
	                               		<div class="col-sm-3 col-lg-4 col-md-4">
	                                		<h4>
											<s:set name="priceVal" value="price"/>
											<s:set name="busVal" value="bus"/>

											<s:if test="%{#busVal==''}">
											
												<s:if test="%{#priceVal==''}">
													<s:property value="type"/>
													</s:if>
                                				<s:property value="#priceVal"/>
                                			</s:if>
                                			<s:else> 
                                				<s:property value="bus" />
                                			</s:else>
											</h4>
	                               		</div>
	                               		<br>
	                           		</s:iterator>      
	                           		<div class="ratings">
	                    <s:set name="p" value="p" var="p"/>
	                    <jsp:useBean id="p" type="java.util.List<com.model.Path>" />
	                    <s:set name="total_no_of_stops" value="total_no_of_stops" var="total_no_of_stops"/>
	                    <jsp:useBean id="total_no_of_stops" type="java.lang.Integer" />
	                    <s:set name="total_time" value="total_time" var="total_time"/>
	                    <jsp:useBean id="total_time" type="java.lang.Double" />
	                    <s:set name="total_dist" value="total_dist" var="total_dist"/>
	                    <jsp:useBean id="total_dist" type="java.lang.Double" />
	                    <s:set name="price" value="price" var="price"/>
	                    <jsp:useBean id="price" type="java.lang.Integer" />
	                    <s:set name="route_no" value="route_no" var="route_no"/>
	                    <jsp:useBean id="route_no" type="java.lang.Integer" />
	                    <%
	                    
	                    session.putValue("p", p);
	                    session.putValue("total_no_of_stops",  total_no_of_stops);
	                    session.putValue("total_time",  total_time);
	                    session.putValue("total_dist", total_dist);
	                    session.putValue("price",  price);
	                    session.putValue("route_no", route_no);
	                    %>
                    	<s:url action="Result" var="urlTag" >
                    	
    						<!--<s:param name="p"><s:property value="p"/></s:param>
    						<s:param name="total_no_of_stops"><s:property value="total_no_of_stops"/></s:param>
    						<s:param name="total_time"><s:property value="total_time"/></s:param>
    						<s:param name="total_dist"><s:property value="total_dist"/></s:param>
    						<s:param name="price"><s:property value="price"/></s:param>
    						<s:param name="route_no"><s:property value="route_no"/></s:param>-->
    						
						</s:url>
                        <p class="pull-right"><a href="<s:property value='#urlTag' />">More info</a></p>
                    </div>       
	                           	</div>
	                           	
                           	</div>
                        </div>
                        
                    </div>
                    
					
				</s:iterator>
	           		               
             </div>
                            
           </div>
         </div>

              
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
