# Amazon Machine Image
**An Image that Amazon uses to create instances with dependencies installed on them**
- Used when we want dependencies already pre installed and to make the app with user data to load even quicker

## How to create an AMI
1. On the existing instance, click into it and go to the`Actions` dropdown
2. `Actions > Images and Templates > Create Image`
3. `Name` = appropriately name with version of app maybe
4. Configure with usual settings
5. `Advanced` = In the User Data section, add the bit of code that is needed when creating instance with little bit of user data
6. Launch Instance and use the public ip address to see the app

## How to delete an AMI
1. Navigate to the AMI
2. `Actions > deregister AMI` = this is to delete the AMI
3. It will pop up with a warning that before de-registering, the associated snapshot needs to be removed -> follow the snapshot link
4. Keep this window open
5. Go back to the AMI and then deregister it first
6. Delete the associated snapshot
