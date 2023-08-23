::
::
::

set bin_path=%userprofile%\dotfiles\bin_win
setx PATH "%PATH%;%%bin_path%%;"

:: del will delete all the files in source folder
:: rmdir only delete the symbolic link
rmdir %userprofile%\AppData\local\nvim
mklink /d %userprofile%\AppData\local\nvim %userprofile%\dotfiles\nvim
