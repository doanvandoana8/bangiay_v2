<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<div class="companyinfo">
							<h2><span>Shoes</span>-shop</h2>
							<?php
								$gioithieu = mnGioiThieu();
								while ($row = mysql_fetch_array($gioithieu)) {
									echo $row['logo_trang_chu'];
								}
							?>
						</div>
					</div>
					<div class="col-sm-6">
						
					</div>
					<div class="col-sm-3">
						<div class="">
							<img src="/bangiay_v2/images/home/map.png" alt="">
							<p style="padding-left: 10px;color: #333333;font-size: 16px;">KTX B ĐHQG Tp Hồ Chí Minh</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="single-widget">
							<h2>Giới thiệu</h2>
							<ul class="nav nav-pills nav-stacked">
								<?php
								$gioithieu = mnGioiThieu();
								while ($row = mysql_fetch_array($gioithieu)) {
									echo $row['trang_chu'];
								}
							?>
							
							</ul>
						</div>
					</div>
					
					
					<div class="col-sm-4">
						<div class="single-widget">
							<h2>Liên hệ</h2>
							
									<?php 
										$lienhe=thongtinLienHe();
										while ($row_lh=mysql_fetch_array($lienhe)) {
											echo $row_lh['noi_dung_thong_tin_lien_he'];
										}
									?>
							
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 SHOES-SHOP Inc. All rights reserved.</p>
					
				</div>
			</div>
		</div>