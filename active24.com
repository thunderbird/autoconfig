<?xml version="1.0"?>
<clientConfig version="1.1">
  <emailProvider id="active24.com">
    <domain>active24.com</domain>
    <domain>smtp.cz</domain>
    <displayName>ACTIVE 24 Webhosting</displayName>
    <displayShortName>ACTIVE 24</displayShortName>
    <incomingServer type="imap">
      <hostname>email.active24.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>email.active24.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
      <pop3>
        <leaveMessagesOnServer>true</leaveMessagesOnServer>
      </pop3>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>email.active24.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
  <webMail>
    <loginPage url="https://webmail.active24.com/"/>
  </webMail>
</clientConfig>
