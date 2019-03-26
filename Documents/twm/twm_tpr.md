# TWM! itshappening

  |   |
--|---|--
  |   |  

### workflow gotchas

- booker sez: express intent very clearly by pinning certain apps to workspaces (as in KDE activities)
- fwm alt tabbing and switching is mind taxing and visual noise! and probably too slow even with decent workspaces layout
- it's also a waste of screen estate
- ergonomics, caps-lock

## i3 kbis

caps

**bindsym Mod + .....:**

i3-gaps fork, version: 4.16.1, release: 34

d-menu launcher
`d`

new terminal
`enter`

close Window
`q`

new child window ("split container" = container that consist of one or more windows.') horizontally `h` to the right or vertically `v` below.
Toggle h/v with `e`

switch orientation (portrait and landscape) of windows within workspace or container tree `e`   

switch _stacking_ orientation horizontal `s` or _tabbed_ vertical `w` within workspace or container tree

`f` for full-screen

browse trough open windows with arrow left or `j`, arrow right or `l`, arrow/up down `i` or `k`

workspaces on `1-2...`,

move windows within workspaces `shift j/i/k/l` or arrows

move windows btw workspaces `shift n` where n is the designated workspace

exit i3 `shift e`

restart i3 inplace (after editing config) `shift r`

reload i3 config file `shift c`

|   |   |     
--|

## apps

- i3 --moreversion

- WWW: lynx, w3m, qutebrowser, newsboat, rtv,

- CHAT:
  - irssi

  - Riot

- FILES: nnn, ranger,
- DSKTOP: lxappearance
  - https://github.com/jamielinux/bashmount
    - bashmount ser ikke lumia elr dens SD kort (nautilus goer)
  - i3lock

- LAUNCHER, FUZZY search
  - rofi-bangs - Launch Other Rofi Scripts - https://github.com/gotbletu/shownotes/blob/master/rofi-bangs.md
      - instead of having to remember multiple keybindings for different scripts. I could not see the point of switching from my dmenu script to rofi, until Ii came across this script,

    - The dmenu mode in rofi is much more powerful than in dmenu. You get a message line, which can be used e.g. for instructions on keybindings.
    rofi can use custom keybindings, so you can have several actions (e.g. action1 on Enter, action2 on Alt+1 and so on). rofi can also remember the line of last used item or dump the whole output to stdout to re-use it later. (See format in manpage)

    - den her does the same https://www.reddit.com/r/i3wm/comments/a8kksr/script_for_executing_tasks_with_rofi/

  - rofi-locate -- Search Files and Folders - https://www.youtube.com/watch?v=Oks3p_R54IU&list=PLqv94xWU9zZ0LVP1SEFQsLEYjZC_SUB3m&index=3

  - svensker styler rofi https://www.youtube.com/watch?v=Sa9SWMvAMIU

  - fzf-clipboard w Greenclip Manage Clipboard History https://www.youtube.com/watch?v=Vzt0tVNrJ0A
- han har ogsaa Rofi Clipboard Manager via Greenclip - https://www.youtube.com/watch?v=4IycORAdW9M
- og https://www.youtube.com/watch?v=2FYEch1iljE

  - hexdsl bruger polybar autohide til 1-hand-mouse, elrs ingen bars https://www.youtube.com/watch?v=ReWlkLQcsY0 https://gitlab.com/hexdsl/dots

- TXT: micro, vim (...),
- DECO:
  - colorscheme, wallpaper and template manager  http://deviantfero.github.io/wpgtk
  - pywal
  - https://github.com/terminalforlife/miscellaneous/blob/master/feh-slides
  - https://github.com/terminalforlife/miscellaneous/blob/master/compton.conf
  - https://github.com/terminalforlife/miscellaneous/blob/master/redshifter
  -
- AUDIO: castero, podboat (queue for newsboat, Luke brur entr)
  - mixer elr hotkeys on app in focus
- VIDEO: youtube-viewer

- MISSING:
  - touch click
-

## i3 scripting howto 2tst/try

- screenshot'r ?
- feh for wallpaper
- default i tabbed layout
- stacking tabs are in a list, not next to each other
- floating pinned video yt player
- play pause ff kbis
- https://gist.github.com/Tadly/0741821d3694deaec1ee454a95c591fa
- l;kker locking
- bash boot script
  - wallpaper if any
  - nextcloud synclient
  - solus update check
- D: mount, USB disk listener,
    - https://gitlab.com/GaugeK/dots/blob/master/bin/usb.rules
    - https://gitlab.com/GaugeK/dots/blob/master/bin/usb-remove
    - https://gitlab.com/GaugeK/dots/blob/master/bin/usb-insert

backup, redshifter, USB mounter,
https://github.com/terminalforlife/i3config

output of
i3-msg -t get_marks
because I automatically number my terminals, editor windows and browser tabs using marks.
Marks mostly avoid the need for HJKL style navigation and arrangement.
https://www.reddit.com/r/i3wm/comments/8jpa4m/what_cool_things_do_you_guys_have_on_your/


    Workspaces are ordered by their number if you defined one
    otherwise new workspaces are appended to the end.
    if you want a specific order, prefix them with 1: etc.
    use strip_workspace_numbers to hide the number from i3bar if you want.

    - dropin terminal
    - gnome terminal replace

    I use i3wm and mostly Qt/KDE apps and I set my theming with qt5ct.

    - Xdg-open handles this by default. I use Linopen as an alternative
    -
    - https://github.com/Anachron/i3blocks
    - https://github.com/vivien/i3blocks-contrib
    - https://github.com/LukeSmithxyz/voidrice/tree/master/.scripts/statusbar

### Code Cast i3wm guide
- https://www.youtube.com/watch?v=ARKIwOlazKI&
- lxappearance hack for gtk, .gtkrc-2.0
- fixed/named workspaces, with font awesome icons
  - https://youtu.be/8-S0cWnLBKg?t=1490
  - find an app windows class with xprop
  - assign [class] workspace

### apps/modules config notes

Newsboat

  defaults to storing everything in $HOME/.newsboat directory. If you prefer XDG, create $HOME/.config/newsboat and $HOME/.local/share/newsboat directories

default apps for nnn/ranger
- vbx r i FF
- zip vist ogsaa

https://www.reddit.com/r/unixporn/comments/ayu246/oci3dmenu_simple_script_for_showing_your_i3/

https://www.reddit.com/r/i3wm/comments/a3qqth/which_programms_alongside_i3/

https://terminalsare.sexy

### maester luke sez

- interval=once i i3blocks modules to avoid sys resources for constant pinging https://youtu.be/gKumet6b-WY?t=168
-
