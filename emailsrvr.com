<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="emailsrvr.com">
    <domain>emailsrvr.com</domain>
    <displayName>Rackspace Email Hosting</displayName>
    <displayShortName>rackspace</displayShortName>
    <incomingServer type="imap">
      <hostname>secure.emailsrvr.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>secure.emailsrvr.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
</clientConfig>
