indexFile="~/Documents/index.html"
backgroundImage="~/Firefox_wallpaper.jpeg"
logFile="~/Documents/easwer/changeWallpaper.log"
wget --output-document=$indexFile https://bing.com
d=$(date +%Y-%m-%d -d yesterday)
if [ -e $backgroundImage ]; then
	cp -n $backgroundImage ~/Documents/Wallpapers/$d.jpeg
	chmod 777 ~/Documents/Wallpapers/$d.jpeg
fi
if [ -e "$indexFile" ]; then	
	sed -i -e ':a;N;$!ba' -e  's|<!doctype html>.*og:image" content="https://www.bing.com/th?id=|https://bing.com/th?id=|' $indexFile
	sed -i -e ':a;N;$!ba' -e  's|jpg.*|jpg|' $indexFile
	imageLink=$(head -n 1 $indexFile)
	wget --output-document=$backgroundImage $imageLink

	#For gnome-2.x
	#gconftool-2 --type=string --set /desktop/gnome/background/picture_filename $backgroundImage
	
	#For gnome-3.x
	gsettings set org.gnome.desktop.background picture-uri $backgroundImage

	echo "`date +%Y-%m-%d:%H:%M:%S`: Wallpaper changed Successfully" >> $logFile
else
	echo "`date +%Y-%m-%d:%H:%M:%S`: Failed to change wallpaper." >> $logFile
fi
rm -rf "$indexFile"
