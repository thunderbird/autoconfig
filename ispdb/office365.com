<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="office365.com">
    <!-- Office365 customer domains -->
    <domain>office365.com</domain>
    <domain>onmicrosoft.com</domain>
    <!-- MX e.g. example.mail.protection.outlook.com -->
    <domain>mail.protection.outlook.com</domain>
    <displayName>Office365 (Microsoft)</displayName>
    <displayShortName>Office365</displayShortName>
    <incomingServer type="imap">
      <hostname>outlook.office365.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>outlook.office365.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
      <pop3>
        <leaveMessagesOnServer>true</leaveMessagesOnServer>
      </pop3>
    </incomingServer>
    <incomingServer type="exchange">
      <hostname>outlook.office365.com</hostname>
      <port>443</port>
      <username>%EMAILADDRESS%</username>
      <socketType>SSL</socketType>
      <authentication>OAuth2</authentication>
      <owaURL>https://outlook.office365.com/owa/</owaURL>
      <ewsURL>https://outlook.office365.com/ews/exchange.asmx</ewsURL>
      <useGlobalPreferredServer>true</useGlobalPreferredServer>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.office365.com</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
  </emailProvider>
</clientConfig>
