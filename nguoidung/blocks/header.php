
<div class="header">
		<div class="header_top"><!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +(84) 966 999 999</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i> 14520168@gm.uit.edu.vn</a></li>
							</ul>
						</div>
					</div>
				
					</div>
				</div>
			</div>
		</div><!--/header_top-->
		
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="/bangiay_v2"><img src="../images/home/logo.jpg" alt="" /></a>
						</div>
						
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav" >
								
								<?php
									$ok=1;
									if(isset($_SESSION['cart']))
									{
										foreach($_SESSION['cart'] as $k=>$v)
										{
											if(isset($k))
											{
											$ok=2;
											}
										}
									}

									if ($ok != 2)
									 {
										echo '<li><a href="/bangiay_v2/index.php?p=giohangds"><i class="fa fa-shopping-cart"></i> Giỏ hàng(0)</a></li>';
									} else {
										$items = $_SESSION['cart'];
										echo '<li><a href="/bangiay_v2/index.php?p=giohangds"><i class="fa fa-shopping-cart"></i> Giỏ hàng('.count($items).')</a></li>';
										
									}
								?>
								
								<?php 
									include $_SERVER["DOCUMENT_ROOT"] . "/bangiay_v2/function/trangchu.php";
							       if (isset($_SESSION['username']) ){
							          
							        echo "<li><a href='/bangiay_v2/nguoidung/index.php'><i class='glyphicon glyphicon-user'></i>$_SESSION[hoten] </a></li>";

							        $taikhoan=$_SESSION['username'];
							        $check=checkQuyenHan($taikhoan);
							        while ($row_checkQH=mysql_fetch_array($check)) {
							        	$QH=$row_checkQH['level'];
							        }

							        if ($QH>=1){
							        	echo"<li><a href='/bangiay_v2/admin/index.php'><i class='glyphicon glyphicon-user'></i> Quản trị viên</a></li>";
							        }

							        echo"<li><a href='../index.php?p=dangxuat'><i class='glyphicon glyphicon-log-out'></i> Thoát</a></li>";
							        
							       }
							       else{
							       		echo "<script> location.replace('../index.php?p=dangnhap'); </script>";
							        	
							       }
						       ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
	
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-xs-6 col-sm-12">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="/bangiay_v2" class="active">Trang chủ</a></li>
								<li><a href="/bangiay_v2/index.php?p=gioithieu" class="">Giới thiệu</a></li>
								<li class="dropdown"><a href="#">Sản phẩm<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                    <?php
                                    	$menu_trangchu = mnSanPhamTrangChuND();
                                    	while ($row = mysql_fetch_array($menu_trangchu)) 
                                    	{
                                    			
                                    ?>	
                                        <li><a href="/bangiay_v2/index.php?p=sanpphamtheoloai&idLoai=<?php echo $row['id_loai_san_pham']?>">
                                        <?php echo $row['ten_loai_san_pham'] ?></a></li>
										
									<?php
									}
									?>
                                    </ul>
                                </li> 

								<li><a href="../index.php?p=lienhe">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div><!--/header-bottom-->
</div>