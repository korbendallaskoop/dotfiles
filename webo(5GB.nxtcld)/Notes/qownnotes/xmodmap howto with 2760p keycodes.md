# xmodmap howto with 2760p keycodes

https://askubuntu.com/a/257497
http://wiki.c2.com/?RemapCaps_Lock

## HPsk

- keycode 105 = Left
- keycode 66 = caps lock
- keycode 37 = left control
- keycode 77 = num lock
- keycode 118 = insert
- keycode 107 = print
- keycode 107 = alt gr

break (fn pgdwn) sender paa keycode 37, samme som left control

fn delete sender paa keycode 107, samme som fn ins (print) ved siden af

## remap keysym left to keycode Control_R

left arrow, keycode 113, is broken
remapping its neighbour right control, keycode 105
and remapping Control_R to Caps_Lock

remove control from Control_R

	remove control = Control_R

make Control_R Left
	
	keycode 105 = Left

## disable Caps_Lock and remap Control_R to it

if you want caps light to keep toggling for each (control) press:


remove lock = Caps_Lock


keycode 66 = Control_R

    add control = Control_R

if not:

    remove lock = Caps_Lock


## make Num_Lock Caps_Lock

	xmodmap -e "keysym Num_Lock = Caps_Lock"
or

`keycode 77 = Caps_Lock`

## disable keysym insert and shift insert (paste)

`'keycode 118 = NoSymbol NoSymbol NoSymbol'`

xmodmap -e "keysym Num_Lock = Control_L"

xmodmap -e "keysym Up = Up"

"keysym Up = a"

## swap keysym Print from keycode `fn insert` to `insert`

'keycode 118 = Print'

- keycode 118 = insert
- keycode 107 = print

## .sysop

print a list of all events of the whole X

`xinput test-xi2 --root`

	xev

show modifiers

	xmodmap -pm

show all mapping of keycodes to keysyms

	xmodmap -pke

	xmodmap -pke | grep

load Xmodmap

	xmodmap ~/.Xmodmap

  alias xme='xmodmap -e'
  alias xmpm='xmodmap -pm'
  alias xmpke='xmodmap -pke
  alias xmg='xmodmap -pke | grep'

alias sxku='setxkbmap -layout us'
alias sxkd='setxkbmap -layout dk'

alias xmo='xmodmap ~/.Xmodmap'


## man xmodmap

'clear' clears mapping of a modifier, not mapping of keycodes

remove MODIFIERNAME = KEYSYMNAME ...

removes all keys containing the given keysyms from the map
Unlike 'add' keysym names are evaluated as the line is read in.

allows to re-move keys from a modifier without reassigning.

>To disable Caps_Lock unmap it:
	xmodmap -e 'keycode  66 = NoSymbol NoSymbol NoSymbol'

To enable Caps_Lock map it again to default values:

	xmodmap -e 'keycode  66 = Caps_Lock NoSymbol Caps_Lock'

https://unix.stackexchange.com/questions/202930/xmodmap-clear-modifier-not-working

`'keycode 77 = NoSymbol NoSymbol NoSymbol'`

## .Xmodmap boot

This option prints a keymap table as expressions into the file ~/.Xmodmap

	xmodmap -pke > ~/.Xmodmap

Activate the changes(for this login session only) with following command:

    xmodmap ~/.Xmodmap

Check that all modifier changes are included. Add if not. Set `clear` at top and `add` at end.

Making changes persistent across reboots:

	touch .xinitrc

Place the following line in the file and save the file:

	xmodmap ~/.Xmodmap

## stack sez

This command modifies the Caps Lock to use the same behavior as Esc

	xmodmap -e "keycode 66 = Escape"

Modifying keys with different state behaviors
(such as Num Lock)
Obtain the keymap table for the modifier keys(output abbreviated here)

	xmodmap -pm
	shift       Shift_L (0x32),  Shift_R (0x3e)
	mod2        Num_Lock (0x4d)

If you wanted to change, for example, the behavior of the period on Del/Period key on the number keypad, to a comma, use the following command:

    xmodmap -e "keycode 91 mod2 = KP_Delete comma"

Note that this is usingmod2 keymapping to change key behavior when the modifier Num Lock is pressed. The syntax for this is:

    xmodmap -e "<KEYCODE> <MODIFIER> = <behaviour> <behaviour_with_modifier>"

Kevin Bowen

## List of Keysyms Recognised by Xmodmap

http://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap

## .Xmodmap mods

if xmodmap -pke > ~/.Xmodmap don't add them:

clear Shift
clear Lock
clear Control
clear Mod1
clear Mod2
clear Mod3
clear Mod4
clear Mod5
 
add shift   = Shift_L Shift_R
add lock    = Num_Lock
add control = Control_L Control_R
add mod1    = Alt_L
add mod2    =
add mod3    =
add mod4    = Super_L  Super_R
add mod5    = ISO_Level3_Shift Mode_switch

## xme classics

xme 'remove control = Control_R'
xme 'remove control = Left'

xme 'keycode 105 = Left'

xme 'keycode 118 = Print'

xme 'add control = Control_R'
xme 'add control = Control_L'

xme 'add control = Caps_Lock'

### ALT GR

i setxkbmap -layout dk hedder den 
	ISO_Level3_Shift

("option" or "AltGr"), og er mappet til mod5

make right alt Mode_switch:
	xme 'keycode 108 = Mode_switch'

remove Mode_switch from mod5
	xme 'clear mod5'

and make it mod3
	xme 'add mod3 = Mode_switch'

### CAPS

xme 'clear lock'

xme 'clear control'

xme 'keycode 66 = Control_R'

xme 'Caps_Lock = Control_R'

setxkbmap -layout us
setxkbmap -layout dk

- keycode 105 = Left
- keycode 66 = caps lock
- keycode 37 = left control
- keycode 77 = num lock
- keycode 118 = insert
- keycode 107 = print
- keycode 107 = alt gr

xmodmap -pke > ~/.Xmodmap

xmodmap -e "keysym Caps_Lock = Control_L"