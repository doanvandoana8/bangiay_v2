<?php
session_start();
require"../function/dbCon.php";

//Su dung duong dan tuong doi tranh tinh trang sai path
include $_SERVER["DOCUMENT_ROOT"] . "/bangiay_v2/nguoidung/function/nguoidung.php";
if (isset($_GET["p"]))
	$p=$_GET["p"];
else
	$p="";
?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Home | Shoes-Shop</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/prettyPhoto.css" rel="stylesheet">
	<link href="css/price-range.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">

	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/thongtinnguoidung.css">
	<link rel="stylesheet" href="css/inputImage.css">




	
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  
    <![endif]-->  
     <script src="js/jquery-3.2.1.min.js"></script> 
    <script src="js/bootstrap.min.js"></script> 
    <script src="js/html5shiv.js"></script>


    <script src="js/hosonguoidung.js"></script>   
    <script src="js/inputImage.js"></script> 
 


    
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<?php require "blocks/header.php"; ?>

	</header><!--/header-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<?php 
					require "blocks/leftnguoidung.php"
					?>

				</div>

				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8" style="padding-right: 5px;margin-bottom: 20px;margin-top: 10px;">
								
						<?php 

						switch($p){	

							case "hosocanhan"    : require "pagend/hosocanhan.php";break;
							case "hosocanhansua"    : require "pagend/hosocanhansua.php";break;
							case "quanlibinhluan"    : require "pagend/quanlibinhluan.php";break;
							case "quanlibinhluansua"    : require "pagend/quanlibinhluan_sua.php";break;
							case "danhsachdonhang"    : require "pagend/danhsachdonhang.php";break;
							case "chitietdonhang"    : require "pagend/chitietdonhang.php";break;
							case "huybodonhang"    : require "pagend/huybodonhang.php";break;
							case "timkiem"    : require "pagend/timkiem.php";break;
							default : require "pagend/hosocanhan.php";
						}
						
						?>					
					
				</div>	
			</div>

		</div>
		
	</section>
	
	<footer id="footer"><!--Footer-->
		<?php require "blocks/footer.php"; ?>
	</footer><!--/Footer-->
	

	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
	

</body>
</html>