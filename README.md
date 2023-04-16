# SimpleFaceitDemoScript

The script looks for your most recently downloaded dem.gz file, decompresses and moves it to your CSGO demo folder.

## Usage

Download your demo file from Faceit then subsequently run the tool as follows.

`.\faceitScript.ps1 -filename <demo filename>`

NB: Your dem.gz will be deleted.

## Considerations

#### CSGO Path Auto Finder

The tool will scan your registry looking for your default CSGO install path. If you have CSGO installed in a non-standard location the script will fail.
You can simply solve this by opening up the script in a text editor and look for these comments:

```
# The above may fail if your CSGO is located within a non-standard directory.
# Modify the $demoPath variable below to your CSGO install directory.
# Remove the hashtag as it denotes a comment!

# $demoPath = "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo"
```

By editing the following line:

`# $demoPath = "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo"`

to match your install path removing the `#` comment character.

`$demoPath = "<your install path">`

--------------------------------------------------

#### PowerShell error

If you haven't ran a PowerShell script before it is possible you will face this error.

```
<your path>/faceitScript.ps1 cannot be loaded
because running scripts is disabled on this system. For more information, see about_Execution_Policies at
https:/go.microsoft.com/fwlink/?LinkID=135170.
At line:1 char:1
+ .\faceitScript -filename "mydemo"
+ ~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
```

It is easy to solve.

- Run PowerShell as Administrator

- Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

- Run `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned`

- Type `Y`

[Source - Stack Overflow](https://stackoverflow.com/questions/64633727/how-to-fix-running-scripts-is-disabled-on-this-system#answers-header)