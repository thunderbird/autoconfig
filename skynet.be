<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="skynet.be">
    <domain>skynet.be</domain>
    <domain>proximus.be</domain>
    <domain>belgacom.net</domain>
    <domain>kidcity.be</domain>
    <displayName>Proximus</displayName>
    <displayShortName>Proximus</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.proximus.be</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.proximus.be</hostname>
      <port>485</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>relay.proximus.be</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="http://support.en.proximus.be/app/answers/detail/residential/internet/e-mails/set-up-your-mailbox/a_id/13753/c/1284,1349,1372,1963">
      <descr lang="en">Set up e-mail on your mail application</descr>
    </documentation>
  </emailProvider>
</clientConfig>
