<?php
function sendMail($title, $content, $nTo, $mTo,$diachicc=''){
    $nFrom = 'SHOES SHOP';
    $mFrom = 'doanvandoana8uit@gmail.com';  //dia chi email cua ban 
    $mPass = 'vandoan8592';       //mat khau email cua ban
    $mail             = new PHPMailer();
    $body             = $content;
    $mail->IsSMTP(); 
   
    $mail->CharSet   = "utf-8";

    $mail->SMTPDebug  = 0;
                        // enables SMTP debug information (for testing)
    $mail->SMTPAuth   = true;     
                   // enable SMTP authentication
    $mail->SMTPSecure = "ssl";    
                  // sets the prefix to the servier
    $mail->Host       = "smtp.gmail.com";  

    $mail->Port       = 465;

    $mail->Username   = $mFrom;  // GMAIL username
    $mail->Password   = $mPass; 
                // GMAIL password
    $mail->SetFrom($mFrom, $nFrom);
     //mFrom,nFrom : dia chi gui email, ten nguoi gui email

    //chuyen chuoi thanh mang
    $ccmail = explode(',', $diachicc);
   
    $ccmail = array_filter($ccmail);
    if(!empty($ccmail)){
        foreach ($ccmail as $k => $v) {
            $mail->AddCC($v);
        }
    }
    $mail->Subject    = $title;
    $mail->MsgHTML($body);
    $address = $mTo;
    $mail->AddAddress($address, $nTo);
    $mail->AddReplyTo('doanvandoana8uit@gmail.com', 'Công ty cổ phần shoes shop');
    
    if(!$mail->Send()) {
        return 0;
    } else {
        return 1;
    }
}
 
function sendMailAttachment($title, $content, $nTo, $mTo,$diachicc='',$file,$filename){
    $nFrom = 'SHOES SHOP';
    $mFrom = 'doanvandoana8uit@gmail.com';  //dia chi email cua ban 
    $mPass = 'vandoan8592';       //mat khau email cua ban
    $mail             = new PHPMailer();
    $body             = $content;
    $mail->IsSMTP(); 
    $mail->CharSet   = "utf-8";
    $mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
    $mail->SMTPAuth   = true;                    // enable SMTP authentication
    $mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
    $mail->Host       = "smtp.gmail.com";        
    $mail->Port       = 465;
    $mail->Username   = $mFrom;  // GMAIL username
    $mail->Password   = $mPass;               // GMAIL password
    $mail->SetFrom($mFrom, $nFrom);
    //chuyen chuoi thanh mang
    $ccmail = explode(',', $diachicc);
    $ccmail = array_filter($ccmail);
    if(!empty($ccmail)){
        foreach ($ccmail as $k => $v) {
            $mail->AddCC($v);
        }
    }
    $mail->Subject    = $title;
    $mail->MsgHTML($body);
    $address = $mTo;
    $mail->AddAddress($address, $nTo);
    $mail->AddReplyTo('doanvandoana8uit@gmail.com', 'Công ty cổ phẩn shoes shop');
    $mail->AddAttachment($file,$filename);
    if(!$mail->Send()) {
        return 0;
    } else {
        return 1;
    }
}
 
?>