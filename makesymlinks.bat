::
::
::

set bin_path=%userprofile%\dotfiles\bins_win

path|find /i "%bin_path%" > nul || setx PATH "%PATH%;%bin_path%;"

:: del will delete all the files in source folder
:: rmdir only delete the symbolic link
rmdir %userprofile%\AppData\local\nvim
mklink /d %userprofile%\AppData\local\nvim %userprofile%\dotfiles\nvim
