
# executando update no sistema.

function space() {
      echo "================================================"; 
}

function spaceMinor() {
      echo "================"; 
}

function echoFailed() {
      space
      echo "================ command failed ================"; 
      space
}

function updateSystem() {
  if apt-get update -y;
    then
      spaceMinor;
      echo "================ system update now ================"; 
      spaceMinor;
  else
      echoFailed;
  fi
}

# instalando konsole.
if apt-get install konsole -y;
  then 
    spaceMinor;
    echo "================ git install of success ================";
    spaceMinor;
else
    echoFailed;
fi

# instalando whatsapp.
if wget https://github.com/eneshecan/whatsapp-for-linux/releases/download/v1.4.4/whatsapp-for-linux_1.4.4_amd64.deb;
   dpkg -i whatsapp-for-linux_1.4.4_amd64.deb;
   apt-get install -f -y;
   rm whatsapp-for-linux_1.4.4_amd64.deb;
  then 
    spaceMinor;
    echo "================ whatsapp install of success ================";
    spaceMinor;
else
    echoFailed;
fi

# instalando brave.
if apt-get install curl -y;
   curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list;
   updateSystem;
   apt-get install brave-browser;
  then
    spaceMinor;
    echo "================ brave install of success ================";
    spaceMinor;
else
    echoFailed;
fi

# instalando chrome.
if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   dpkg -i google-chrome-stable_current_amd64.deb;
   apt-get install -f -y;
   rm google-chrome-stable_current_amd64.deb;
  then 
   spaceMinor;
   echo "================ chrome install of success ================";
   spaceMinor;
else
   echoFailed;
fi

# instalando vscode.
if wget https://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb;
   dpkg -i code.deb;
   apt-get install -f -y;
   rm code.deb;
  then
   spaceMinor;
   echo "================ vscode install of success ================";
   spaceMinor;
else
   echoFailed;
fi

# instalando git.
if apt-get install git
  then 
   spaceMinor;
   echo "================ git install of success ================";
   spaceMinor;
else
  echoFailed;
fi

# instalando zsh melhorar a instalação do zsh não ficou default.
user=$(whoami)
if apt-get install zsh -y;
   whoami;
   usermod -s /usr/bin/zsh $(user);
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";
  then 
   spaceMinor;
   echo "================ zsh install of success ================";
   spaceMinor;
   reboot;
else
   echoFailed;
fi

