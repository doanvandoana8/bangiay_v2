<?php
 include $_SERVER["DOCUMENT_ROOT"] . "/bangiay_v2/admin/function/danhmucsanpham/danhmucsanpham.php";
?>

<link href="css/chitietnguoidung.css" rel="stylesheet">
<div class="container">
  <div class="row">
    <?php
        //thong tin cua nguoi dung
        function thongtinNguoiDung($taikhoan){
          $qr="SELECT * FROM `nguoidung` WHERE tai_khoan='$taikhoan'";
          return mysql_query($qr);
        }

        $taikhoan=$_SESSION['username'];
        $tt=thongtinNguoiDung($taikhoan);
        while ($row_tt=mysql_fetch_array($tt)) {
        ?>
       
    <div class="pull-left image" style="margin-left: 24px;width: 63px;">

      <img src="../images/avatar/<?php echo $row_tt['anh_nguoi_dung']?>" class="img-circle" alt="User Image" style="width: 60px;height: 60px;">
    </div>


    <div class="pull-left info" style="margin-left: 15px;margin-top: 15px;">
      <p><?php echo $row_tt['ho_ten']?></p>
      <a href="../index.php?p=dangxuat"><i class="glyphicon glyphicon-log-out"></i> Thoát</a>
    </div>

     <?php
        }

      ?>

  </div>
  <div class="row">

    <div class="col-sm-3" style="text-transform: capitalize;">

      <ul class="sidebar-menu tree" data-widget="tree" style="border: 3px solid #d9edf7;color: black;">
        <li > ADMIN</li>
        
         <li class="treeview">
          <a href="#">
            <i class="glyphicon glyphicon-pencil"></i> <span> giới thiệu</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            <li><a href="index.php?p=gioithieulogo"><i class="fa fa-chevron-circle-right fa-1"></i> Logo trang chủ</a></li>
            <li><a href="index.php?p=gioithieutrangchu"><i class="fa fa-chevron-circle-right fa-1"></i> trang chủ</a></li>
            <li><a href="index.php?p=gioithieutrangcon"><i class="fa fa-chevron-circle-right fa-1"></i> trang con</a></li>
          </ul>
        </li>

          <li class="treeview">
          <a href="#">
            <i class="glyphicon glyphicon-envelope"></i> <span> liên hệ</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            <li><a href="index.php?p=thongtinlienhe"><i class="fa fa-chevron-circle-right fa-1"></i> thông tin liên hệ</a></li>
            <li><a href="index.php?p=khachhanglienhe"><i class="fa fa-chevron-circle-right fa-1"></i> liên hệ của khách hàng</a></li>
           
          </ul>
        </li>

        <li>
          <a href="index.php?p=danhsachloaisanpham">
            <i class="fa fa-calendar"></i> <span> loại sản phẩm</span>
          </a>
        </li>

       
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-list-alt fa-1"></i> <span> danh mục sản phẩm</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
          <?php 
            $ds=dsLoaiSPct();
            while ($row_ds= mysql_fetch_array($ds)) {
          ?>
            <li><a href="index.php?p=danhmucsanpham&idloai=<?php echo $row_ds['id_loai_san_pham']?>"><i class="fa fa-chevron-circle-right fa-1"></i> <?php echo $row_ds['ten_loai_san_pham']?></a></li>
          <?php
            }
          ?>
            
           
          </ul>
        </li>


        <li class="treeview">
          <a href="#">
            <i class="fa fa-shopping-cart fa-1"></i> <span> quản lí đơn hàng</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            <li><a href="index.php?p=donhangdangcho"><i class="fa fa-chevron-circle-right fa-1"></i> Đang chờ</a></li>
            <li><a href="index.php?p=donhangdaxuli"><i class="fa fa-chevron-circle-right fa-1"></i> Đã xử lí</a></li>
            <li><a href="index.php?p=donhandagiaodich"><i class="fa fa-chevron-circle-right fa-1"></i> Đã giao dịch</a></li>

          </ul>
        </li>

        <li>
          <a href="index.php?p=binhluan">
            <i class="fa fa-comments fa-1"></i> <span> quản lí bình luận</span>
          </a>
        </li>



        <li>
          <a href="index.php?p=quanliuser">
            <i class="glyphicon glyphicon-user"></i> <span> quản lí người dùng</span>
          </a>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-shopping-cart fa-1"></i> <span> Sự kiện</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" style="display: none;">
            <li><a href="index.php?p=giamgia"><i class="fa fa-chevron-circle-right fa-1"></i> Giảm giá</a></li>
          </ul>
        </li>

        <li>
          <a href="index.php?p=thongke">
            <i class="fa fa-bar-chart fa-1"></i> <span> Thống kê</span>
          </a>
        </li>


        <li>
          <a href="index.php?p=baocao">
            <i class="glyphicon glyphicon-bullhorn"></i> <span> báo cáo</span>
          </a>
        </li>

        <?php
          //Bien $QH da duoc khai bao o trang index nen khong can khai bao nua
          if ($QH==2){   
            echo'<li > ADMIN ROOT</li>
                <li>
                  <a href="index.php?p=quanliadmin">
                    <i class="glyphicon glyphicon-home"></i> <span> quản lí admin</span>
                  </a>
                </li>';
          }
        ?>

        

      </ul>
    </div>
  </div>
</div>
