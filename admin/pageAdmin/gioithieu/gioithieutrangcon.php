<?php
 include $_SERVER["DOCUMENT_ROOT"] . "/bangiay_v2/admin/function/gioithieu/gioithieu.php";
?>
<div class="row">
	<div class="col-lg-12" style="margin-top: 60px;">
	<form  action="" method="post">
		<div class="shopper-info" id="themsp_lable" style="margin-top: -58px;padding-top: 0px;margin-left: 10px;">

	
				<label id="nomal_lable" style="text-transform: uppercase;width: 100%;color: #ffffff;font-size: 32px;background-color: #fe980f;text-align: center;">Shoes shop : Trang con</label>
				<?php
				$noidung=layNoiDungGioiThieuTrangCon();
				while ($row_noidung = mysql_fetch_array($noidung)) {
				?>
				<textarea name="trangcon" id="trangcon"><?php echo $row_noidung['trang_con']?></textarea>
				<?php
				}
				?>
				<script>CKEDITOR.replace('trangcon');</script>

			
		</div>
		<div>

			<button type="submit" name="btn_huy" class="btn btn-info" style=" width: 49%;margin-left: 10px; border-radius: 0px;">HỦY</button>
			<button type="submit" name="btn_hoantat" class="btn btn-warning pull-right"  style="width: 49%; border-radius: 0px;">HOÀN TẤT</button>
		</form>

	</div>
</div>


<?php

if (isset($_POST['btn_huy']))
{
	 echo "<script> location.replace('index.php'); </script>";
}
if (isset($_POST['btn_hoantat']))
{
	if ($_POST['trangcon']==""){
		echo "<script> alert('Dữ liệu trống, vui lòng kiểm tra lại.');</script>";
	}
	else{
		$noidung=$_POST['trangcon'];
		

		if (cnGioiThieuTrangCon($noidung))
		{
			echo "<script> alert('Cập nhật thành công');</script>";
       		echo "<script> location.replace('index.php'); </script>";

		}
		else
		{
			echo "<script> alert('Cập nhật thất bại');</script>";
       		echo "<script> location.replace('index.php'); </script>";
		}

	}
}
?>