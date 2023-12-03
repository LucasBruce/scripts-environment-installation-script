
strMinor="================"
strBigger="================================================"
strFailed="================ command failed ================"
strUpdate="================ system update now ================"
strRemove="================ $1 install with success ================"

function echoSpace() {
      echo "$1"; 
}
function echoSuccess() {
      echoSpace $(strBigger)
      echo $(strRemove)
      echoSpace $(strBigger)
}

function echoSpace() {
      echo "$1"; 
}

function echoFailed() {
      echoSpace $(strMinor);
      echoSpace $(strFailed); 
      echoSpace $(strMinor);
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

if apt-get install konsole -y;
  then 
    spaceMinor;
    echoSuccess "git";
    spaceMinor;
else
    echoFailed;
fi

if wget https://github.com/eneshecan/whatsapp-for-linux/releases/download/v1.4.4/whatsapp-for-linux_1.4.4_amd64.deb;
   dpkg -i whatsapp-for-linux_1.4.4_amd64.deb;
   apt-get install -f -y;
   rm whatsapp-for-linux_1.4.4_amd64.deb;
  then 
    spaceMinor;
    echoSuccess "whatsapp";
    spaceMinor;
else
    echoFailed;
fi

if apt-get install curl -y;
   curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"| tee /etc/apt/sources.list.d/brave-browser-release.list;
   updateSystem;
   apt-get install brave-browser;
  then
    spaceMinor;
    echoSuccess "brave";
    spaceMinor;
else
    echoFailed;
fi

if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   dpkg -i google-chrome-stable_current_amd64.deb;
   apt-get install -f -y;
   rm google-chrome-stable_current_amd64.deb;
  then 
   spaceMinor;
   echoSuccess "chrome";
   spaceMinor;
else
   echoFailed;
fi

if wget https://go.microsoft.com/fwlink/?LinkID=760868 -O code.deb;
   dpkg -i code.deb;
   apt-get install -f -y;
   rm code.deb;
  then
   spaceMinor;
   echoSuccess "vscode";
   spaceMinor;
else
   echoFailed;
fi

if apt-get install git -y
  then 
   spaceMinor;
   echoSuccess "git";
   spaceMinor;
else
  echoFailed;
fi

user=$(whoami)
if apt-get install zsh -y;
   whoami;
   usermod -s /usr/bin/zsh $(user);
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)";
  then 
   spaceMinor;
   echoSuccess "zsh";
   spaceMinor;
   updateSystem;
   reboot;
else
   echoFailed;
fi

