# Variables

- x <- 10 # Assignment operator
- 10 -> x

## Run

- Copy file `cp src/rparadise/* scripts/`
- Copy & Run file `cp src/rparadise/* scripts/ && docker exec -ti dat246_rlang Rscript rsequence.r`
- SSH `docker exec -ti dat246_rlang /bin/bash`
- Run cmd `Rscript vars.r` 

## X11 forwarding

- Server
  - sudo nano  /etc/ssh/ssh_config
  - And set ForwardX11Trusted yes
  - sudo service sshd reload
  - sudo apt install x11-apps
  - xeyes
  - xedit a.txt

- MAC local computer
  - `brew install xquartz`
  - In terminal DISPLAY=:0
  - Restart
  - `ssh -v -X admin@softhem.net`
  - This means success: Requesting X11 forwarding with authentication spoofing.
  