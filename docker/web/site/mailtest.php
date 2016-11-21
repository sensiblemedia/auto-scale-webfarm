<?php 

 require_once('class.phpmailer.php');
 
    $mail = new PHPMailer();
    $mail->SMTPDebug = 1;
    $mail->SMTPOptions = array('tls' => array('verify_peer' => false,'verify_peer_name' => false,'allow_self_signed' => true));
    $mail->CharSet =  "utf-8";
    $mail->IsSMTP();
    $mail->SMTPAuth = true;
    $mail->Username="admin@sensible.co";
    $mail->Password="1970srg1970";   
    $mail->SMTPSecure = "tls";
    $mail->Host = "smtp.gmail.com";
    $mail->Port = "587";
 
    $mail->SetFrom('admin@sensible.co','WooKungFoo');
    $mail->AddReplyTo("admin@sensible.co","WooKungFoo");
    $mail->AddAddress('srgpip@googlemail.com', 'Stephen Goldsmith');
 
    $mail->Subject  =  'using PHPMailer';
    $mail->IsHTML(true);
    $mail->Body    = 'Hi there ,
                        <br />
                        this mail was sent using PHPMailer...
                        <br />
                        cheers... :)';
  
     if($mail->Send())
     {
        echo "Message was Successfully Send :)";
     }
     else
     {
        echo "Mail Error - >".$mail->ErrorInfo;
     }
  
?>

