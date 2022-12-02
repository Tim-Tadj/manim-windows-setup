# INSTALLATION

You may have to set the execution policy of the powershell scripts to allow them to run because windows sometimes prevents users from running powershell scripts as untrusted scripts can be dangerous.

To allow the instance of the powershell terminal to run powershell scripts run:
```terminal
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

To allow the user to run powershell scripts run:

```terminal
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```
If these commands dont work this means your domain administrator is using the "Turn on Script Execution" group policy, you will not be able to change your execution policy at all. And you will need admin privlages to change the execution policy.

## Running Installation scripts

1. Open powershell and navigate to folder containing the installation scripts (files ending with .ps1)

2. Install dependancies (ffmpeg) if not already installed
```terminal
.\1-install-deps.ps1
```
    NOTE: make sure VScode has reloaded powershell by running 'Debug: restart' in the vscode command pallete

3. Install manim environment
    ```terminal
    .\2-install-manim.ps1
    ```

4. Initialise a new project

    Make sure you are now in the manim environment you created in step 3 and the create-new-proj.ps1 script has been copied to this location.
    ```terminal
    .\create-new-proj.ps1
    ```
    You will be prompted for parameters during setup, use a frame rate of 60 and a resolution of 1080p all other parameters can be default (press ENTER for those).

5. Open your manim projects folder with VScode
    ```terminal
    code .
    ```
