$EmailFrom = "
 <script type="text/javascript">
 <!--
 var prefix = 'ma' + 'il' + 'to';
 var path = 'hr' + 'ef' + '=';
 var addy29209 = 'user' + '@';
 addy29209 = addy29209 + 'domain' + '.' + 'com';
 document.write('<a ' + path + '\'' + prefix + ':' + addy29209 + '\'>');
 document.write(addy29209);
 document.write('<\/a>');
 //-->\n </script><a href="mailto:user@domain.com">user@domain.com</a><script type="text/javascript">
 <!--
 document.write('<span style=\'display: none;\'>');
 //-->
 </script><span style="display: none;">This email address is being protected from spambots. You need JavaScript enabled to view it.
 <script type="text/javascript">
 <!--
 document.write('</');
 document.write('span>');
 //-->
 </script></span>"
$EmailTo = "
 <script type="text/javascript">
 <!--
 var prefix = 'ma' + 'il' + 'to';
 var path = 'hr' + 'ef' + '=';
 var addy11416 = 'user' + '@';
 addy11416 = addy11416 + 'domain' + '.' + 'com';
 document.write('<a ' + path + '\'' + prefix + ':' + addy11416 + '\'>');
 document.write(addy11416);
 document.write('<\/a>');
 //-->\n </script><a href="mailto:user@domain.com">user@domain.com</a><script type="text/javascript">
 <!--
 document.write('<span style=\'display: none;\'>');
 //-->
 </script><span style="display: none;">This email address is being protected from spambots. You need JavaScript enabled to view it.
 <script type="text/javascript">
 <!--
 document.write('</');
 document.write('span>');
 //-->
 </script></span>"
$EmailSubject = "email subject"
  
$SMTPServer = "smtphost.domain.com"
$SMTPAuthUsername = "username"
$SMTPAuthPassword = "password"
 
$emailattachment = "full path to attachment file"
 
function send_email {
 $mailmessage = New-Object system.net.mail.mailmessage
 $mailmessage.from = ($emailfrom)
 $mailmessage.To.add($emailto)
 $mailmessage.Subject = $emailsubject
 $mailmessage.Body = $emailbody
 
 $attachment = New-Object System.Net.Mail.Attachment($emailattachment, 'text/plain')
   $mailmessage.Attachments.Add($attachment)
 
 
#$mailmessage.IsBodyHTML = $true
 $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
 $SMTPClient.Credentials = New-Object System.Net.NetworkCredential ("$SMTPAuthUsername", "$SMTPAuthPassword")
 $SMTPClient.Send($mailmessage)
}