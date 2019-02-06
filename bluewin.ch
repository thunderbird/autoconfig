<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="swisscom.ch">
    <domain>bluewin.ch</domain>
    <domain>bluemail.ch</domain>
    <displayName>Bluewin Mail</displayName>
    <displayShortName>Bluewin</displayShortName>
    <incomingServer type="imap">
      <hostname>imaps.bluewin.ch</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop3s.bluewin.ch</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtpauths.bluewin.ch</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
    <documentation url="http://smtphelp.bluewin.ch/" />
  </emailProvider>
  <webMail>
    <loginPage url="https://webmail.bluewin.ch/" />
  </webMail>
</clientConfig>
