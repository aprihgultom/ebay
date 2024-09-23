# ebay
SEIT Written Test 2024 Cermati <br><br>

<li> HOW TO SET UP ENVIRONMENT </li><br>

SETUP ROBOT FRAMEWORK ON WINDOWS
1. Download and Install IDE Software <br>
   PYCHARM https://www.jetbrains.com/pycharm/download <br>
   OR <br>
   VISUAL STUDIO CODE https://visualstudio.microsoft.com/downloads/
   
2. Download and Install Python
   https://www.python.org/downloads/

3. Add Environment Variable <br>
   Open Environment Variables <br>
   Add New Directory this in PATH <br>

   C:\Users\<username>\AppData\Local\Programs\Python\<Python Version>\ <br>
   C:\Users\<username>\AppData\Local\Programs\Python\<Python Version>\Scripts\ <br>

4. Install Robot Framework On Terminal or Command Prompt <br>
   pip install robotframework <br>
   pip install robotframework-seleniumlibrary <br>
   pip install robotframework-tidy <br>
   pip install robotframework-jsonlibrary <br>
   pip install robotframework-requests <br><br>

SETUP ROBOT FRAMEWORK ON MAC OS
1. Download and Install IDE Software <br>
   PYCHARM https://www.jetbrains.com/pycharm/download <br>
   OR <br>
   VISUAL STUDIO CODE https://visualstudio.microsoft.com/downloads/

2. Download and Install Chrome Driver <br>
   https://chromedriver.chromium.org/downloads <br>
   #Set Directory Chromedriver for Environment Variable <br>
   Copy and Paste ChromeDriver File to Documents <br>
   
4. Download and Install Python <br>
   https://www.python.org/ftp/python/3.10.10/python-3.10.10-macos11.pkg 

5. Install Robot Framework On Terminal <br>
   pip3 install robotframework <br>
   pip3 install robotframework-seleniumlibrary <br>
   pip3 install robotframework-tidy <br>
   pip3 install robotframework-jsonlibrary <br>
   pip3 install robotframework-requests <br>

6. Add Environment Variable On Bash Profile Terminal <br>
   #open bash_profile <br>
   open ~/.bash_profile <br>

   #Add New Path Phyton <br>
   /System/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH} <br>
   /Users/{UserName}/Library/Python/3.8/bin:${PATH} <br>
   /Library/Python/3.8/site-package:${PATH} <br>

   #Add New Path ChromeDriver <br>
   PATH=/Users/{UserName}/Documents/Browser:$PATH <br><br><br>


<li> HOW TO RUNNING TEST SCRIPT </li><br>
  1. Open Project <br>
     Open File Project <br>
     https://drive.google.com/file/d/1mMXDZzdsxwTxKQvLEVe0qBS69UfSG6Nn/view?usp=sharing <br>
     or Clone Project in IDE https://github.com/aprihgultom/ebay.git <br><br>
  2. Open Terminal IDE <br>
     robot -v browser:gc -d results -i regression test/Product.robot <br><br>


<li> OPEN RESULT TEST SCRIPT </li><br>
     Go To Directory results <br>
     Open file log.html or report.html in browser <br>
