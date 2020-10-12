# Choco

> A PowerShell module for a simple Chocolatey installation for end users.

## Features

- Wraps the Chocolatey default installation
- Checks admin privileges
- Handle admin privileges request
- Handle TLS install requirements
- Handle environmental variable update

## Use

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
