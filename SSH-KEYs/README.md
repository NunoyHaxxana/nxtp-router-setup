How To Set Up SSH Keys on windows & google cloud

Step 1: Verify if OpenSSH Client is Installed
First, check to see if you have the OpenSSH client installed:
1. Open the Settings panel, then click Apps.
2. Under the Apps and Features heading, click Optional Features.
![image](https://user-images.githubusercontent.com/83507970/173232672-ff3922d3-9932-4575-8941-1806e49c23fa.png)

![image](https://user-images.githubusercontent.com/83507970/173232733-98805781-b528-4a9d-8b5e-48c5ea100633.png)


3. Scroll down the list to see if OpenSSH Client is listed.

If it’s not, click the Add a feature. and type ssh.
Scroll through the list to find and select OpenSSH Client.
Finally, click Install.

![image](https://user-images.githubusercontent.com/83507970/173232871-de51ad79-f8c0-4a3f-95e9-0002b0e8996c.png)

![image](https://user-images.githubusercontent.com/83507970/173232896-93d66ec7-75e2-4c6d-b930-abe831e75bcd.png)




Step 2: Open Command Prompt
1. Press the Windows key.
2. Type cmd.
3. Under Best Match, right-click Command Prompt.
4. Click Run as Administrator.
5. If prompted, click Yes in the Do you want to allow this app to make changes to your device? pop-up.
![image](https://user-images.githubusercontent.com/83507970/173232072-32e380e4-1e8e-4719-b949-6428fb219a41.png)




6. on command prompt, type in ```ssh-keygen -t rsa -b 4096``` and enter.
7. Please enter for a passphrase - just hit enter again, to skip this step.
8. SSH-Key generate to ```%UserProfile%```. You should see two files: the private key id_rsa, and the public key id_rsa.pub. 
![image](https://user-images.githubusercontent.com/83507970/173614949-720ae9cf-08c1-4229-85be-a079ba7355b9.png)



