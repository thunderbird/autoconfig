<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="onet.pl">
    <domain>onet.pl</domain>
    <domain>onet.eu</domain>
    <domain>poczta.onet.pl</domain>
    <domain>poczta.onet.eu</domain>
    <domain>op.pl</domain>
    <domain>vp.pl</domain>
    <domain>autograf.pl</domain>
    <domain>buziaczek.pl</domain>
    <domain>amorki.pl</domain>
    <domain>republika.pl</domain>
    <domain>adres.pl</domain>
    <domain>cyberia.pl</domain>
    <domain>onet.com.pl</domain>
    <domain>opoczta.pl</domain>
    <domain>pseudonim.pl</domain>
    <domain>spoko.pl</domain>
    <domain>vip.onet.pl</domain>
    <displayName>Onet Poczta</displayName>
    <displayShortName>Onet</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.poczta.onet.pl</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop3.poczta.onet.pl</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.poczta.onet.pl</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.poczta.onet.pl</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </outgoingServer>
    <documentation url="https://pomoc.poczta.onet.pl/baza-wiedzy/konfiguracja-poczty-w-programie-mozilla-thunderbird/">
      <descr lang="pl">Konfiguracja poczty: Mozilla Thunderbird</descr>
    </documentation>
  </emailProvider>
</clientConfig>
