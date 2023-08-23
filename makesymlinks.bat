::
::
::

set bin_path=%userprofile%\dotfiles\bin_win
setx PATH "%PATH%;%%bin_path%%;"

del %userprofile%\AppData\local\nvim
mklink -d %userprofile%\AppData\local\nvim %userprofile%\dotfiles\nvim
