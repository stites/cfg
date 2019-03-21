{
  enable = true;
  forwardAgent = true;
  serverAliveInterval = 120;
  compression = true;
  controlMaster = "auto";
  controlPath = "/tmp/%r@%h:%p";
  controlPersist = "10m";
  matchBlocks = {
    # Monad network
    State = { hostname = "192.168.1.1"; };
    Cont = { hostname = "192.168.1.7"; };
    Tardis = { user = "adblock"; hostname = "192.168.1.200"; };

    # Turtle network
    gauss = { hostname = "10.0.6.48"; };
    erdos = { hostname = "10.0.6.89"; };
    genbu = { hostname = "10.0.6.154"; };
    grothendieck = { hostname = "10.0.6.124"; };
    kovalevskaya = { hostname = "10.0.6.103"; };
    mirzakhani = {
      hostname = "10.0.6.132";
      forwardX11Trusted = true;
    };
    mirzakhani-local = {
      hostname = "10.0.0.12";
      forwardX11Trusted = true;
    };
    # ssh root@10.11.99.1 "mkdir -p ~/.ssh && \
    #    touch .ssh/authorized_keys && \
    #    chmod -R u=rwX,g=,o= ~/.ssh && \
    #    cat >> .ssh/authorized_keys" < ~/.ssh/id_rsa.pub
    remarkable = {
      hostname = "10.11.99.1";
      user = "root";
      identityFile = "/home/stites/.ssh/id_rsa"; # This _must_ be rsa because of reMarkable's sshd client
    };
  };
}
