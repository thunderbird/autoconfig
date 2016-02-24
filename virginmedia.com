<?xml version="1.0" encoding="UTF-8"?>
<clientConfig version="1.1">
  <emailProvider id="virginmedia.com">
    <domain>virginmedia.com</domain>
    <domain>virgin.net</domain>
    <domain>ntlworld.com</domain>
    <domain>blueyonder.co.uk</domain>
    <displayName>Virgin Media Mail</displayName>
    <displayShortName>Virgin Media</displayShortName>
    <incomingServer type="imap">
       <hostname>imap.%EMAILDOMAIN%</hostname>
       <port>993</port>
       <socketType>SSL</socketType>
       <authentication>password-cleartext</authentication>
       <username>%EMAILADDRESS%</username>
    </incomingServer>
    <incomingServer type="pop3">
       <hostname>pop3.%EMAILDOMAIN%</hostname>
       <port>995</port>
       <socketType>SSL</socketType>
       <authentication>password-cleartext</authentication>
       <username>%EMAILADDRESS%</username>
    </incomingServer>
    <outgoingServer type="smtp">
       <hostname>smtp.%EMAILDOMAIN%</hostname>
       <port>465</port>
       <socketType>SSL</socketType>
       <authentication>password-cleartext</authentication>
       <username>%EMAILADDRESS%</username>
    </outgoingServer>
    <documentation url="http://help.virginmedia.com/system/web/custom/viewArticle.jsp?uuid=D78BA863-ACDB-47E4-908B-28214405408B">
      <descr lang="en">Email settings for addresses ending in @virginmedia.com</descr>
    </documentation>
    <documentation url="http://help.virginmedia.com/system/web/custom/viewArticle.jsp?uuid=E7AFC426-B082-4C9E-AAFE-BD8B22824263">
      <descr lang="en">Email settings for addresses ending in @virgin.net</descr>
    </documentation>
    <documentation url="http://help.virginmedia.com/system/web/custom/viewArticle.jsp?uuid=C30B1D91-FA00-48EE-928A-A77F7C7D1EFA">
      <descr lang="en">Email settings for addresses ending in @ntlworld.com</descr>
    </documentation>
    <documentation url="http://help.virginmedia.com/system/web/custom/viewArticle.jsp?uuid=55BDAE35-DD97-4F7C-A013-0BC0D6D21002">
      <descr lang="en">Email settings for addresses ending in @blueyonder.co.uk</descr>
    </documentation>
    <documentation url="http://help.virginmedia.com/system/web/custom/viewArticle.jsp?uuid=68845FEE-4C8F-49D0-B169-AB9C60AE6915">
       <descr lang="en">Using Thunderbird with Virgin Media Mail</descr>
    </documentation>
  </emailProvider>
</clientConfig>
