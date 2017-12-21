<script>
	var count=1;
	$(document).ready(function(){

		 $.get("page/trangchu/trangchu_spmoi.php",{page : count},function(data){
				$("#trangchu_spmoi").html(data);
				count++;
			});
		$("#trangsau").click(function(){
			
	        $.get("page/trangchu/trangchu_spmoi.php",{page : count},function(data){
				$("#trangchu_spmoi").append(data);
			});   
			count++;

		});
		
	});
</script>

<div class="row">
	<div class="col-xs-12 col-sm-3">
		<?php require "blocks/leftsidebar.php"?>
	</div>
	
	<div class="col-xs-12 col-sm-9">
		<div class="features_items"><!--features_items-->
			<h2 class="title text-center">Sản phẩm mới</h2>
			
				<div id="trangchu_spmoi"></div>
		
		</div><!--features_items-->
		
		<div class="">
			<div id="trangsau">
					Xem thêm
			</div>
		
		</div>	
	</div>
</div>

<div>
	<div class="features_items"><!--features_items-->
		<div id="muanhieu"> Sản phẩm mua nhiều</div>
		<!-- Swiper -->
		<div class="swiper-container row">
			<div class="swiper-wrapper col-xs-12 col-sm-6 col-md-3">
			
			<?php
				$ds_sp_muanhieu = dsSanPhamMuaNhieu();
				while ($row = mysql_fetch_array($ds_sp_muanhieu)) 
				{
				
			?>
				<div class="swiper-slide" style="height: 248px;">
				
						<div class="product-image-wrapper" style="margin-bottom: 3px;">
							<div class="single-products">
								<div class="productinfo text-center" style="height: 250px;width: 100%;">
									<img src="images/sanpham/<?php echo $row['anh_san_pham'];?>" class="img_product" alt="" />
									<h4><?php echo $row['ten_san_pham'];?></h4>
									<?php 
										if ($row['san_pham_khuyen_mai']==1)
										{
											
											echo "<h5><div style='float: left;text-decoration: line-through;'>Giá gốc";
											echo number_format($row['gia_ban_dau']);
										
											echo "đ</div><div style='float:right'>Giá KM";
											echo number_format($row['gia_khuyen_mai']);
											echo "đ</div></h5>";
										}
										else
										{
											echo "<h5><div style='float: left;'>Giá gốc";
											echo number_format($row['gia_ban_dau']);

											echo "đ</div><div style='text-decoration: line-through;float:right;'>Giá KM";
											echo number_format($row['gia_khuyen_mai']);
											echo "đ</div></h5>";
										}
									?>
									
								</div>
								<div class="product-overlay">
									<div class="overlay-content">
										<div style="font-size: 30px;text-transform: uppercase;color: white;">Size</div>
										<div style="font-size: 83px;color: white;"><?php
											echo $row['size'];
										?></div>
										
										<?php 
											if ($row['san_pham_khuyen_mai']==1)
											{
												echo "<h5 style='height: 20px;'><div style='float: left;text-decoration: line-through;'>Giá gốc ";
												echo number_format($row['gia_ban_dau']);
											
												echo "đ</div><div style='float:right'>Giá KM ";
												echo number_format($row['gia_khuyen_mai']);
												echo "đ</div></h5>";
											}
											else
											{
												echo "<h5 style='height: 20px;'><div style='float: left;'>Giá gốc ";
												echo number_format($row['gia_ban_dau']);

												echo "đ</div><div style='text-decoration: line-through;float:right;'>Giá KM ";
												echo number_format($row['gia_khuyen_mai']);
												echo "đ</div></h5>";
											}
										?>
										

										<form action="" style="height: 45px;">
											<input type="hidden" name="p" value="chitietsanpham">
											<input type="hidden" name="idSanPham" value="<?php echo $row['id_san_pham']?>">
											<a class="btn btn-default add-to-cart"><i class="fa fa-external-link fa-2"></i><button type="submit" class="btn btn-default" style="border: 0px solid;background-color: white;color: #fe980f;text-transform: uppercase;">Chi tiết sản phẩm</button></a>
										</form>
									</div>
								</div>

								<?php 
								if ($row['san_pham_khuyen_mai'] ==1)
								{
									echo	"<img src='images/home/sale.png' class='new' alt='' />";
								}	
								?>
							</div>
							
						</div>
				
				</div>

			<?php	
			}
			?>
		
			</div>

			
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>
	</div>

	<script src="js/swiper.min.js"></script>

</div>