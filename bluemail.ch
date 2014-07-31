<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="bluemail.ch">
    <domain>bluemail.ch</domain>
    <!-- Same ISP as bluewin.ch, but different username form -->
    <displayName>bluewin.ch</displayName>
    <displayShortName>bluewin.ch</displayShortName>
    <incomingServer type="imap">
      <hostname>imaps.bluewin.ch</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop3s.bluewin.ch</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtpauths.bluewin.ch</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>password-encrypted</authentication>
    </outgoingServer>
    <documentation url="http://smtphelp.bluewin.ch/swisscomdtg/setup/?"/>
  </emailProvider>
  <webMail>
    <loginPage url="https://rich.sso.bluewin.ch/cp/applink/sso/Login?d=%EMAILDOMAIN%" />
    <loginPageInfo
      url="https://rich.sso.bluewin.ch/cp/applink/sso/Login?d=%EMAILDOMAIN%">
      <username>%EMAILLOCALPART%</username>
      <usernameField id="username" name="user" />
      <passwordField name="password" />
      <loginButton name="anmelden" />
    </loginPageInfo>
  </webMail>
</clientConfig>
