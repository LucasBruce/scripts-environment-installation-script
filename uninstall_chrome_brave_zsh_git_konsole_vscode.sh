
# executando update no sistema.

function limpeza() {
    apt-get autoremove;
    apt-get autoclean;
    reboot;
}

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
if apt-get remove konsole -y;
  then 
    spaceMinor;
    echo "================ konsole removed with success ================";
    spaceMinor;
else
    echoFailed;
fi

# removendo whatsapp.
if apt-get remove whatsapp-for-linux -y;
  then 
    spaceMinor;
    echo "================ whatsapp removed with success ================";
    spaceMinor;
else
    echoFailed;
fi

# removendo brave.
if apt-get remove curl -y;
   apt-get remove brave-browser -y;
   updateSystem;
  then
    spaceMinor;
    echo "================ brave removed with success ================";
    spaceMinor;
else
    echoFailed;
fi

# removendo chrome.
if apt-get remove google-chrome-stable -y;
  then 
   spaceMinor;
   echo "================ chrome removed with success ================";
   spaceMinor;
else
   echoFailed;
fi

# removendo vscode.
if apt-get remove code -y;
  then
   spaceMinor;
   echo "================ vscode removed with success ================";
   spaceMinor;
else
   echoFailed;
fi

# removendo git.
if apt-get remove git -y;
  then 
   spaceMinor;
   echo "================ git removed with success ================";
   spaceMinor;
else
  echoFailed;
fi

# removendo zsh

if apt-get remove zsh -y;
  then 
   spaceMinor;
   echo "================ zsh removed with success ================";
   spaceMinor;
   limpeza;
else
   echoFailed;
fi
