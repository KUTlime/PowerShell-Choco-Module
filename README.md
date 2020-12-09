# Choco

> A PowerShell module for a simple Chocolatey installation for end users.

## Features

- Wraps the Chocolatey default installation
- Checks admin privileges
- Handle admin privileges request
- Handle TLS install requirements
- Handle environmental variable update

## Use

You have to enable module installation by setting execution policy `ByPass`. The easiest way is to execute

```powershell
Start-Process -FilePath powershell -ArgumentList "-ExecutionPolicy ByPass"
```
and you can type following in this new PowerShell console window

```powershell
Install-Module Choco; ich
```

or for clarity

```powershell
Install-Module Choco; Install-Choco
```

or with module cleanup

```powershell
Install-Module Choco; Install-Choco; Uninstall-Module Choco
```

## FAQ

### Do I need admin privileges to install Choco?

Yes.

### Can I uninstall module after Chocolatey installation?

Yes. Chocolatey remains deployed in your system after you uninstall this module.
