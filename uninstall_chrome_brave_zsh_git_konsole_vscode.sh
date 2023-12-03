strMinor="================"
strBigger="================================================"
strFailed="================ command failed ================"
strUpdate="================ system update now ================"
strRemove="================ $1 removed with success ================"

function updateSystem() {
  if apt-get update -y;
    then
      strMinor;
      echo $(strUpdate); 
      strMinor;
      reboot;
  else
      strFailed;
  fi
}

function limpeza() {
    apt-get autoremove;
    apt-get autoclean;
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
      echoSpace $(strMinor);
      echo "================ system update now ================"; 
      echoSpace $(strMinor);
  else
      echoFailed;
  fi
}

if apt-get remove konsole -y;
  then 
    strMinor;
    echoSuccess "konsole"
    strMinor;
else
    echoFailed;
fi

if apt-get remove whatsapp-for-linux -y;
  then 
    strMinor;
    echoSuccess "whatsapp";
    strMinor;
else
    echoFailed;
fi

if apt-get remove curl -y;
   apt-get remove brave-browser -y;
   updateSystem;
  then
    strMinor;
    echoSuccess "brave";
    strMinor;
else
    echoFailed;
fi

if apt-get remove google-chrome-stable -y;
  then 
   strMinor;
   echoSuccess "chrome";
   strMinor;
else
   echoFailed;
fi

if apt-get remove code -y;
  then
   strMinor;
   echoSuccess "vscode";
   strMinor;
else
   echoFailed;
fi

if apt-get remove git -y;
  then 
   strMinor;
   echoSuccess "git";
   strMinor;
else
  echoFailed;
fi

if apt-get remove zsh -y;
  then 
   strMinor;
   echoSuccess "zsh";
   strMinor;
   limpeza;
   updateSystem;
else
   echoFailed;
fi
