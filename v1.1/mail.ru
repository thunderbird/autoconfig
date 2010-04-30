<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="mail.ru">
    <domain>mail.ru</domain>
    <domain>inbox.ru</domain>
    <domain>list.ru</domain>
    <domain>bk.ru</domain>
    <displayName>mail.ru</displayName>
    <displayShortName>mail.ru</displayShortName>
    <incomingServer type="pop">
      <hostname>pop.mail.ru</hostname>
      <port>110</port>
      <socketType>plain</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.mail.ru</hostname>
      <port>587</port>
      <socketType>plain</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
</clientConfig>
