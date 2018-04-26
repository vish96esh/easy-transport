<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
		<title>Home</title>
		<meta charset="utf-8">
		<meta name = "format-detection" content = "telephone=no" />
		<link rel="icon" href="images/favicon.ico">
		<link rel="shortcut icon" href="images/favicon.ico" />
		<!-- <link rel="stylesheet" href="booking/css/booking.css"> -->
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&key=AIzaSyBTPkqS7-ACk_Aq4FzKciHmIjUs8n_kxFc&callback=initia‌​lize"></script>
		<link rel="stylesheet" href="css/camera.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/owl.carousel.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.2.1.js"></script>
		<script src="js/script.js"></script>
		<script src="js/superfish.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.mobilemenu.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/owl.carousel.js"></script>
		<script src="js/camera.js"></script>
		<!--[if (gt IE 9)|!(IE)]><!-->
		<script src="js/jquery.mobile.customized.min.js"></script>
		<!--<![endif]-->
		<script src="booking/js/booking.js"></script>
		<script>
			$(document).ready(function(){
				jQuery('#camera_wrap').camera({
					loader: false,
					pagination: false ,
					minHeight: '444',
					thumbnails: false,
					height: '28.28125%',
					caption: true,
					navigation: true,
					fx: 'mosaic'
				});
				$().UItoTop({ easingType: 'easeOutQuart' });
			});
		</script>
	</head>
	<body class="page1" id="top">
		<div class="main">
<!--==============================header=================================-->
			<header>
				<div class="menu_block ">
					<div class="container_12">
						<div class="grid_12">
							<nav class="horizontal-nav full-width horizontalNav-notprocessed">
								<ul class="sf-menu">
									<li class="current"><a href="index.html">Home</a></li>
									<li><a href="index-1.html">About</a></li>
									<li><a href="index-3.html">Services</a></li>
									<li><a href="index-4.html">Contacts</a></li>
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="container_12">
					<div class="grid_12">
						<h1>
							<a href="index.html">
								<img src="images/logo.png" alt="Easy Transport">
							</a>
						</h1>
					</div>
				</div>
				<div class="clear"></div>
			</header>
			<div class="slider_wrapper ">
				<div id="camera_wrap" class="">
					<div data-src="images/slide.jpg" ></div>
					<div data-src="images/slide1.jpg" ></div>
					<div data-src="images/slide2.jpg"></div>
				</div>
			</div>
			<div class="content">
				<h3>Find Routes</h3>
				<form class="form-horizontal" action="/EasyTransport/submit" method="post">
  				<fieldset>
    				
    				<div class="form-group">
      					<label for="From" class="col-lg-2 control-label">From</label>
      					<div class="col-lg-10">
        					<input class="form-control" id="From" placeholder="From" type="text" name="from">
      					</div>
      					<div id="infowindow-content">
      						<img src="" width="16" height="16" id="place-icon">
      						<span id="place-name"  class="title"></span><br>
      						<span id="place-address"></span>
    					</div>
      					
    				</div>
    
    				<div class="form-group">
			      		<label for="To" class="col-lg-2 control-label">To</label>
			      		<div class="col-lg-10">
        					<input class="form-control" id="To" placeholder="To" type="text" name="to">
      					</div>
      					
    				</div>
    
    				<div class="form-group">
      					<label class="col-lg-2 control-label">Transport Type:</label>
      					<div class="col-lg-10">
        					<div class="radio">
          						<label>
            						<input name="mode" id="Bus" value="Bus" checked type="radio">
            						Bus
						        </label>
        					</div>
        					<div class="radio">
          						<label>
            						<input name="mode" id="Metro" value="Metro" type="radio">
									Metro
          						</label>
        					</div>
        					<div class="radio">
          						<label>
            						<input name="mode" id="Auto" value="Auto" type="radio">
									Auto
          						</label>
        					</div>
        					
        					<div class="radio">
          						<label>
            						<input name="mode" id="Mixed" value="Mixed" type="radio">
									Mixed
          						</label>
        					</div>
      					</div>
    				</div>
    
   					<div class="form-group">
      					<div class="col-lg-10 col-lg-offset-2">
        					<button type="reset" class="btn btn-default">Cancel</button>
        					<button type="submit" class="btn btn-primary">Submit</button>
      					</div>
    				</div>
  				</fieldset>
			</form>

				<div class="container_12">
				<div class="grid_4">
					<div class="banner">
						<div class="maxheight">
							<div class="banner_title">
								<img src="images/icon1.png" alt="">
								<div class="extra_wrapper">Fast&amp;
									<div class="color1">Safe</div>
								</div>
							</div>
							Dorem ipsum dolor sit amet, consectetur adipiscinger elit. In mollis erat mattis neque facilisis, sit ameter ultricies erat rutrum. Cras facilisis, nulla vel viver auctor, leo magna sodales felis, quis malesuad
							<a href="#" class="fa fa-share-square"></a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<div class="maxheight">
							<div class="banner_title">
								<img src="images/icon2.png" alt="">
								<div class="extra_wrapper">Best
									<div class="color1">Prices</div>
								</div>
							</div>
							Hem ipsum dolor sit amet, consectetur adipiscinger elit. In mollis erat mattis neque facilisis, sit ameter ultricies erat rutrum. Cras facilisis, nulla vel viver auctor, leo magna sodales felis, quis malesuader
							<a href="#" class="fa fa-share-square"></a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<div class="maxheight">
							<div class="banner_title">
								<img src="images/icon3.png" alt="">
								<div class="extra_wrapper">Package
									<div class="color1">Delivery</div>
								</div>
							</div>
							Kurem ipsum dolor sit amet, consectetur adipiscinger elit. In mollis erat mattis neque facilisis, sit ameter ultricies erat rutrum. Cras facilisis, nulla vel viver auctor, leo magna sodales felis, quis malesuki
							<a href="#" class="fa fa-share-square"></a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="c_phone">
				<div class="container_12">
					<div class="grid_12">
						<div class="fa fa-phone"></div>+ 1800 559 6580
						<span>ORDER NOW!</span>
					</div>
					<div class="clear"></div>
				</div>
			</div>
<!--==============================Content=================================-->
			
		</div>
		</div>
<!--==============================footer=================================-->
		<footer>
			<div class="container_12">
				<div class="grid_12">
					<div class="f_phone"><span>Call Us:</span> + 1800 559 6580</div>
					<div class="socials">
						<a href="#" class="fa fa-twitter"></a>
						<a href="#" class="fa fa-facebook"></a>
						<a href="#" class="fa fa-google-plus"></a>
					</div>
					<div class="copy">
						<div class="st1">
						<div class="brand">Tour<span class="color1">T</span>axi </div>
						&copy; 2014	| <a href="#">Privacy Policy</a> </div> Website designed by <a href="http://www.templatemonster.com/" rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</footer>
		<script>
		function initialize() {


			var defaultBounds = new google.maps.LatLngBounds(
				new google.maps.LatLng(28.613948, 77.209031)
				);

			var origin_input = document.getElementById('from').value;
			var destination_input = document.getElementById('to').value;


			var options = {
				bounds: defaultBounds,
				componentRestrictions: {country: 'india'}
			};


			var autocomplete_origin = new google.maps.places.Autocomplete(origin_input, options);    
			var autocomplete_destination = new google.maps.places.Autocomplete(destination_input, options);
			}

			google.maps.event.addDo mListener(window, 'load', initialize);

			
			
		</script>
	</body>
    
</body>
</html>