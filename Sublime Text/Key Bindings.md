# Tipps:

1. If you know of a key combination that executes the command you want, you may enter "sublime.log_commands(True)" in the console. Then press the appropriate key binding. This will print out the command being executed to the console and the associated arguments. Also "sublime.log_input(True)" logs all individual key presses and key combination presses.

2. As the german keyboard is layed out somewhat differently than an English one, many of the shortcuts triggered by non-alphanumeric characters are not in the right corresponding german position.

Here I list all correspondences I have found out till now:

```
Ctrl + `  -->  Ctrl + Ö
Ctrl + ;  -->  Ctrl + Ü
Ctrl + /  -->  Ctrl + #
Ctrl + ]  -->  Ctrl + ´
Ctrl + [  -->  Ctrl + ß
```

# My own key bindings:

```
[
    // Ctrl + Alt + b --> Cancel Build
    { "keys": ["ctrl+alt+b"], "command": "cancel_build" },
    // Alt + Space --> Go to end of line
    { "keys": ["alt+space"], "command": "move_to", "args": {"to": "eol", "extend": false} },
    // Alt + Shift + Space --> Go to beginnig of line
    { "keys": ["alt+shift+space"], "command": "move_to", "args": {"to": "bol", "extend": false} },

    // Switching between tabs according to their order
    { "keys": ["ctrl+tab"], "command": "next_view" },
    { "keys": ["ctrl+shift+tab"], "command": "prev_view" },

    // Switching between tabs according to their usage
    { "keys": ["ctrl+pagedown"], "command": "next_view_in_stack" },
    { "keys": ["ctrl+pageup"], "command": "prev_view_in_stack" }
]
```