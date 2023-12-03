
function updateSystem(): {
  if apt-get update
    then echo "system update now..."
  else
    then echo "command failed!"
  fi
}

if apt-get install konsole
  then echo "konsole install of success..."
else
  then echo "command failed!"
fi

if wget https://github.com/eneshecan/whatsapp-for-linux/releases/download/v1.4.4/whatsapp-for-linux_1.4.4_amd64.deb;
   dpkg -i whatsapp-for-linux_1.4.4_amd64.deb;
   apt-get install -f;
   rm whatsapp-for-linux_1.4.4_amd64.deb;
  then echo "whatsapp install of success..."
else
  then echo "command failed!"
fi

if apt-get install curl;
   curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list;
   updateSystem();
   apt-get install brave-browser
  then echo "chrome brave of success..."
else
  then echo "command failed!"
fi

if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   dpkg -i google-chrome-stable_current_amd64.deb;
   apt-get install -f;
   rm google-chrome-stable_current_amd64.deb;
  then echo "chrome install of success..."
else
  then echo "command failed!"
fi

if apt-get install git
  then echo "git install of success..."
else
  then echo "command failed!"
fi

zsh_dir=$(whereis zsh)
if apt-get install zsh -y;
   usermod -S /usr/bin/zsh $(whoami);
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";
  then echo "zsh install of success..."
else
  then echo "command failed!"
fi

if updateSystem;
  then 
    reboot;
else
  then echo "command failed!"
fi