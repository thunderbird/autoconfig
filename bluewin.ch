<?xml version='1.0' encoding='UTF-8'?>
<clientConfig version="3.0">
  <emailProvider id="bluewin.ch">
    <domain>bluewin.ch</domain>
    <displayName>bluewin.ch</displayName>
    <displayShortName>bluewin.ch</displayShortName>
    <incomingServer type="imap">
      <hostname>imaps.bluewin.ch</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILLOCALPART%</username>
      <authentication>plain</authentication>
    </incomingServer>
    <!--
    <incomingServer type="pop3">
      <hostname>pop3s.bluewin.ch</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILLOCALPART%</username>
      <authentication>secure</authentication>
    </incomingServer>
    -->
    <outgoingServer type="smtp">
      <hostname>smtpauths.bluewin.ch</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILLOCALPART%</username>
      <authentication>secure</authentication>
      <addThisServer>true</addThisServer>
      <useGlobalPreferredServer>false</useGlobalPreferredServer>
    </outgoingServer>
    <!--
      Email support page
      http://smtphelp.bluewin.ch/swisscomdtg/setup/?
    -->
  </emailProvider>
</clientConfig>
