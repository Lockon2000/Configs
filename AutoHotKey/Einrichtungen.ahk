#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ---------------------------------------------------------------------

; +------------------------------------------------------------------------------+
; | ** Defined Hotkeys **                                                        |
; | F4: Hotkey to suspend all hotkeys                                            |
; | LeftCtrl+LeftAlt+W: Pin the active window on top of any other window         |
; | LeftCtrl+LeftAlt+C: Add to the Clipboard                                     |
; | LeftCtrl+LeftAlt+P: Launch PowerShell in Admin mode (disabled)               |
; | LeftCtrl+LeftAlt+S: Launch Sublime Text                                      |
; | LeftCtrl+LeftAlt+N: Create a new file and run it with the associated program |
; | Ctrl+Shift+S: Open Clipboard with Sublime Text                               |
; |------------------------------------------------------------------------------|
; | ** Debugging Hotkeys **                                                      |
; | Ctrl+Alt+1                                                                   |
; | Ctrl+Alt+2                                                                   |
; | Ctrl+Alt+3                                                                   |
; +------------------------------------------------------------------------------+


; Hotkey to suspend the script
F4:: Suspend


; Ctrl+Alt+W: Pin the active window on top of any other window
<^<!w:: Winset, Alwaysontop, TOGGLE, A


; Ctrl+Alt+C: Add to the Clipboard
<^<!c::
    previousClipboard := Clipboard
    Clipboard =
    Send, ^c
    ClipWait, 0.5

    if ErrorLevel {
        MsgBox, The attempt to copy text onto the Clipboard failed.
        Clipboard := previousClipboard
        
        return
    }

    Clipboard := previousClipboard "`r`n" Clipboard

    return


; ; Ctrl+Alt+P: Hotkey to launch PowerShell in Admin mode - Disabled as of now I am using windows Builtin Shortcut
; ; If an Explorer Window is active
; #IfWinActive ahk_class CabinetWClass
; <^<!p::
; #IfWinActive ahk_class ExploreWClass
; <^<!p::
;     ; Begin (get current path) -------------
;     ; Get full path from open Explorer window
;     WinGetText, FullPath, A

;     ; Split up result (it returns paths seperated by newlines)
;     StringSplit, PathArray, FullPath, `n
    
;     ; Find line with backslash which is the path
;     Loop, %PathArray0%
;     {
;         StringGetPos, pos, PathArray%a_index%, \
;         if (pos > 0) {
;             FullPath:= PathArray%a_index%
;             break
;         }
;     }
    
;     ; Clean up result
;     FullPath := RegExReplace(FullPath, "(^.+?: )", "")
;     StringReplace, FullPath, FullPath, `r, , all
;     ; End (get current path) -------------

;     ; Change working directory
;     SetWorkingDir, %FullPath%

;     ; An error occurred with the SetWorkingDir directive
;     if ErrorLevel
;         Return

;     ; Open the file in the appropriate editor
;     Run *RunAs C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe -NoExit -Command "Set-Location '%FullPath%'"

;     Return

; ; If the Desktop is active
; #IfWinActive ahk_class Progman
; <^<!p::
; #IfWinActive ahk_class WorkerW
; <^<!p::
;     ; Open the file in the appropriate editor
;     Run *RunAs C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe -NoExit -Command "Set-Location 'C:\Users\%A_UserName%\Desktop'"

;     Return

; ; If anything else is active and also turn off context sensitivity
; #IfWinActive
; <^<!p::
;     ; Open the file in the appropriate editor
;     Run *RunAs C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe

;     Return


; Ctrl+Alt+S: Launch Sublime Text
<^<!s:: Run, "C:\Program Files\Sublime Text 3\sublime_text.exe"


; Ctrl+Alt+N: Create a new file and run it with the associated program
; Only create when Windows Explorer or Desktop is active
; Options: (Add them at the end of the name after a space in the text box)
; -s    to open the created file with sublime text regardless of its associated program
; -c    to just create a file without interacting with it any further
#IfWinActive ahk_class CabinetWClass
<^<!n::
#IfWinActive ahk_class ExploreWClass
<^<!n::
    ; Begin (get current path) -------------
    ; Get full path from open Explorer window
    WinGetText, FullPath, A

    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n
    
    ; Find line with backslash which is the path
    Loop, %PathArray0% {
        StringGetPos, pos, PathArray%a_index%, \
        if (pos > 0) {
            FullPath:= PathArray%a_index%
            break
        }
    }
    
    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^.+?: )", "")
    StringReplace, FullPath, FullPath, `r, , all
    ; End (get current path) -------------

    ; Change working directory
    SetWorkingDir, %FullPath%

    ; An error occurred with the SetWorkingDir directive
    if ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, New File, , , 400, 100, , , , ,

    ; User pressed cancel
    if ErrorLevel
        Return

    if InStr(UserInput, " -s") {
        ; Strip UserInput of the -s option
        UserInput := StrReplace(UserInput, " -s", "")

        ; Create file
        FileAppend, , %UserInput%

        ; Open the file in Sublime Text
        Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" %UserInput%
    } else if InStr(UserInput, " -c") {
        ; Strip UserInput of the -s option
        UserInput := StrReplace(UserInput, " -c", "")

        ; Create file
        FileAppend, , %UserInput%
    } else {
        ; Create file
        FileAppend, , %UserInput%

        ; Open the file in the associated program
        Run, %UserInput%
    }

    Return

#IfWinActive ahk_class Progman
<^<!n::
#IfWinActive ahk_class WorkerW
<^<!n::
    ; Change working directory
    SetWorkingDir, C:\Users\%A_UserName%\Desktop

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, New File, , , 400, 100, , , , ,

    ; User pressed cancel
    If ErrorLevel
        Return

    if InStr(UserInput, " -s") {
        ; Strip UserInput of the -s option
        UserInput := StrReplace(UserInput, " -s", "")

        ; Create file
        FileAppend, , %UserInput%

        ; Open the file in Sublime Text
        Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" %UserInput%
    } else if InStr(UserInput, " -c") {
        ; Strip UserInput of the -s option
        UserInput := StrReplace(UserInput, " -c", "")

        ; Create file
        FileAppend, , %UserInput%
    } else {
        ; Create file
        FileAppend, , %UserInput%

        ; Open the file in the associated program
        Run, %UserInput%
    }

    Return

#IfWinActive


; Ctrl+Shift+S: Open Clipboard with Sublime Text
; The Clipboard is restored after the operation
; Only run when Windows Explorer or Desktop is active
#IfWinActive ahk_class CabinetWClass
^+s::
#IfWinActive ahk_class ExploreWClass
^+s::
#IfWinActive ahk_class Progman
^+s::
#IfWinActive ahk_class WorkerW
^+s::
    temp := Clipboard
    Clipboard =     ; Empty the clipboard
    Send, ^c        ; Populate the clipboard with the focused files name
    ClipWait, 0.5   ; Wait up to 0.5 seconds for the clipboard to have content

    if ErrorLevel {
        MsgBox, The attempt to copy text onto the Clipboard failed.
        Clipboard := temp
        
        return
    }

    argument =       ; Epmty argument so it doesn't accumulate names over multiple uses
    files := StrSplit(Clipboard, "`r`n")
    for index, element in files {
        argument := argument """" element """" A_Space
    }

    Run, "C:\Program Files\Sublime Text 3\sublime_text.exe" %argument%

    Clipboard := temp

    return

#IfWinActive


;------------------------------------------------------------------
; Tools for developing
; Only uncomment when needed


; <^<!r::Reload  ; Assign Ctrl-Alt-R as a hotkey to restart the script.


; <^<!1::MsgBox You pressed LeftControl+LeftAlt+1.

; <^<!2::

; <^<!3::

