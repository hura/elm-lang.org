import Website.Widgets (button)
import Website.Skeleton (skeleton)
import Website.BigTiles as Tile
import Website.ColorScheme as C

import Text
import Window

port title : String
port title = "Install"

main = skeleton "Install" content <~ Window.dimensions

content outer =
    let center elem =
            container outer (heightOf elem) middle elem
    in
        flow down
        [ center (width (min 600 outer) header)
        , center <|
              flow right
              [ button 220 180 "http://install.elm-lang.org/Elm-Platform-0.13.pkg" "Mac"
              , button 220 180 "http://install.elm-lang.org/Elm-Platform-0.13.exe" "Windows"
              ]
        , center (width (min 600 outer) rest)
        ]


header = [markdown|

# Install

There are handy installers for Windows and Mac, but you will need to build
from source on other platforms.

|]


rest = [markdown|

To uninstall on Mac, run [this script][uninstall].

[uninstall]: https://github.com/elm-lang/elm-platform/blob/master/src/mac/helper-scripts/uninstall.sh

To upgrade to a newer version of Elm, run the installer again. They safely
overwrite old executables so your machine is in a consistent state.

<br>

## Build from Source

The following instructions should work on any platform, from Windows to Ubuntu.
It requires getting the Haskell compiler, but you can uninstall that after you
have the executables you need.

**If you have never used Haskell**, first download the [Haskell Platform][hp].
Then run the following commands:

```bash
cabal update
cabal install cabal-install
cabal install -j Elm-0.13 elm-repl-0.3 elm-reactor-0.1 elm-get-0.1.3
```

This will take some time, but when it is done, all of these executables should
be on your PATH. If not, then they should be in `~/.cabal/bin` which you can
[add to your PATH].

[hp]: http://hackage.haskell.org/platform/
[add to your PATH]: http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path

**If you use Haskell for other stuff**, it would be best to use cabal
sandboxes for the install process. These were released with cabal 0.18 and will
let you use [this install script][script].

[script]: https://github.com/elm-lang/elm-platform/blob/master/src/BuildFromSource.hs#L1-L31

<br>

## Help

If you are stuck, check to see if anyone has had [a similar issue][elm-platform].
If not, open a new issue or email [the list][group] or ask a question in the
[#elm IRC channel][irc].

[elm-platform]: https://github.com/elm-lang/elm-platform/issues
[group]: https://groups.google.com/forum/?fromgroups#!forum/elm-discuss
[irc]: http://webchat.freenode.net/?channels=elm

|]

