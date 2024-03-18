#!/bin/bash

# langs=("tr" "pt" "de")
langs=("tr" "pt" "es")

if ! command -v xgettext &> /dev/null
then
	echo "xgettext could not be found."
	echo "you can install the package with 'apt install gettext' command on debian."
	exit
fi


echo "updating pot file"
xgettext -o po/pardus-xfce-tweaks.pot --files-from=po/files

for lang in ${langs[@]}; do
	if [[ -f po/$lang.po ]]; then
		echo "updating $lang.po"
		msgmerge -o po/$lang.po po/$lang.po po/pardus-xfce-tweaks.pot
	else
		echo "creating $lang.po"
		cp po/pardus-xfce-tweaks.pot po/$lang.po
	fi
done
