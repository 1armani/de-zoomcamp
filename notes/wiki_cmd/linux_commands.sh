# psql locations
/System/Volumes/Data/opt/homebrew/Cellar/postgresql@15/15.2_3/bin/psql
/System/Volumes/Data/opt/homebrew/Cellar/libpq/15.2/bin/psql
/opt/homebrew/Cellar/postgresql@15/15.2_3/bin/psql
/opt/homebrew/Cellar/libpq/15.2/bin/psql

# search for text in files: (add -l flag to search in filenames)
grep -ir --include=f*.log "IMG_20220508_181717.jpg" .


# awk
 ll | awk ' /photo_2023-03-10_00-17-44.jpg/  {print NR, $0}' | awk '{print $10}'
 ll -ltra | awk 'NR > 8419 && total < 9000000000 { print NR, $0; total += $5 }; END { print "total size: ",total }'
 #NR - row number
 #$1..$2.. - respective column
 #NF - last column

#count # of rows
wc -l

#######
# vim #
#######
	# go to line number
	Enter => type in the number => Shift+g
	# show line numbers
	:set number

	# highlight the syntax
	:syntax on


#vscode
# select all the appearenses
ctrl+shift+L

symlink
ln -s <path to file/dir> [<name of the link>]
ln -s /homebrew/template  #create link to template dir in current directory


whatis 
whereis
finger - utility to insect other users


cmp - comare 2 files
diff - 

find . -type f -empty  # find all empty dirs
find . -perm /a=x #find all executable files

netstat  # what ports are open on the machine
netstat -tulpn #short way.
ss # the same as netstat 

iptables 
ufw #shorter and simpler than iptables.
sudo ufw allow 80
sudo ufw enable  
sudo ufw status 

neofetch #pretty alter of uname -a
echo "1+5+7" | bc # bc calculates math

free #memory 

ps -aux 
top 
htop

pkill -f nameOfTheProcess.sh  #kill by the name of the process

sudo systemctl start apache2  # start the service
sudo systemctl status apache2  
sudo systemctl restart apache2  

sudo reboot
sudo shutdown -h now 

cal # calendar






### settings
echo "alias ll='ls -lGaf'" >> ~/.zshrc
echo "alias ll='ls -la'" >> ~/.bashrc

# instal to docker google:
	install vim
	install mc
	install wget




