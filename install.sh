DIR="/home/$USER/.oh-my-zsh/"

if [ -d "$DIR" ]; then
	echo "Installing..."
	cp ./themes/* $DIR"themes"
	echo "Installation success"
	read -r p "For best experience, do you want to install Powerline fonts? [Y/n]" response
	if [[ "$response" =~ ^([yY])$ ]]; then
			echo "Cloning into powerline fonts..."
			git clone https://github.com/powerline/fonts /tmp/powerline-fonts
			echo "Installing fonts..."
			/tmp/powerline-fonts/install.sh
			echo "Install done. For the best experience, it is recommended to use Inconsolata for powerline font. Thanks for installing!"
	else
		echo "Exitting..."

else
	echo "Please Install oh-my-zsh first. If you have installed it, but this installation still fails, then .oh-my-zsh directory isn't set correctly"
fi
