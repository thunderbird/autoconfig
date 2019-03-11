<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="zeelandnet.nl">
    <domain>zeelandnet.nl</domain>
    <displayName>ZeelandNet e-mail</displayName>
    <displayShortName>ZeelandNet</displayShortName>
    <incomingServer type="imap">
      <hostname>mail.zeelandnet.nl</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILLOCALPART%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>mail.zeelandnet.nl</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILLOCALPART%</username>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>mail.zeelandnet.nl</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILLOCALPART%</username>
    </outgoingServer>
  </emailProvider>
</clientConfig>
