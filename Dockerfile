FROM stefanscherer/chocolatey

SHELL [ "powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';" ]

RUN choco install -y sql2016-clrtypes ; \
    iwr -uri https://download.microsoft.com/download/3/9/1/39135819-06B1-4A07-B9B0-02397E2F5D0F/EN/x64/DacFramework.msi -outfile C:\install.msi ; \
    msiexec /i C:\install.msi /l*vx C:\installation.log /quiet /qn /norestart

ENTRYPOINT [ "C:\\Program Files\\Microsoft SQL Server\\130\\DAC\\bin\\SqlPackage.exe" ]
