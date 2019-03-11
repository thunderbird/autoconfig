<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="outlook.com">
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
    <displayName>Outlook.com (Microsoft)</displayName>
    <displayShortName>Outlook</displayShortName>
    <incomingServer type="imap">
      <hostname>imap-mail.outlook.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop-mail.outlook.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
      <pop3>
        <leaveMessagesOnServer>true</leaveMessagesOnServer>
        <!-- Outlook.com docs specifically mention that POP3 deletes have effect on the main inbox on webmail and IMAP -->
      </pop3>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp-mail.outlook.com</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="http://windows.microsoft.com/en-US/windows/outlook/send-receive-from-app">
      <descr lang="en">Set up an email app with Outlook.com</descr>
    </documentation>
  </emailProvider>
  <webMail>
    <loginPage url="https://www.outlook.com/"/>
    <loginPageInfo url="https://www.outlook.com/">
      <username>%EMAILADDRESS%</username>
      <usernameField id="i0116" name="login"/>
      <passwordField id="i0118" name="passwd"/>
      <loginButton id="idSIButton9" name="SI"/>
    </loginPageInfo>
  </webMail>
</clientConfig>
