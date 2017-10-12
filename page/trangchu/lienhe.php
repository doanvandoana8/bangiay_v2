
<div id="contact-page" class="container">
	<div class="bg">
		<div class="row">    		
			<div class="col-sm-12">    			   			
				<h2 class="title text-center"><strong>SHOES SHOP</strong></h2>    			    				    				
				<div id="map"></div>
					
			
			</div>			 		
		</div>    	
		<div class="row">  	
			<div class="col-sm-8">
				<div class="contact-form">
					<h2 class="title text-center">Nội dung</h2>
					<div class="status alert alert-success" style="display: none"></div>
					<form id="main-contact-form" class="contact-form row" name="contact-form" method="post" action="">
						<div class="form-group col-md-6">
							<div class="dangki_thongtin"><label for="name" class="cols-sm-2 control-label">Họ & tên</label></div>
							<input type="text" name="txtHoTen" class="form-control" required placeholder="Họ tên của quý khách.">
						</div>
						<div class="form-group col-md-6">
							<div class="dangki_thongtin"><label for="name" class="cols-sm-2 control-label">Email</label></div>
							<input type="email" name="txtEmail" class="form-control" required placeholder="Email của quý khách.">
						</div>
						<div class="form-group col-md-12">
							<div class="dangki_thongtin"><label for="name" class="cols-sm-2 control-label">Chủ đề</label></div>
							<input type="text" name="txtChuDe" class="form-control" required placeholder="Chủ đề">
						</div>
						<div class="form-group col-md-12">
							<div class="dangki_thongtin"><label for="name" class="cols-sm-2 control-label">Nội dung</label></div>
							<textarea name="txtNoiDung" id="message" required class="form-control" rows="8" placeholder="Nội dung liên hệ."></textarea>
						</div>                        
						<div class="form-group col-md-12">
							<input style="width: 100%" type="submit" name="btn_gui" class="btn btn-primary pull-right" value="Gửi">
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="contact-info">
					<h2 class="title text-center">Thông tin liên hệ</h2>
					<address>
						<?php 
							$lienhe=thongtinLienHe();
							while ($row_lh=mysql_fetch_array($lienhe)) {
								echo $row_lh['noi_dung_thong_tin_lien_he'];
							}
						?>
					</address>
					<div class="social-networks">
						<h2 class="title text-center">Mạng xã hội</h2>
						<ul>
							<li>
								<a href="https://www.facebook.com/dvdoan.uit"><i class="fa fa-facebook"></i></a>
							</li>
						
							<li>
								<a href="https://www.youtube.com/channel/UCwSOrfvwS2UBEsL1zezpJSA"><i class="fa fa-youtube"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>    			
		</div>  
	</div>	
</div><!--/#contact-page-->

<?php
	if (isset($_POST['btn_gui']))
	{
		$hoten=$_POST['txtHoTen'];
		$email=$_POST['txtEmail'];
		$chude=$_POST['txtChuDe'];
		$noidung=$_POST['txtNoiDung'];
		if (themLienHe($hoten,$email,$chude,$noidung))
		{
			echo "<script> alert('Gửi thành công, chúng tôi sẽ sớm liên lạc với quý khách qua email mà quý khách đã cung cấp');</script>";
       		echo "<script> location.replace('index.php?p=lienhe'); </script>";
		}
		else{
			echo "<script> alert('Gửi thông tin thất bại. Quý khách vui lòng thử lại.');</script>";
       		echo "<script> location.replace('index.php?p=lienhe'); </script>";
		}
	}
?>

