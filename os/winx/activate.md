Using KMS Manually to Activate Software
This article applies to: Software Licensing

This page describes how to manually activate products. With this method, you'll need to run commands on each machine - and for each software package - during the 30 day grace period after installation. If you are using virtual machines for testing and cross-compatibility on Macintosh computers, you'll need to use the manual method in those circumstances.

KMS activation can be blocked by a firewall. Please be sure that any firewalls between the client machine and the KMS server are open to incoming and outgoing traffic on TCP port 1688.

To use this method, first install the software (Windows or Microsoft Office). As part of that process you'll be informed that you have 30 days to activate the product. Complete the steps below during that 30-day period.

This method assumes that Windows or Office has never been activated on this machine before. If your machine had previously been activated with the earlier MAK activation method, please instead follow the instructions to switch from MAK to KMS activation.

# -- Activate a Windows Operating System (All Supported Versions)
CD \Windows\System32
and press Enter.
Type the following command:
cscript slmgr.vbs /skms kms01.cit.cornell.edu
and press Enter.
(Note: The url in the command above begins with kay-emm-ess-zero-one.)
Type the following command:
cscript slmgr.vbs /ato
and press Enter.
Close the Command Prompt window.
And you're done for that installation of Windows on that computer.

# -- Activate Desktop Edition of Microsoft Office 2016
Back to TopThese instructions only apply to the Desktop (Volume-Licensed) Edition of Microsoft Office, which is distributed as a disk image via CU Software Licensing. The Office 365 edition of Office (downloaded from Microsoft) does not use KMS activation. Please DO NOT attempt to follow these instructions if you have the Office 365 edition.

CD \Program Files\Microsoft Office\Office16
then press Enter.

This assumes you installed Office in the default location.
Note: If you installed the 32-bit version of Office on a 64-bit system, use this command instead:
CD \Program Files (x86)\Microsoft Office\Office16

cscript ospp.vbs /sethst:kms01.cit.cornell.edu
then press Enter.  (Note: The url in the command above begins with kay-emm-ess-zero-one.)

cscript ospp.vbs /act
then press Enter.

Close the command prompt window.
And you're done for that installation of Office on that computer.
