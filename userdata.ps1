<powershell>
#Needed to allow WinRM 
#Enable-PSRemoting -Force
#winrm set winrm/config/service '@{AllowUnencrypted="true"}'
#winrm set winrm/config/service/auth '@{Basic="true"}' <----- PROBLEM CHILD
#https://pubs.vmware.com/orchestrator-plugins/index.jsp?topic=%2Fcom.vmware.using.powershell.plugin.doc_10%2FGUID-D4ACA4EF-D018-448A-866A-DECDDA5CC3C1.html

$BootstrapUrl = "https://raw.githubusercontent.com/plus3it/watchmaker/master/docs/files/bootstrap/watchmaker-bootstrap.ps1"
$PythonUrl = "https://www.python.org/ftp/python/3.6.3/python-3.6.3-amd64.exe"
$PypiUrl = "https://pypi.org/simple"

# Download bootstrap file
$BootstrapFile = "${Env:Temp}\$(${BootstrapUrl}.split('/')[-1])"
(New-Object System.Net.WebClient).DownloadFile("$BootstrapUrl", "$BootstrapFile")

# Install python
& "$BootstrapFile" -PythonUrl "$PythonUrl" -Verbose -ErrorAction Stop

# Install watchmaker
pip install --index-url="$PypiUrl" --upgrade pip setuptools watchmaker

# Run watchmaker
watchmaker -n --log-level debug --log-dir=C:\Watchmaker\Logs
</powershell>