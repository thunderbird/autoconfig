<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="hotmail.com">
    <domain>hotmail.com</domain>
    <domain>hotmail.co.uk</domain>
    <domain>hotmail.co.jp</domain>
    <domain>hotmail.com.br</domain>
    <domain>hotmail.de</domain>
    <domain>hotmail.fr</domain>
    <domain>hotmail.it</domain>
    <domain>hotmail.es</domain>
    <domain>live.com</domain>
    <domain>live.co.uk</domain>
    <domain>live.co.jp</domain>
    <domain>live.de</domain>
    <domain>live.fr</domain>
    <domain>live.it</domain>
    <domain>live.jp</domain>
    <domain>msn.com</domain>
    <domain>outlook.com</domain>
    <displayName>Microsoft Live Hotmail</displayName>
    <displayShortName>Hotmail</displayShortName>
    <incomingServer type="imap">
      <hostname>imap-mail.outlook.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <!-- wrong cert, for *.hotmail.com -->
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop-mail.outlook.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <!-- wrong cert, for *.hotmail.com -->
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
      <pop3>
        <leaveMessagesOnServer>true</leaveMessagesOnServer>
        <!-- Outlook.com docs specifically mention that POP3 deletes have effect on the main inbox on webmail and IMAP -->
      </pop3>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp-mail.outlook.com</hostname>
      <port>587</port>
      <!-- wrong cert, for *.hotmail.com -->
      <socketType>STARTTLS</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
    <documentation url="http://windows.microsoft.com/en-US/windows/outlook/send-receive-from-app">
      <descr lang="en">Set up an email app with Outlook.com</descr>
    </documentation>
    <documentation url="http://blogs.office.com/b/microsoft-outlook/archive/2013/09/12/outlook-com-now-with-imap.aspx">
      <descr lang="en">Blog post annoncing IMAP</descr>
    </documentation>
  </emailProvider>
</clientConfig>
