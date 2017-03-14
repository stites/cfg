Config
  { font = "xft:FiraCode-10",
  , bgColor      = "black"
  , fgColor      = "grey"
  -- Position is top left, taking up 95% of screen.
  -- You are likely to have to tweak the width here based on the width
  -- of your screen to make it play nicely with stalonetray
  , position = TopW L 95
  , lowerOnStart = True
  , persistent   = True
  , sepChar      = "%"
  , alignSep     = "}{"
  --, template     = "%StdinReader% }{ %wlp2s0wi% %dynnetwork% | %memory% | %multicpu% | %battery% | vol %debvolume% | <fc=orange>%date%</fc>   "
  , template     = "%StdinReader% }{ %memory% | %multicpu% | %battery% | <fc=orange>%date%</fc>   "
  , commands =
    [ Run StdinReader
    , Run Uptime
      ["-t", "up <days>d"]
      864000
    , Run MultiCpu
      [ "-t", "cpu <autovbar>"
      , "-L", "25"
      , "-H", "75"
      , "-l", "green"
      , "-n", "yellow"
      , "-h", "red"
      ] 10
    , Run Memory
      [ "-t", "mem <usedratio>"
      , "-L", "33"
      , "-H", "66"
      , "-l", "green"
      , "-n", "yellow"
      , "-h", "red"
      ] 10
    -- , Run ThermalZone
    --   0
    --   ["-t", "temp <temp>",
    --   "-L", "50",
    --   "-H", "70",
    --   "-l", "green",
    --   "-n", "yellow",
    --   "-h", "red"]
    --   50
    -- , Run ThermalZone
    --   1
    --   ["-t", "<temp>",
    --   "-L", "50",
    --   "-H", "70",
    --   "-l", "green",
    --   "-n", "yellow",
    --   "-h", "red"]
    --   50
    -- , Run Volume "default" "Master"
    --   ["-t", "vol <volumevbar>"]
    --   10

    -- To get volume information, we run a custom bash script.
    -- This is because the built-in volume support in xmobar is disabled
    -- in Debian and derivatives like Ubuntu.
    --, Run Com "/bin/bash" ["-c", "~/.xmonad/get-volume"] "debvolume" 10

    --, Run Wireless "wlp2s0"
    --  ["-t", "<fc=white><essid></fc> <qualityvbar>",
    --  "-l", "red",
    --  "-n", "yellow",
    --  "-h", "green"]
    --  10
    --, Run DynNetwork
    --  ["-t", "<rx>",
    --  "-w", "5"]
    --  50
    --, Run Battery
    --  ["-t", "bat <left> (<timeleft>)",
    --  "-S", "True",
    --  "-L", "15",
    --  "-H", "80",
    --  "-l", "red",
    --  "-n", "yellow",
    --  "-h", "green",
    --  "--", "-O",
    --  "+", "-o",
    --  ""]
    --600
    , Run Date "%a %b %_d %l:%M" "date" 600
    ]
  }