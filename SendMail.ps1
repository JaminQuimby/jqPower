$SMTPserver = "smtp.domain.com"
 
$EmailFrom =
 <script type="text/javascript">
 <!--
 var prefix = 'ma' + 'il' + 'to';
 var path = 'hr' + 'ef' + '=';
 var addy84415 = 'fromuser' + '@';
 addy84415 = addy84415 + 'domain' + '.' + 'com';
 document.write('<a ' + path + '\'' + prefix + ':' + addy84415 + '\'>');
 document.write(addy84415);
 document.write('<\/a>');
 //-->\n </script><a href="mailto:fromuser@domain.com">fromuser@domain.com</a><script type="text/javascript">
 <!--
 document.write('<span style=\'display: none;\'>');
 //-->
 </script><span style="display: none;">This email address is being protected from spambots. You need JavaScript enabled to view it.
 <script type="text/javascript">
 <!--
 document.write('</');
 document.write('span>');
 //-->
 </script></span>
$EmailTo = "
 <script type="text/javascript">
 <!--
 var prefix = 'ma' + 'il' + 'to';
 var path = 'hr' + 'ef' + '=';
 var addy97061 = 'jamin' + '@';
 addy97061 = addy97061 + 'awensa' + '.' + 'com';
 document.write('<a ' + path + '\'' + prefix + ':' + addy97061 + '\'>');
 document.write(addy97061);
 document.write('<\/a>');
 //-->\n </script><a href="mailto:jamin@awensa.com">jamin@awensa.com</a><script type="text/javascript">
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
$EmailSubject = "PowerShell Test"
$EmailBody = "this is my very first email send through PowerShell"
 
$SMTPClient = new-object Net.Mail.SMTPclient($SMTPserver)
$EmailMsg = new-object Net.Mail.MailMessage($EmailFrom, $EmailTo, $EmailSubject, $EmailBody)
 
$SMTPClient.send($EmailMsg) 