<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="yahoo.com">
    <domain>yahoo.com</domain>
    <domain>yahoo.de</domain>
    <domain>yahoo.it</domain>
    <domain>yahoo.fr</domain>
    <domain>yahoo.es</domain>
    <domain>yahoo.se</domain>
    <domain>yahoo.co.uk</domain>
    <domain>yahoo.co.nz</domain>
    <domain>yahoo.com.au</domain>
    <domain>yahoo.com.ar</domain>
    <domain>yahoo.com.br</domain>
    <domain>yahoo.com.mx</domain>
    <domain>ymail.com</domain>
    <domain>rocketmail.com</domain>
    <!-- MX -->
    <domain>mail.am0.yahoodns.net</domain>
    <domain>am0.yahoodns.net</domain>
    <!-- Unfortunately, also used for AOL :-( -->
    <domain>yahoodns.net</domain>

    <displayName>Yahoo! Mail</displayName>
    <displayShortName>Yahoo</displayShortName>

    <incomingServer type="imap">
      <hostname>imap.mail.yahoo.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.mail.yahoo.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.mail.yahoo.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <username>%EMAILADDRESS%</username>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
    </outgoingServer>

    <documentation url="https://help.yahoo.com/kb/new-mail-for-desktop/imap-server-settings-yahoo-mail-sln4075.html">
      <descr lang="en">How to setup email applications with imap to receive Yahoo! mail?</descr>
    </documentation>
    <documentation url="https://help.yahoo.com/kb/new-mail-for-desktop/pop-access-settings-instructions-yahoo-mail-sln4724.html">
      <descr lang="en">How to setup email applications with pop to receive Yahoo! mail?</descr>
    </documentation>
  </emailProvider>

  <oAuth2>
    <issuer>login.yahoo.com</issuer>
    <scope>mail-w</scope>
    <authURL>https://api.login.yahoo.com/oauth2/request_auth</authURL>
    <tokenURL>https://api.login.yahoo.com/oauth2/get_token</tokenURL>
  </oAuth2>

  <webMail>
    <loginPage url="https://mail.yahoo.com" />
    <loginPageInfo url="https://mail.yahoo.com/">
      <username>%EMAILADDRESS%</username>
      <usernameField id="login-username" />
      <passwordField id="login-passwd" />
      <loginButton id="login-signin" />
    </loginPageInfo>
  </webMail>
</clientConfig>
