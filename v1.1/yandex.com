<?xml version="1.0" encoding="UTF-8"?>

<clientConfig>
    <emailProvider id="yandex.ru">
      <domain>narod.ru</domain>
      <domain>ya.ru</domain>
      <domain>yandex.com</domain>
      <domain>yandex.net</domain>
      <domain>yandex.by</domain>
      <domain>yandex.kz</domain>
      <domain>yandex.ru</domain>
      <domain>yandex.ua</domain>

      <displayName>Yandex Mail</displayName>
      <displayShortName>Yandex</displayShortName>

      <incomingServer type="imap">
         <hostname>imap.yandex.ru</hostname>
         <port>993</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>plain</authentication>
      </incomingServer>
      <!--
      <incomingServer type="pop">
         <hostname>pop.yandex.ru</hostname>
         <port>995</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>plain</authentication>
      </incomingServer>
       -->
      <outgoingServer type="smtp">
         <hostname>smtp.yandex.ru</hostname>
         <port>465</port>
         <socketType>SSL</socketType>
         <username>%EMAILADDRESS%</username>
         <authentication>plain</authentication>
         <addThisServer>true</addThisServer>
         <useGlobalPreferredServer>false</useGlobalPreferredServer>
      </outgoingServer>

      <enableURL url="http://mail.yandex.ru/neo/setup_client" instruction="Check 'Enable IMAP' on Yandex.Mail setup page" />

    </emailProvider>
</clientConfig>
