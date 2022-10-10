## Installation For Windows Version PowerShell
- Create file `Microsoft_PowerShell_profile.ps1` at `C:\Users\user\Documents\PowerShell`
- With value
  ```powershell
  . $env:USERPROFILE\.config\powershell\user_profile.ps1
  ```
- Tools to be install 
  1. `Install-Module -Name z -Force`
  2. `Install-Module -Name PSFzf -Scope CurrentUser -Force`
  3. `Install-Module posh-git -Scope CurrentUser -Force`
  4. `Install-Module oh-my-posh -Scope CurrentUser -Force`
  5. `Install-Module -Name Terminal-Icons -Repository PSGallery -Force`
  6. `Install-Module -Name PSReadLine -AllowPreRelease -Scope CurrentUser -Force -SkipPublisherCheck`