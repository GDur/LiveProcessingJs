LiveProcessingJsPlugin for Sublime
==============================

LiveProcessingJs means that you can write processing code in sublime and see the result instant on your browser while you type it.

This project has two parts. 
There is a SublimePlugin which creates a websocket connection between Sublime and the Second part which is a Website.
It will send the data of any .pde-file to this website and the website will interpret/compile it on the fly.

INSTALL IF NOT ALREADY INSTALLED:
- install latest version of python (recommended v2.7.3)
- install sublime
- install git
- install tortoise git

SETUP SUBLIME:
- start sublime
  - in sublime click through:  > Preferences > Browse Packages...
    - this will open the packages folder
      - in this folder right-click > Git Clone... > URL: https://github.com/GDur/LiveProcessingJs.git
        - click OK

EXAMPLE:
- start ...\Packages\LiveProcessingJs\ProcessingJsSocket\index.html with your browser
- start on of the .pde files in ...\Packages\LiveProcessingJs\examples\.. with SubLime!
  - in sublime click through:  > View > Syntax > Open all .......(at the top) > Java > Java
- change code in example.pde -> you should see the result of the code in your browser

That's it! HF!

byGDur

Thanks to Maun for the python code for the Server and the Plugin!