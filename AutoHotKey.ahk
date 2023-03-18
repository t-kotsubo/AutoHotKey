F13 & p::Send,{Blind}{Up}
F13 & n::Send,{Blind}{Down}
F13 & a::Send,{Blind}{Home}
F13 & e::Send,{Blind}{End}
F13 & 0::Send,{Blind}{Home}
F13 & h::Send,{Blind}{Backspace}
F13 & m::Send,{Blind}{Enter}
F13 & i::Send,{Blind}^i
F13 & u::Send,{Blind}{Shift Down}{Home}{Shift Up}{Backspace}
F13 & w::Send,{Blind}{Control Down}{Shift Down}{Left}{Shift Up}{Control Up}^x
F13 & t::Send,{Blind}{Shift Down}{Left}{Shift Up}^x{Right}^v{Left}
F13 & x::Send,{Blind}^x
F13 & c::Send,{Blind}^c
F13 & y::Send,{Blind}^v
F13 & sc01C::Send,{Blind}^{Enter}
F13 & b::Send,{Blind}{Left}
F13 & f::Send,{Blind}{Right}
F13 & @::Send,{Blind}+\
F13 & r::Send,{Blind}^z
F13 & sc073::Send,{Blind}^y
F13 & sc137::Send,{Blind}{sc15B Down}x{sc15B Up}us
F13 & sc045::Send,{Blind}{sc15B Down}x{sc15B Up}uu

F13 & d::
    if GetKeyState("Alt"){
        Send,{Blind}{Alt Up}{Control Down}{Shift Down}
        Send,{Blind}{Right}{Delete}
        Send,{Blind}{Shift Up}{Control Up}
        return
    }
    Send,{Blind}{Delete}
    return

F13 & o::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{Home}{Enter}{Up}
        return
    }
    Send,{Blind}{End}{Enter}
    return

F13 & k::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{End}{Shift Down}{Home}{Shift Up}^x
        return
    }
    Send,{Blind}{Shift Down}{End}{Shift Up}^x
    return

F13 & Tab::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}
        Send,{Blind}{Ctrl Down}{Shift Down}{Tab}{Shift Up}{Ctrl Up}
        return
    }
    Send,{Blind}^{Tab}
    return

F13 & l::Send,{Blind}^l
F13 & [::Send,{Blind}{Esc}