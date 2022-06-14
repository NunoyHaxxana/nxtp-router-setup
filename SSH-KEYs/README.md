# How To Set Up SSH Keys on windows & google cloud

## Step 1: Verify if OpenSSH Client is Installed
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


---


## Step 2: Open Command Prompt
1. Press the Windows key.
2. Type cmd.
3. Under Best Match, right-click Command Prompt.
4. Click Run as Administrator.
5. If prompted, click Yes in the Do you want to allow this app to make changes to your device? pop-up.
![image](https://user-images.githubusercontent.com/83507970/173232072-32e380e4-1e8e-4719-b949-6428fb219a41.png)




6. on command prompt, type in ```ssh-keygen``` and enter.
7. Please enter for a passphrase - just hit enter again, to skip this step.
8. SSH-Key generate to ```%UserProfile%```. You should see two files: the private key id_rsa, and the public key id_rsa.pub. 
![image](https://user-images.githubusercontent.com/83507970/173617910-c3ea8c7a-05c1-4e5e-8f18-52dc1c1a42da.png)


---

## Step 3: Setup ssh-key on Google Could
1. Goto https://console.cloud.google.com/compute/instances? and Clink on your server name.

![image](https://user-images.githubusercontent.com/83507970/173616322-6d1b6371-4254-438f-a08f-2b2985f0334f.png)

2. Clink on Edit.

![image](https://user-images.githubusercontent.com/83507970/173616446-231a55a9-57ee-4c6d-8df9-f9e17aad4ae9.png)

3. Go to SSH Keys. and click add. 

![image](https://user-images.githubusercontent.com/83507970/173616639-d5acb5ed-18dc-4456-a8a5-1fca7230fa4e.png)

4. Open your keys with text program and copy paste on Box.

![image](https://user-images.githubusercontent.com/83507970/173616791-6abff5db-bc18-4c58-a9af-72cd6ed1f49f.png)

5. Save

![image](https://user-images.githubusercontent.com/83507970/173616954-d10d5f02-8ad7-43a7-a46c-a48845757f20.png)

---


## Step 4: Setup ssh-key on remote program.
1. Setup ssh authen type with Plubickey

![image](https://user-images.githubusercontent.com/83507970/173620571-0616d840-1a30-4e00-bd8a-40be74ac21a6.png)



---
## Complete setup, your can access server with your Plubickey
