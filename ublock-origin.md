# Deploying uBlock Origin using ADMX

The below guidance details using ADMX templates to enforce installing and maintaining an up to date [uBlock Origin](https://ublockorigin.com) extension for end users web browsers.

## 1. Install Group Policy templates

-   [Edge](https://www.microsoft.com/en-us/edge/business/download): Select version and click "Get Policy Files"
-   [Chrome](https://support.google.com/chrome/a/answer/187202?hl=en#zippy=%2Cwindows)
-   [Firefox](https://support.mozilla.org/en-US/kb/customizing-firefox-using-group-policy-windows)

## 2. Deploying uBlock Origin to Microsoft Edge

In **Group Policy Management**, go here:\
**Computer > Policies > Administrative Templates > Microsoft Edge > Extensions > Configured force-installed**

In **Group Policy Management**, go here:\
**Computer > Policies > Administrative Templates > Google > Google Chrome > Extensions > Configured force-installed**

Click the "Show" button to be presented with a list you can enter. This is the format:

`<extension ID>;<HTTPS download source>`

For **uBlock Origin** enter this on a line: `cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx`

## 3. Chrome safety settings

These will enforce best-practices safety for your users:

In **Group Policy Management**, go here:
Computer > Policies > Administrative Templates > Google > Google Chrome

-   Allow users to opt in to Safe Browsing extended reporting: Enabled
-   Disable proceeding from the Safe Browsing warning page: Enabled
-   Enable reporting of usage and crash-related data: Enabled
-   Enable Safe Browsing: Enabled

## 4. Disable Chrome Remote Desktop

In **Group Policy Management**, go here:\
**Computer > Policies > Administrative Templates > Google > Google Chrome > Extensions > Configured extension blacklist** and add `gbchcmhmhahfdphkhkmpfmihenigjmpp`

In **Group Policy Management**, go here:\
**Computer > Policies > Administrative Templates > Google > Google Chrome > Configure remote access options**

-   Enable or disable PIN-less authentication for remote access hosts: Disable
-   Enable firewall traversal from remote access hosts: Disabled
-   Enable curtaining of remote access hosts: Disabled