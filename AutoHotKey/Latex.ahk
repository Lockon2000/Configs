#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; ---------------------------------------------------------------------

; +------------------------------------------------------------------------------+
; | ** Defined Hotkeys **
; | math-d: 
; | so-a: 
; | alned-e: 
; | aln-e: 
; | aln*-e: 
; | pmat-e: 
; | vmat-e: 
; | smat-e: 
; | (): 
; | []: 
; | {}: 
; | <>: 
; | ||: 
; |------------------------------------------------------------------------------|
; | ** Debugging Hotkeys **
; | Ctrl+Alt+1
; | Ctrl+Alt+2
; | Ctrl+Alt+3
; +------------------------------------------------------------------------------+


::math-d::
SendRaw, 
(
\[\]
)
Send, {left}{left}

return


::so-a::
SendRaw, \quad \Rightarrow \quad

return


::alned-e::
SendRaw, 
(
\begin{aligned}[t]

\end{aligned}
)
Send, {up}{tab}

return


::aln-e::
SendRaw, 
(
\begin{align}

\end{align}
)
Send, {up}{tab}

return


::aln*-e::
SendRaw, 
(
\begin{align*}

\end{align*}
)
Send, {up}{tab}

return


::pmat-e::
SendRaw, 
(
\begin{pmatrix}

\end{pmatrix}
)
Send, {up}{tab}

return


::vmat-e::
SendRaw, 
(
\begin{vmatrix}

\end{vmatrix}
)
Send, {up}{tab}

return


::smat-e::
SendRaw, \begin{smallmatrix}\end{smallmatrix}
Send, {left 17}

return


::()::
SendRaw, \left(\right)
Send, {left 7}

return


::[]::
SendRaw, \left[\right]
Send, {left 7}

return


::{}::
SendRaw, \left\{\right\}
Send, {left 8}

return


::<>::
SendRaw, \left<\right>
Send, {left 7}

return


::||::
SendRaw, \Vert\Vert
Send, {left 5}

return

