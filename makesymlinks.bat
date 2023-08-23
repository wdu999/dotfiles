::
::
::

set bin_path=%userprofile%\dotfiles\bin_win

echo ;%PATH; | find /C /I ";%%bin_path%%;" > nul
if %ERRORLEVEL% NEQ 0 setx PATH "%PATH%;%%bin_path%%"

del %appdata%\local\nvim
mklink -d %appdata%\local\nvim %userprofile%\dotfiles\nvim
