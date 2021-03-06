{ lib }:

let
  concatStringsSep = lib.strings.concatStringsSep;
in
{
  shellAliases = {
    # cabal extras
    cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'";

    # stack aliases
    sb  = "stack build";
    sbw = "stack build --file-watch";
    st  = "stack test";
    stw = "stack test --file-watch";
    si  = "stack install";
    siw = "stack install --file-watch";
  };

  functions = (concatStringsSep "\n" [
    # stack autocomplete
    # eval "$(stack --bash-completion-script stack)"
    "
    _stack()
    {
        local CMDLINE
        local IFS=$'\\n'
        CMDLINE=(--bash-completion-index \"$COMP_CWORD\")

        for arg in \"\${COMP_WORDS[@]}\"; do
            CMDLINE=(\"\${CMDLINE[@]}\" --bash-completion-word \"$arg\")
        done

        COMPREPLY=( $(stack \"\${CMDLINE[@]}\") )
    }

    complete -o filenames -F _stack stack
    "

    ''
    # load a new stack project from a hard-coded template repo
    function stacknew {
      stack new "$1" --bare ~/git/stack-templates/skeleton
    }

    export -f stacknew
    ''

    ''
    # load 'shakeup' script
    function dl_shakeup {
      local SHAKEUP_LOCATION="$HOME/.local/bin/shakeup"
      local SHAKEUP_URL="https://gist.githubusercontent.com/stites/bc45f92f567af90ee73e4ce7cd263f80/raw/80cedfd9e65d89087bc669354661873e17d2f212/shakeup.sh"

      if command -v shake > /dev/null 2>&1; then
        if [ ! -f "$SHAKEUP_LOCATION" ]; then
          curl -o "$SHAKEUP_LOCATION" "$SHAKEUP_URL"
          chmod u+x "$SHAKEUP_LOCATION"
        fi
      fi
    }
    ''

    ## ================================================================================================= ##
    # https://gist.github.com/simonmichael/1185421

    # unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
    # ghc-pkg-clean -f cabal/dev/packages*.conf also works.
    ''
    function ghc-pkg-clean() {
      for p in $(ghc-pkg check "$@" 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'); do
          echo "unregistering $p"; ghc-pkg "$@" unregister "$p"
      done
    }
    ''

    # remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
    # When all else fails, use this to get out of dependency hell and start over.
    ''
    function ghc-pkg-reset() {
      read -rp 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
      test "x$ans" == "xy" && {
          echo 'erasing directories under ~/.ghc'; rm -rf "$(find ~/.ghc -maxdepth 1 -type d)"
          echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib;
          # echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
          # echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
      }
    }
    ''
    ]);

  initConfig = ''
    dl_shakeup
    safe_path_add "$HOME/.cabal/bin"
    safe_path_add "$HOME/.local/bin"
  '';
}


