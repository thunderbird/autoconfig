<clientConfig version="1.1">
  <emailProvider id="aol.com">
    <domain>aol.com</domain>
    <domain>aim.com</domain>
    <domain>netscape.net</domain>
    <domain>netscape.com</domain>
    <domain>compuserve.com</domain>
    <domain>cs.com</domain>
    <domain>wmconnect.com</domain>
    <displayName>AOL Mail</displayName>
    <displayShortName>AOL</displayShortName>
    <incomingServer type="imap">
      <hostname>imap.aol.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>pop.aol.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.aol.com</hostname>
      <port>465</port>
      <socketType>SSL</socketType>
      <authentication>OAuth2</authentication>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="https://help.aol.com/articles/how-do-i-use-other-email-applications-to-send-and-receive-my-aol-mail">
      <descr lang="en">How do I set up other email applications to send and receive my AOL Mail?</descr>
    </documentation>
  </emailProvider>
  <webMail>
    <loginPage url="https://mail.aol.com/"/>
    <loginPageInfo url="https://mail.aol.com/">
      <username>%EMAILADDRESS%</username>
      <usernameField id="lgnId1" name="loginId"/>
      <passwordField id="pwdId1" name="password"/>
      <loginButton id="submitID"/>
    </loginPageInfo>
  </webMail>
</clientConfig>
