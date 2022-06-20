# How to integrate web3signer with Azure.


## Step 1. Create Key vaults
Goto : https://portal.azure.com/?quickstart=true#create/Microsoft.KeyVault
![image](https://user-images.githubusercontent.com/83507970/174634714-88926e90-902e-4a06-9197-a8742026b43b.png)

Resource group > Create new
Instance details
Key vault name > Connextrouter
Region > Choose Your Location
Pricing tier > Standard

![image](https://user-images.githubusercontent.com/83507970/174635171-931a4530-91d8-44ba-936a-fd0d7a7184df.png)
Click 

![image](https://user-images.githubusercontent.com/83507970/174635787-aa1d3ef6-97a8-4990-a6d5-72c37b30fefa.png)
Click 


![image](https://user-images.githubusercontent.com/83507970/174635877-434916cc-d322-4854-bd5d-3c6d1536cc64.png)
Waiting to Create


![image](https://user-images.githubusercontent.com/83507970/174636166-58164766-c21f-4098-afb0-608908528885.png)

![image](https://user-images.githubusercontent.com/83507970/174639174-807d3369-c33a-46ca-9c94-229798bbe887.png)

![image](https://user-images.githubusercontent.com/83507970/174639633-f6201533-3949-4a70-af15-c300ce4333a3.png)
![image](https://user-images.githubusercontent.com/83507970/174642822-effd8b56-2757-4f8d-8c7c-93b052fce64f.png)

![image](https://user-images.githubusercontent.com/83507970/174640995-64961e54-dd98-4f44-ba29-9bfeab90b332.png)
Value = Your Private Key
![image](https://user-images.githubusercontent.com/83507970/174642283-13a8ddfc-7ac6-4ff2-9388-1ae514d608e3.png)


![image](https://user-images.githubusercontent.com/83507970/174642445-efb15bc4-673e-44af-bfb3-6521c33eafd3.png)




---


Go to Azure Active Directory | App registrations

https://portal.azure.com/?quickstart=true#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/RegisteredApps

![image](https://user-images.githubusercontent.com/83507970/174638715-07b7be71-680f-4a50-891d-a216928ed894.png)


![image](https://user-images.githubusercontent.com/83507970/174638851-e34e063c-3be1-462d-8687-33cb7fd6f5f6.png)

![image](https://user-images.githubusercontent.com/83507970/174639711-f7b1c62a-054f-4ba3-9c9d-585a1dffc856.png)

![image](https://user-images.githubusercontent.com/83507970/174640040-eba329f1-a76a-40d5-8123-87fa48de0a22.png)

![image](https://user-images.githubusercontent.com/83507970/174640251-d0d42cc5-edbc-41b7-a974-47831671627a.png)

![image](https://user-images.githubusercontent.com/83507970/174640379-957c7519-44bd-4679-8e1f-e4cd81e99cce.png)




type: "azure-secret"
keyType: "SECP256K1"
authenticationMode: "CLIENT_SECRET"
clientId: "f165107a-3659-4ee2-947b-ca5c16db4ebe"
tenantId: "f8e9720c-00e8-4188-bdc6-683f8496cb89"
vaultName: "connextrouter"
secretName: "Connex-Privatekey"


![image](https://user-images.githubusercontent.com/83507970/174643573-5da5822f-c0b0-4c67-8aef-3b36ffcfc0ee.png)
![image](https://user-images.githubusercontent.com/83507970/174643658-5ec952f1-91e9-4bcc-b0a8-ea880b3ffa6c.png)
![image](https://user-images.githubusercontent.com/83507970/174643929-a34d3eed-2cfb-47c0-84ce-58464e787438.png)
![image](https://user-images.githubusercontent.com/83507970/174644122-ad23e2ad-febc-4a1c-a155-d2891fee9d94.png)





