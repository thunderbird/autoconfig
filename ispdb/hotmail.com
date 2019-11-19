<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="hotmail.com">
    <domain>hotmail.com</domain>
    <domain>live.com</domain>
    <domain>msn.com</domain>
    <domain>windowslive.com</domain>
    <domain>outlook.at</domain>
    <domain>outlook.be</domain>
    <domain>outlook.cl</domain>
    <domain>outlook.cz</domain>
    <domain>outlook.de</domain>
    <domain>outlook.dk</domain>
    <domain>outlook.es</domain>
    <domain>outlook.fr</domain>
    <domain>outlook.hu</domain>
    <domain>outlook.ie</domain>
    <domain>outlook.in</domain>
    <domain>outlook.it</domain>
    <domain>outlook.jp</domain>
    <domain>outlook.kr</domain>
    <domain>outlook.lv</domain>
    <domain>outlook.my</domain>
    <domain>outlook.ph</domain>
    <domain>outlook.pt</domain>
    <domain>outlook.sa</domain>
    <domain>outlook.sg</domain>
    <domain>outlook.sk</domain>
    <domain>outlook.co.id</domain>
    <domain>outlook.co.il</domain>
    <domain>outlook.co.th</domain>
    <domain>outlook.com.ar</domain>
    <domain>outlook.com.au</domain>
    <domain>outlook.com.br</domain>
    <domain>outlook.com.gr</domain>
    <domain>outlook.com.tr</domain>
    <domain>outlook.com.vn</domain>
    <domain>hotmail.be</domain>
    <domain>hotmail.ca</domain>
    <domain>hotmail.cl</domain>
    <domain>hotmail.cz</domain>
    <domain>hotmail.de</domain>
    <domain>hotmail.dk</domain>
    <domain>hotmail.es</domain>
    <domain>hotmail.fi</domain>
    <domain>hotmail.fr</domain>
    <domain>hotmail.gr</domain>
    <domain>hotmail.hu</domain>
    <domain>hotmail.it</domain>
    <domain>hotmail.lt</domain>
    <domain>hotmail.lv</domain>
    <domain>hotmail.my</domain>
    <domain>hotmail.nl</domain>
    <domain>hotmail.no</domain>
    <domain>hotmail.ph</domain>
    <domain>hotmail.rs</domain>
    <domain>hotmail.se</domain>
    <domain>hotmail.sg</domain>
    <domain>hotmail.sk</domain>
    <domain>hotmail.co.id</domain>
    <domain>hotmail.co.il</domain>
    <domain>hotmail.co.in</domain>
    <domain>hotmail.co.jp</domain>
    <domain>hotmail.co.kr</domain>
    <domain>hotmail.co.th</domain>
    <domain>hotmail.co.uk</domain>
    <domain>hotmail.co.za</domain>
    <domain>hotmail.com.ar</domain>
    <domain>hotmail.com.au</domain>
    <domain>hotmail.com.br</domain>
    <domain>hotmail.com.hk</domain>
    <domain>hotmail.com.tr</domain>
    <domain>hotmail.com.tw</domain>
    <domain>hotmail.com.vn</domain>
    <domain>live.at</domain>
    <domain>live.be</domain>
    <domain>live.ca</domain>
    <domain>live.cl</domain>
    <domain>live.cn</domain>
    <domain>live.de</domain>
    <domain>live.dk</domain>
    <domain>live.fi</domain>
    <domain>live.fr</domain>
    <domain>live.hk</domain>
    <domain>live.ie</domain>
    <domain>live.in</domain>
    <domain>live.it</domain>
    <domain>live.jp</domain>
    <domain>live.nl</domain>
    <domain>live.no</domain>
    <domain>live.ru</domain>
    <domain>live.se</domain>
    <domain>live.co.jp</domain>
    <domain>live.co.kr</domain>
    <domain>live.co.uk</domain>
    <domain>live.co.za</domain>
    <domain>live.com.ar</domain>
    <domain>live.com.au</domain>
    <domain>live.com.mx</domain>
    <domain>live.com.my</domain>
    <domain>live.com.ph</domain>
    <domain>live.com.pt</domain>
    <domain>live.com.sg</domain>
    <domain>livemail.tw</domain>
    <!-- MX e.g. eur.olc.protection.outlook.com -->
    <domain>olc.protection.outlook.com</domain>

    <displayName>Outlook.com (Microsoft)</displayName>
    <displayShortName>Outlook</displayShortName>
    <incomingServer type="imap">
      <hostname>outlook.office365.com</hostname>
      <port>993</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
      <hostname>outlook.office365.com</hostname>
      <port>995</port>
      <socketType>SSL</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
      <pop3>
        <leaveMessagesOnServer>true</leaveMessagesOnServer>
        <!-- Outlook.com docs specifically mention that POP3 deletes have effect on the main inbox on webmail and IMAP -->
      </pop3>
    </incomingServer>
    <outgoingServer type="smtp">
      <hostname>smtp.office365.com</hostname>
      <port>587</port>
      <socketType>STARTTLS</socketType>
      <authentication>password-cleartext</authentication>
      <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="https://support.office.com/article/pop-imap-and-smtp-settings-for-outlook-com-d088b986-291d-42b8-9564-9c414e2aa040">
      <descr lang="en">POP, IMAP, and SMTP settings for Outlook.com</descr>
    </documentation>
  </emailProvider>
  <webMail>
    <loginPage url="https://www.outlook.com/"/>
    <loginPageInfo url="https://www.outlook.com/">
      <username>%EMAILADDRESS%</username>
      <usernameField id="i0116" name="login"/>
      <passwordField id="i0118" name="passwd"/>
      <loginButton id="idSIButton9" name="SI"/>
    </loginPageInfo>
  </webMail>
</clientConfig>
