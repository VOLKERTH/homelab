### Install VSCode
sudo paru -s visual-studio-code-bin


## Do faster the boot
### Disable CachyOS boot animation
https://discuss.cachyos.org/t/logo-on-boot-screen/6519/5

sudo nano /etc/sdboot-manage.conf
#### In the the line where it starts with LINUX_OPTIONS, remove the word splash and the space behind it. Make sure not to remove any ".
sudo sdboot-manage gen
#### Take advantage of the restart to disable the brand's loading screen in BIOS.
reboot

## Alias in CachyOS ~/.config/fish/config.fish
alias act='/home/smunoz/scripts/update-and-changeboot.sh'
alias bls='/home/smunoz/scritps/bottles.sh'
alias act_discord='/home/smunoz/scripts/update_discord.sh'
alias act_vscode='paru -S visual-studio-code-bin'