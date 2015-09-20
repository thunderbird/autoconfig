<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="rr.com">
    <domain>rr.com</domain>
    <displayName>RoadRunner/TWC</displayName>
    <displayShortName>RR/TWC</displayShortName>
    <incomingServer type="imap">
      <hostname>mail.twc.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>mail.twc.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>mail.twc.com</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
    <documentation url="https://www.timewarnercable.com/en/support/faqs/faqs-internet/e-mailacco/incoming-outgoing-server-addresses.html" />
  </emailProvider>
</clientConfig>
