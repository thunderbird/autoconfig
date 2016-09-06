<?xml version="1.0"?>
<clientConfig version="1.1">
  <emailProvider id="dondominio.com">
    <domain>dondominio.com</domain>
    <displayName>DonDominio/MrDomain</displayName>
    <displayShortName>DonDominio/MrDomain</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.dondominio.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop3.dondominio.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.dondominio.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
  <webMail>
    <loginPage url="https://webmail.dondominio.com"/>
  </webMail>
</clientConfig>
