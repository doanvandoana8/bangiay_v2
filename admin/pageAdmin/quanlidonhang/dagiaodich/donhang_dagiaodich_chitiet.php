 <?php
 include $_SERVER["DOCUMENT_ROOT"] . "/bangiay_v2/admin/function/quanlidonhang/donhangdagiaodich.php";
?>
<div class=row>

	<div class="col-lg-12" style="text-transform: uppercase; width: 100%;color: #ffffff;font-size: 32px;background-color: #fe980f;text-align: center;">
		CHI TIẾT ĐƠN HÀNG</h2>
	
	</div>
	<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-5" style="margin-left: 32px;">
					<div class="shopper-info" id="chitiet_donhang_nguoimua">
						<div style="text-align: center;">Thông tin của quý khách</div>
						<?php
						$iddh=$_GET['iddh'];
						$tt_nguoimua=ttDonHangDGD($iddh);
						while ($row_tt_nguoimua=mysql_fetch_array($tt_nguoimua)) {
						?>
						<div class="thongtinkhachhang">
						
							<input readonly type="text" placeholder="Họ và tên của quý khách." value="<?php echo $row_tt_nguoimua['ten_khach_hang']?>" id="tt_mua_nhan"><br>
							
							<input readonly type="text" placeholder="Email của quý khách." value="<?php echo $row_tt_nguoimua['email_khach_hang']?>" id="tt_mua_nhan"><br>
							
							<input readonly type="text" value="<?php echo $row_tt_nguoimua['so_dien_thoai_khach_hang']?>" placeholder="Số điện thoại của quý khách." id="tt_mua_nhan"><br>
										
							<textarea readonly name="txtdiachi" id="txtdiachi" class="form-control" rows="5" placeholder="Địa chỉ của quý khách." id="tt_mua_nhan" ><?php echo $row_tt_nguoimua['dia_chi_khach_hang']?></textarea>
						</div>
						<?php
						}
						?>
					</div>
				</div>
				<div class="col-sm-5" style="margin-left: 44px;">
					<div class="shopper-info" id="chitiet_donhang_nguoinhan">
						<div style="text-align: center;">Địa chỉ giao & nhận hàng</div>
						
						<?php
						$iddh=$_GET['iddh'];
						$tt_nguoinhan=ttDonHangDGD($iddh);
						while ($row_tt_nguoinhan=mysql_fetch_array($tt_nguoinhan)) {
						?>
						<div class="thongtinkhachhang">
					
							<input readonly type="text" placeholder="Họ và tên người nhận hàng." id="tt_mua_nhan" value="<?php echo $row_tt_nguoinhan['ten_nguoi_nhan']?>"><br>
						
							<input readonly type="text" placeholder="Email người nhận hàng." id="tt_mua_nhan" value="<?php echo $row_tt_nguoinhan['email_nguoi_nhan']?>"><br>
						
							<input readonly type="text" placeholder="Số điện thoại người nhận hàng." id="tt_mua_nhan" value="<?php echo $row_tt_nguoinhan['so_dien_thoai_nguoi_nhan']?>"><br>
										
							<textarea readonly name="txtdiachi" id="txtdiachi" class="form-control" rows="5" placeholder="Địa chỉ nhận hàng." id="tt_mua_nhan" ><?php echo $row_tt_nguoinhan['dia_chi_nguoi_nhan']?></textarea>
						<?php
						}
						?>
						
					</div>
				</div>
				
			</div>
		</div>
		<div>
			<h2 style="font-size: 20px;text-transform: uppercase;color: #fe980f;">
			Thông tin đơn hàng</h2>
		</div>

			<div class="table-responsive cart_info">
					<table class="table table-condensed">
						<thead>
							<tr class="cart_menu" style="font-size: 16px;color: white;background-color:#fe980f;" >
								<td class="description" id="mn_anhsp" >Ảnh sản phẩm</td>
								<td class="description" id="mn_tensp">Tên sản phẩm</td>
								<td class="price" id="mn_dongia">Đơn giá</td>
								<td class="quantity" id="mn_sl">Số lượng</td>
								<td class="total" id="mn_thanhtien">Thành tiền</td>
								
								<td></td>
							</tr>
						</thead>
						<tbody> 
							<?php
								$dh_sanpham = chitietDHNDDGD($iddh);
								while ($row_dh_sanpham=mysql_fetch_array($dh_sanpham)) {
							?>
							
							<tr>
								<td class="cart_product" id="dh_anh">
									<a href="" ><img class="dh_chitiet_anh" src="/bangiay_v2/images/sanpham/<?php echo $row_dh_sanpham['anh_san_pham']?>" alt=""></a>
								</td>
								<td class="cart_description" id="dh_mota">
									<h4><a href="../index.php?p=chitietsanpham&idSanPham=<?php echo $row_dh_sanpham['id_san_pham']?>"><?php echo $row_dh_sanpham['ten_san_pham']?></a></h4>
									
								</td>

							

								<td class="cart_price" id="dh_gia">

									<?php 
										$km=$row_dh_sanpham['san_pham_khuyen_mai'];
										if($km==1){
											echo "<p>";
											echo number_format($row_dh_sanpham['gia_khuyen_mai']);
											echo " đ</p>";
										}
										else{
											echo "<p>";
											echo number_format($row_dh_sanpham['gia_ban_dau']);
											echo " đ</p>";
										}
									?>
								
								</td>

									<td class="cart_quantity">
									<div style="padding-left: 20px;text-align: center;" class="cart_quantity_button" id="mn_soluong">
										
										<?php
			
											
											echo $row_dh_sanpham['ctdh_so_luong'];;
										?>

									</div>
								</td>
								
								<td class="cart_total" id="dh_thanhtien">
									<p class="cart_total_price"><?php echo number_format($row_dh_sanpham['thanh_tien'])?> đ</p>
								</td>

								
								
							</tr>
							<?php
							}
							?>
						
							<tr>
								<td colspan="3">&nbsp;</td>
								<td colspan="3">
									<table class="table table-condensed total-result">
									<?php 
										$tien_don_hang = DHDGD($iddh);
										while ($row_tien_don_hang=mysql_fetch_array($tien_don_hang)) {	
									?>
										<tr>
											<td>Tạm tính</td>
											<td><?php echo number_format($row_tien_don_hang['tong_tien']-$row_tien_don_hang['thue_GTGT'])?> đ</td>
										</tr>
										<tr>
											<td>Thuế GTGT(10%)</td>
											<td><?php echo number_format($row_tien_don_hang['thue_GTGT'])?> đ</td>
										</tr>
										
										<tr>
											<td>Thành tiền</td>
											<td><span><?php echo number_format($row_tien_don_hang['tong_tien'])?> đ</span></td>
										</tr>
									<?php
									}
									?>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
</div>


