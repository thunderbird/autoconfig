# ISPDB - Generic database of mail server configuration

It contains the server names and configuation for almost all large ISPs in the world. Most ISPs with a user base of more than 0.1% are included here.

Be sure to read the docs below before changing anything:
* [Autoconfig mechanism documentation](https://developer.mozilla.org/en/Thunderbird/Autoconfiguration), including file format definition and explanations.
* [How to configure your domain](https://developer.mozilla.org/en-US/docs/Mozilla/Thunderbird/Autoconfiguration#Configuration_server_at_ISP) without being added to the ISPDB here. This is useful for small ISPs and domains that are not open to the public.
* [Original project page - for reference](https://wiki.mozilla.org/Thunderbird:Autoconfiguration)

This ISPDB was created and is maintained by Ben Bucksch.

There are two main branches: `master` and `prod`. The [production server](https://autoconfig.thunderbird.net/autoconfig/v1.1/) will update when the `prod` branch is pushed. Any changes to that branch will automatically go live without further verification and affect the new account settings of all TB3 users, so be careful. The [stage server](https://autoconfig-stage.thunderbird.net/autoconfig/v1.1/) will update when the `master` branch is pushed.
