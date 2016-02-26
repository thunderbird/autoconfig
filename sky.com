<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
    <emailProvider id="sky.com">
      <domain>sky.com</domain>
      <displayName>Sky Mail</displayName>
      <displayShortName>Sky</displayShortName>

      <incomingServer type="imap">
         <hostname>imap.tools.sky.com</hostname>
         <port>993</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILADDRESS%</username>
      </incomingServer>
      <incomingServer type="pop3">
         <hostname>pop.tools.sky.com</hostname>
         <port>995</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILADDRESS%</username>
      </incomingServer>

      <outgoingServer type="smtp">
         <hostname>smtp.tools.sky.com</hostname>
         <port>465</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILADDRESS%</username>
      </outgoingServer>
	  
      <documentation url="http://help.sky.com/articles/get-emails-on-other-clients?product=email">
         <descr lang="en">Configure Thunderbird for IMAP or POP3</descr>
      </documentation>
    </emailProvider>
</clientConfig>