DIR="/home/$USER/.oh-my-zsh/"

if [ -d "$DIR" ]; then
	echo "Installing..."
	cp ./themes/* $DIR"themes"
	echo "Installation success"
else
	echo "Please Install oh-my-zsh first. If you have installed it, but this installation still fails, then .oh-my-zsh directory isn't set correctly"
fi
