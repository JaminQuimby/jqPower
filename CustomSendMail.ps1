#==== Writen by Jamin Quimby ===========================================#
#==== Copyright jaminquimby.com ========================================#
#==== jPowershell is a collection of powershell functions writen my Jamin Quimby. ===#
#---- FunctionCustomSendMail ----#
function CustomSendMail{
  
[CmdletBinding()]
param(
[parameter(mandatory=$true, HelpMessage='What smtp server would you like to target?')][alias("srv")][string]$smtpserver,
[parameter(mandatory=$true, HelpMessage='What is your email address?')][alias("f")][string]$from,
[parameter(mandatory=$true, HelpMessage='What is your password?')][alias("p")][string]$password,
[parameter(mandatory=$true, HelpMessage='Where would you like to send email?')][alias("t")][string]$to,
[parameter(mandatory=$true, HelpMessage='What is the email subject?')][alias("s")][string]$subject,
[parameter(mandatory=$true, HelpMessage='What is the contents of your email?')][alias("b")][string]$body,
[parameter(mandatory=$false,HelpMessage='What is the file path and file you would like to send?')][string]$file,
[parameter(mandatory=$false,HelpMessage='What is the port number of your smtp server?')][int]$port = 587
)
#-- END SET PRERESIQUITES --#
 
process
{
#-- Build email message --#
$mailmessage = New-Object system.net.mail.mailmessage
$mailmessage.from = $from
$mailmessage.To.add($to)
$mailmessage.Subject = $subject
$mailmessage.Body = $body
$mailmessage.IsBodyHTML = $true
if(test-path $file){
$attachment = New-Object System.Net.Mail.Attachment($file)
$mailmessage.Attachments.Add($attachment)
}
#-- If email is secure --#
$SMTPClient = New-Object Net.Mail.SmtpClient($SMTPServer)
$SMTPClient.Port=$port
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($from,$password);
$SMTPClient.Send($mailmessage)
 
 
Write-Output "Your email has been sent."
}
 <#
.SYNOPSIS
 Sends an e-mail message.
.DESCRIPTION
 CustomSendMail is a function to send emails from Powershell.
.EXAMPLE
 CustomSendMail -srv SERVERNAME -f EMAILFROM -p PASSWORD -t EMAILTO -s EMAILSUBJECT -b EMAILBODY
 Custom-SendMail
.EXAMPLE
 CustomSendMail -srv SERVERNAME -f EMAILFROM -p PASSWORD -t EMAILTO -s EMAILSUBJECT -b EMAILBODY -file ATTACHMENT -port SMTPPORT
.LINK
http://jaminquimby.com/joomla253/programing/96-powershell/506-code-customsendmail
  #>
}
