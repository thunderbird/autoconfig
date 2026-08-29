<clientConfig version="1.1">
  <emailProvider id="ionos.com">
    <!-- MX servers -->
    <domain>ionos.com</domain>
    <domain>1and1.com</domain>
    <domain>perfora.net</domain>
    <displayName>IONOS</displayName>
    <displayShortName>IONOS</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.ionos.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="imap">
      <hostname>imap.ionos.com</hostname>
      <port>143</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.ionos.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.ionos.com</hostname>
      <port>110</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.ionos.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.ionos.com</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="https://www.ionos.com/help/index.php?id=2490"/>
  </emailProvider>
  <webMail>
    <loginPage url="https://mail.ionos.com/"/>
    <loginPageInfo url="https://mail.ionos.com/">
      <username>%EMAILADDRESS%</username>
      <usernameField id="username"/>
      <passwordField id="password"/>
      <loginButton id="submit-login-form"/>
    </loginPageInfo>
  </webMail>
</clientConfig>
