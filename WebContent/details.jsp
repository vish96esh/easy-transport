<%@ taglib  prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<div id="map_canvas" style="width:100%; height:100%"></div>  
<head>
	<s:set name="fromUser" value="input.from"/>
	<s:set name="toUser" value="input.to"/>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Routes</title>

    <!-- Bootstrap Core CSS -->
    <link href="css1/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css1/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="css1/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="css1/responsive.dataTables.scss" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css1/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css1/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
     <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyBuJbLGReZLB1UMNUxAuXE3WUPMUVd9Sps&AMP&sensor=false"></script>  
<script type="text/javascript">  
var infowindow = null;  
    $(document).ready(function () { initialize();  });  
  
    function initialize() {  
  
         var map;
      var mapOptions = { center: new google.maps.LatLng(28.7041,77.1025), zoom: 11,
        mapTypeId: google.maps.MapTypeId.ROADMAP };

      
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
     
var userCoor =  [['anand vihar', 28.6502, 77.3027, 4],
      ['karol bagh', 28.6528, 77.1921, 5]
          ];

var userCoorPath =  [
          {lat: 28.6502, lng: 77.3027},
          {lat: 28.6528, lng: 77.1921}
          
        ];

var userCoordinate = new google.maps.Polyline({
path: userCoorPath,
strokeColor: "#FF0000",
strokeOpacity: 1,
strokeWeight: 2
});
userCoordinate.setMap(map);

var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < userCoor.length; i++) {  
  marker = new google.maps.Marker({
    position: new google.maps.LatLng(userCoor[i][1], userCoor[i][2]),
    //title:"bus"
	map: map
	
  });


  google.maps.event.addListener(marker, 'click', (function(marker, i) {
    return function() {
      infowindow.setContent(userCoor[i][0]);
      infowindow.open(map, marker);
    };
  })(marker, i));


}


     }
</script>  

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					DataTables Advanced Tables
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="dataTable_wrapper">
						<table class="table table-striped table-bordered table-hover" id="dataTables-example">
						   
							
								
							<thead>
								<tr>
									<th>FROM</th>
									<th>TO</th>
									<th>TIME</th>
									<th>FARE</th>
									<th>STOPS</th>
                                                                        <th>MODE</th>
                                                                        <th>BUS NO</th>
								</tr>
							</thead>
							<tbody>;
							 <s:iterator value="route.p">
       
							<tr class='odd gradeX'>
							
							<td> <s:set name="fromVal" value="from"/>

											<s:if test="%{#fromVal==''}">
											
                                				<s:property value="#fromUser"/>
                                			</s:if>
                                			<s:else> 
                                				<s:property value="from" />
                                			</s:else>
                            </td>
							<td> <s:set name="toVal" value="to"/>

											<s:if test="%{#toVal==''}">
											
                                				<s:property value="#toUser"/>
                                			</s:if>
                                			<s:else> 
                                				<s:property value="to" />
                                			</s:else></td>
							
							<td> <s:property value="time" ></s:property></td>
                                                         
                                                          <td> <s:property value="no_of_stops" ></s:property></td>  
                                                        <td> <s:property value="type" ></s:property></td>
                                                        <td> <s:property value="bus"/></td>
                                                         </s:iterator>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
					<div>
						<p>Total Stops:<s:property value="route.total_no_of_stops"/></p>
						<p>Total Time:<s:property value="route.total_time"/></p>
						<p>Total Distance(Excluding Metro distance):<s:property value="route.total_dist"/></p>
						<p>Total Cost:<s:property value="route.price"/></p>
						
					</div>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
    <!-- jQuery -->
    <script src="js1/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
     <script src="js1/bootstrap.min.js"></script>


    <!-- Metis Menu Plugin JavaScript -->
   <script src="js1/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
     <script src="js1/jquery.dataTables.min.js"></script>
    <script src="js1/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js1/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
