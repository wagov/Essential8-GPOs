# Essential 8 Group Policy Templates 

These Group Policy Objects (GPOs) were created to accelerate organisations implementing the [Australian Cyber Security Centre's (ACSC) Essential 8 Controls](https://www.cyber.gov.au/acsc/view-all-content/publications/essential-eight-maturity-model). The GPOs can be imported into an Active Directory Domain Services (AD) environment for testing and deployment. The current package include GPOs to assist organisations comply with Essential 8 (E8) Maturity Level 1 for 'Configure Microsoft Office macro settings' and 'User application hardening'  based on the Maturity requirements as of January 2023.  

This package includes:
* Configure Microsoft Office macro settings (Maturity Level 1)
  * Microsoft Office macros are disabled for users that do not have a demonstrated business requirement.
  * Microsoft Office macros in files originating from the internet are blocked.
  * Microsoft Office macro antivirus scanning is enabled.
  * Microsoft Office macro security settings cannot be changed by users.
* User application hardening (Maturity Level 1)
  * Web browsers do not process Java from the internet. 
  * Web browsers do not process web advertisements from the internet.
  * Internet Explorer 11 does not process content from the internet.
  * Web browser security settings cannot be changed by users.


## Requirements
These policies were developed using an AD Joined Windows Server 2019 Server and the GPO settings were deployed and tested against Windows 10 workstations.  The following items are pre-requisites to import the E8 GPOs into Active Directory:

1. Group Policy ADMX templates to configure Group Policy Settings.
	  * [Google Chrome Policy Templates](https://chromeenterprise.google/browser/download/#manage-policies-tab)
	  * [Microsoft Edge Policy Templates](https://www.microsoft.com/en-us/edge/business/download?form=MA13FJ)
	  * [Microsoft Windows 10 Policy Templates](https://www.microsoft.com/en-us/download/details.aspx?id=104677)
	  * [Mozilla Firefox Policy Templates](https://github.com/mozilla/policy-templates)
	  * [Microsoft Office 365 Policy Templates](https://www.microsoft.com/en-us/download/details.aspx?id=49030)

2. A Domain Administrator to be able to import the new Group Policy Objects

3. Group Policy Management Module
 	- If running from a Windows 10 Machine, install the feature by running the below command in an administrative Powershell console:
 	`Add-WindowsCapability -Online -Name Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0`

## How to import the policies
1. Download the repository zip file from this repository and extract to a machine that will used to import the Group Policy Objects.

2. Open an Administrative PowerShell console and navigate to the scripts folder.

3. Import E8 GPOs
	- Run the PowerShell script and enter Menu items to either import individual GPOs or all at once.
   	`./Import-Essential8TemplateGPOs.ps1`

## How to Apply GPOs
Once the GPOs have been imported into Active Directory, they can be linked to an Organizational Unit (OU). Please note the Scope of the GPOs which will apply settings to either users or computers.


# Package Contents
## Group Policy Objects
There are 10 Group Policy Objects and a script used to import the GPOs.

### Configure Microsoft Office macro settings (3 GPOs)

1. **E8 Template - Configure MS Office Macro Settings - All**

	**Scope:** User <BR>This GPO contains settings to meet the Maturity Level 1 requirements for Microsoft Office Macros with the default action of **Disable (Macros) without notification**.  Organisations that have "demonstrated business requirement" should consider targetting this GPO (through approriate ACL) for users that do not have business requirements for using office macros, then create a duplicate/copy of this policy adjusting as required to meet business requirements.  <BR><BR></BROrganisations>Organisations are also encouraged to follow additional Microsoft Office Hardening guidance as per [ACSC: Hardening Microsoft 365, Office 2021, Office 2019 and Office 2016](https://www.cyber.gov.au/acsc/view-all-content/publications/hardening-microsoft-365-office-2021-office-2019-and-office-2016) or via [Microsoft Security Compliance Toolkit 1.0](https://www.microsoft.com/en-us/download/details.aspx?id=55319)

2. **E8 Template - Configure MS Office Macro Settings - AV Scanning**

	**Scope:** User<BR>This GPO contains settings to meet the Maturity Level 1 requirements for Microsoft Office Macros antivirus scanning to be enabled.  The setting enforces the Office Client to integrate with the Antimalware Scan Interface (AMSI), enabling antivirus and other security solutions to scan macros and other scripts at runtime to check for malicious behavior.  For more information refer to [Microsoft Security Article: Office VBA + AMSI: Parting the veil on malicious macros](https://www.microsoft.com/en-us/security/blog/2018/09/12/office-vba-amsi-parting-the-veil-on-malicious-macros/)

3. **E8 Template - Configure MS Office Macro Settings - From Internet Blocked**

	**Scope:** User<BR>This GPO contains settings to meet the Maturity Level 1 requirements for blocking of Microsoft Office Macros originating from the internet.  

### User application hardening (7 GPOs)

1. **E8 Template - User Application Hardening - Block Browser Advertising**

	**Scope:** Machine<BR>This GPO configures the built-in browser capability to block Advertisements and is intended to be complimented with other controls to limit advertisements such as:
	  * Gateway or Proxy Filtering
	  * DNS Filtering
	  * Endpoint Solutions
	  * Browser based third-party add-ons such as uBlock or Ad Block plus.  

2. **E8 Template - User Application Hardening - Block Browser Advertising Strict**

	**Scope:** Machine<BR>This GPO configures the built-in browser capability to block Advertisements with Strict Tracking Blocked within Microsoft Edge.  Strict tracking prevention has been found to be highly effective for Microsoft Edge blocking Advertising, however may impact the experience of some websites.  This GPO is intended to be  complimented with other controls to limit advertisements such as:
	  * Gateway or Proxy Filtering
	  * DNS Filtering
	  * Endpoint Solutions
	  * Browser based third-party add-ons such as uBlock or Ad Block plus.  

3. **E8 Template - User Application Hardening - Browser Security Settings**

	**Scope:** Machine<BR>This GPO has been configured with a combination of User Application Hardening Settings based on the recommendations from the following Sources:
	  * ACSC Hardening Microsoft Windows Version 21H1 Workstations
	  * Microsoft Security Compliance Toolkit Edge v107 Security Baseline

   Organisations are recommended to assess their business requirements and implement the enforcement (or the hardening) of additional web browser settings to mitigate several risks during user activities online.  By enforcing a subset of security options, this ensures that baseline security can be determined by the organisation and not allow users to potentially expose the organisation to risks because of adjusting these options.  Some of the key categories that should be included in this assessment are:
    * Windows Internet Options:
        * Security and Zone Assignments
        * Password Manager/Autofill
        * Advanced Security Settings
    * Modern Browser Configuration (Edge/Google Chrome)
        * Configure update behaviour	
        * Security Features (e.g. SSL/TLS, authentication, )
        * Manage Add-ons or Plugins

    Additional security guidance for browser hardening can be found within [Microsoft Security Compliance Toolkit 1.0](https://www.microsoft.com/en-us/download/details.aspx?id=55319) or similar security benchmarks (e.g. CIS)

4. **E8 Template - User Application Hardening - IE11 Disabled**

	**Scope:** Machine<BR>This GPO contains settings to disable the use of Internet Explorer 11 as a standalone browser, disabling IE Integration with Microsoft Edge.

5. **E8 Template - User Application Hardening - IE11 Disabled with IE Mode**

	**Scope:** Machine<BR>This GPO contains settings to disable the use of Internet Explorer 11 as a standalone browser and redirect to Edge. Configured legacy IE11 websites will run in Edge IEMode.
	>**Additional Configuration Required:** Organisations implementing IEMode need to:

    * Generate a sitelist.xml using [Microsoft Enterprise Mode Ste List Manager](https://www.microsoft.com/en-us/download/details.aspx?id=49974)
    * Store this file in an accessible HTTPS/Local Network Location/File Location that the user/client computer can reach
    * Configure the following custom GPO setting:
`Microsoft Edge\Configure the Enterprise Mode Site List`

6. **E8 Template - User Application Hardening - Java Disabled**

	**Scope: **Machine<BR>This GPO contains settings to disable the processing of Java in the web browser and lock down java security settings.  This is useful where the endpoint has the Java Runtime installed, but does not require it to access the internet
    
	>**Additional Configuration Required:** Organisations disabling Java will need to:

    * Copy Java Hardening files from (templates/Java/NoBrowser) to a network location accessible from endpoints
    * configure the following custom GPO setting:
    `Preferences\Files|Folders`

7. **E8 Template - User Application Hardening - Java Hardened**

	**Scope:** Machine<BR>This GPO contains settings to harden the Java configuration, and enable access to websites added to the Exception Site List (as per business requirements).
  
	>**Additional Configuration Required:** Organisations hardening the Java configuration will need to:
	
   * Copy Java Hardening files from (templates/Java/Hardened) to a network location accessible from endpoints
   * Configure the following custom GPO setting:
     `Preferences\Files|Folders`
   * configure the exception.sites (one URL per line)
   * Microsoft Edge\Disable download file type extension-based warnings for specified file types on domains (should include sites listed in the exception.sites)
   * Microsoft Edge\List of file types that should be automatically opened
   * Google\Google Chrome\Disable download file type extension-based warnings for specified file types on domains (should include sites listed in the exception.sites)
   * Google\Google Chrome\List of file types that should be automatically

	> **Please Note:** Where organisations require the usage of the Java Plug-in (ActiveX), this policy can be utilised along side the E8 IE11 Disabled GPO and IEMode within Microsoft Edge.

## Files
1. [GPOs](GPOs)
This folder contains backups of the E8 Group Policy Objects used by the import script.

3. [scripts](Scripts/Import-Essential8TemplateGPOs.ps1)
This PowerShell script is used to import the E8 GPOs individually or all GPOs into Active Directory.
		
4. [templates](templates/)
The templates folder include sample configuration files used for the "E8 Template - User Application Hardening - IE11 Disabled with IE Mode", "E8 Template - User Application Hardening - Java Disabled" and "E8 Template - User Application Hardening - Java Hardened" GPOs which require additional configuration by the organisation.

# Additional Notes
For additional technical reference, please see the following links used.
* [Chrome Enterprise policy list](https://chromeenterprise.google/policies)
* [Edge - Enterprise Site List Manager in Microsoft Edge](https://docs.microsoft.com/en-us/deployedge/edge-ie-mode-site-list-manager)
* [Edge - Microsoft Edge Policies](https://docs.microsoft.com/en-us/deployedge/microsoft-edge-policies)
* [Java - Deployment Configuration File and Properties](https://docs.oracle.com/javase/8/docs/technotes/guides/deploy/properties.html)

# Bugs, Issues and Feature Requests
Please report all bugs, issues and feature requests in the [issue tracker](https://github.com/wagov/Essential8-GPOs/issues)

# WA Government Support
For any inquires or problems within this package, please contact [cyber.policy@dpc.wa.gov.au](mailto:cyber.policy@dpc.wa.gov.au)

DGov would appreciate your feedback, comments, and details of any errors you encounter while running this Hardening Package
