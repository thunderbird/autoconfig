<?xml version="1.0" encoding="UTF-8"?>

<clientConfig version="3.0">
    <emailProvider id="rambler.ru">
      <domain>rambler.ru</domain>

      <displayName>Rambler Mail</displayName>
      <displayShortName>Rambler</displayShortName>

      <incomingServer type="imap">
         <hostname>mail.rambler.ru</hostname>
         <port>993</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>plain</authentication>
      </incomingServer>
      <!--
      <incomingServer type="pop">
         <hostname>mail.rambler.ru</hostname>
         <port>995</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>secure</authentication>
      </incomingServer>
      -->
      <outgoingServer type="smtp">
         <hostname>mail.rambler.ru</hostname>
         <port>465</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>secure</authentication>
         <addThisServer>true</addThisServer>
         <useGlobalPreferredServer>false</useGlobalPreferredServer>
      </outgoingServer>
    </emailProvider>
    <!--
      Config is described at
      http://help.rambler.ru/article.html?s=141&id=41 (POP, Thunderbird, with screenshots)
      http://help.rambler.ru/article.html?s=141&id=33 (IMAP, all clients)
    -->
</clientConfig>
