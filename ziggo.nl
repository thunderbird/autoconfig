<?xml version="1.0"?>
<clientConfig version="1.1">
  <emailProvider id="ziggo.nl">
    <domain>hahah.nl</domain>
    <domain>ziggomail.com</domain>
    <domain>casema.nl</domain>
    <domain>zinders.nl</domain>
    <domain>ziggo.nl</domain>
    <domain>zeggis.nl</domain>
    <domain>zeggis.com</domain>
    <domain>razcall.nl</domain>
    <domain>razcall.com</domain>
    <domain>upcmail.nl</domain>
    <domain>chello.nl</domain>
    <domain>multiweb.nl</domain>
    <domain>home.nl</domain>
    <domain>quicknet.nl</domain>
    <displayName>Ziggo Mail</displayName>
    <displayShortName>Ziggo</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.ziggo.nl</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.ziggo.nl</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.ziggo.nl</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
  </emailProvider>
  <documentation url="https://www.ziggo.nl/klantenservice/e-mail/?src=autoconfig">
    <descr lang="en">E-mail Settings</descr>
    <descr lang="nl">Instellingen voor e-mail</descr>
  </documentation>
</clientConfig>
