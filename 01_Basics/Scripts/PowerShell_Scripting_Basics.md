````md
# PowerShell Scripting

## PowerShell ISE

Though we've mentioned it before, let's reiterate for clarity.

**Windows PowerShell ISE** (Integrated Scripting Environment) is an application that provides a graphical user interface (GUI) for PowerShell. It allows you to write, execute, test, and debug commands all within a single window.

---

## Writing Scripts with PowerShell

PowerShell scripts are text files that contain a series of commands and functions. They typically have a `.ps1` extension.

Scripts are used to automate tasks such as:

- **System management**
  - Creating user accounts
  - Formatting disks
  - Copying and deleting files
- **Network management**
  - Configuring network connections
  - Managing IP addresses
  - Accessing remote servers
- **Data processing**
  - Analyzing data
  - Generating reports
  - Interacting with databases
- **Software development**
  - Deploying applications
  - Test automation
  - Debugging

---

## Control Structures

### Variables

Variables are used to store and manipulate data in scripts.

```powershell
# Define a variable
$name = "John Doe"

# Assign a value to a variable
$age = 30

# Retrieve the value of a variable
$name

# Define multiple variables in a single line
$firstName, $lastName = "John", "Doe"
````

---

## Conditions

Conditions determine when a specific action should be performed.

### If-Else Structure

```powershell
if ($age -gt 18) {
    Write-Host "Adult"
} else {
    Write-Host "Kid"
}
```

### Switch-Case Structure

```powershell
$dayOfWeek = Get-Date -Format dddd

switch ($dayOfWeek) {
    "Monday"    { Write-Host "Today is Monday. Time to start the week!" }
    "Tuesday"   { Write-Host "Tuesday! Still a long way to go!" }
    "Wednesday" { Write-Host "It's Wednesday. Halfway through!" }
    "Thursday"  { Write-Host "Thursday! Almost there!" }
    "Friday"    { Write-Host "Friday! Time to celebrate the weekend!" }
    "Saturday"  { Write-Host "Saturday! Enjoy the weekend!" }
    "Sunday"    { Write-Host "Sunday! Last day before Monday!" }
    Default     { Write-Host "Invalid day of the week." }
}
```

---

## Loops

Loops allow you to repeat a block of code a certain number of times or until a condition is met.

### For Loop

```powershell
for ($i = 1; $i -le 10; $i++) {
    Write-Host $i
}
```

### While Loop

```powershell
$i = 1
while ($i -le 10) {
    Write-Host $i
    $i++
}
```

### Do-While Loop

```powershell
$i = 1
do {
    Write-Host $i
    $i++
} while ($i -le 10)
```

### Foreach Loop

```powershell
$names = "John", "Jane", "Doe"
foreach ($name in $names) {
    Write-Host $name
}
```

---

## Writing and Saving Scripts

1. Open **PowerShell ISE**
2. Write your commands
3. Save the file with a `.ps1` extension

---

## PowerShell Gallery

The **PowerShell Gallery** is a central repository for sharing and obtaining PowerShell scripts and modules. It contains code from Microsoft and the community.

> ⚠️ Be cautious when installing community-created content. Always verify accuracy and security.

---

## Searching for Modules

Example: Searching for the **SysInternals** module.

```powershell
Find-Module -Name "SysInternals"
```

Example output:

```text
Version    Name            Repository  Description
-------    ----            ----------  -----------
1.1.0      SysInternals    PSGallery   PowerShell cmdlets for SysInternal tools
```

If prompted to install **NuGet**, press **Enter** to proceed.

---

## Installing a Module

```powershell
Install-Module -Name SysInternals
```
