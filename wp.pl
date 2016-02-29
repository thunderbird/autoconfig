<clientConfig version="1.1">
    <emailProvider id="wp.pl">
      <domain>wp.pl</domain>
      <displayName>Poczta Wirtualna Polska</displayName>
      <displayShortName>Poczta WP</displayShortName>

      <incomingServer type="imap">
         <hostname>imap.wp.pl</hostname>
         <port>993</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILLOCALPART%</username>
      </incomingServer>
      <incomingServer type="pop3">
         <hostname>pop3.wp.pl</hostname>
         <port>995</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILLOCALPART%</username>
      </incomingServer>

      <outgoingServer type="smtp">
         <hostname>smtp.wp.pl</hostname>
         <port>465</port>
         <socketType>SSL</socketType>
         <authentication>password-cleartext</authentication>
         <username>%EMAILLOCALPART%</username>
      </outgoingServer>
	  
      <documentation url="http://poczta.wp.pl/info-pomoc-konfig.html?action=more&amp;id=157">
         <descr lang="pl">konfiguracja programów pocztowych (Mozilla Thunderbird)</descr>
      </documentation>
    </emailProvider>
</clientConfig>
