<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="bigpond.com">
    <domain>bigpond.com</domain>
    <domain>bigpond.net.au</domain>
    <domain>telstra.com</domain>
    <domain>bigpond.net</domain>
    <displayName>Telstra Mail</displayName>
    <displayShortName>TMail</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.telstra.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.telstra.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.telstra.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
  <documentation url="https://www.telstra.com.au/support/category/email/telstra-mail/recommended-email-settings-for-telstra-mail">
    <descr lang="en">Recommended email settings</descr>
  </documentation>
</clientConfig>
