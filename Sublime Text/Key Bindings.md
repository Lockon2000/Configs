# Tipps:

1. If you know of a key combination that executes the command you want, you may enter "sublime.log_commands(True)" in the console. Then press the appropriate key binding. This will print out the command being executed to the console and the associated arguments. Also "sublime.log_input(True)" logs all individual key presses and key combination presses.

2. As the german keyboard is laid out somewhat differently than an English one, many of the non-alphanumeric characters are not accessed by a single keystroke like in the english keyboard. They are inserted through a Shift+Key combination which sublime text then understands as Shift+Key not the intended "one" keystroke. But fortunately it seems the intended "one" key strokes correspond to some other keys in the german layout.

Here I list all correspondences I have found out till now:

```
"`"  -->  "Ö"
";"  -->  "Ü"
"/"  -->  "#"
"]"  -->  "´"
"["  -->  "ß"
```

# My own key bindings:

```
[
    // Open Folder
    { "keys": ["ctrl+shift+o"], "command": "prompt_open_folder"},
    // Cancel Build
    { "keys": ["ctrl+alt+b"], "command": "cancel_build" },
    // Go to end of line
    { "keys": ["alt+space"], "command": "move_to", "args": {"to": "eol", "extend": false} },
    // Go to beginnig of line
    { "keys": ["alt+shift+space"], "command": "move_to", "args": {"to": "bol", "extend": false} },

    // Switching between tabs according to their order
    { "keys": ["ctrl+tab"], "command": "next_view" },
    { "keys": ["ctrl+shift+tab"], "command": "prev_view" },
    // Switching between tabs according to their usage
    { "keys": ["ctrl+pagedown"], "command": "next_view_in_stack" },
    { "keys": ["ctrl+pageup"], "command": "prev_view_in_stack" },

    // Modification to the AppendSemiColon package
    { "keys": ["ctrl+,"], "command": "append_semi_colon" }, 
    { "keys": ["ctrl+shift+,"], "command": "append_semi_colon", "args": {"enter_new_line": "true"} }
]
```