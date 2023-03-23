F13 & p::Send,{Blind}{Up}
F13 & n::Send,{Blind}{Down}
F13 & a::Send,{Blind}{Home}
F13 & e::Send,{Blind}{End}
F13 & 0::Send,{Blind}{Home}
F13 & l::Send,{Blind}^l
F13 & m::Send,{Blind}{Enter}
F13 & i::Send,{Blind}^i
F13 & w::Send,{Blind}{Control Down}{Shift Down}{Left}{Shift Up}{Control Up}^x
F13 & t::Send,{Blind}{Shift Down}{Left}{Shift Up}^x{Right}^v{Left}
F13 & x::Send,{Blind}^x
F13 & c::Send,{Blind}^c
F13 & v::Send,{Blind}^v
F13 & [::Send,{Blind}{Esc}
F13 & sc01C::Send,{Blind}^{Enter} ; F13 + Enter: Ctrl + Enter
F13 & b::Send,{Blind}{Left}
F13 & f::Send,{Blind}{Right}
F13 & @::Send,{Blind}+\ ; F13 + @: |(パイプ)入力
F13 & sc073::Send,{Blind}^y ; F13 + / やり直す(Ctrl + Y)
F13 & sc137::Send,{Blind}{sc15B Down}x{sc15B Up}us ; F13 + PrintScreen: スリープ
F13 & sc045::Send,{Blind}{sc15B Down}x{sc15B Up}uu ; F13 + Pause: シャットダウン
F13 & sc148::Send,{U+2191} ; ↑入力
F13 & sc150::Send,{U+2193} ; ↓入力
F13 & sc14D::Send,{U+2192} ; →入力
F13 & sc14B::Send,{U+2190} ; ←入力

; F13 + r : 元に戻す
; F13 + Shift + r : やり直す(Ctrl + Shift + Z)
F13 & r::
    if GetKeyState("Shift"){
	Send,{Blind}^+z
        return
    }
    Send,{Blind}^z
    return

; F13 + h : 前方の一文字を削除
; F13 + Shift + h : 前方の単語の一区切りを削除
F13 & h::
    if GetKeyState("Shift"){
	  Send,{Blind}{Control Down}{Shift Down}{Left}{Shift Up}{Control Up}{Backspace}
        return
    }
    Send,{Blind}{Backspace}
    return

; F13 + u : クリップボードに履歴を残してカーソル位置から文頭までを一括削除
; F13 + Shift + u : クリップボードに履歴を残さずカーソル位置から文頭までを一括削除
F13 & u::
    if GetKeyState("Shift"){
	  Send,{Blind}{Shift Down}{Home}{Shift Up}{Backspace}
        return
    }
    Send,{Blind}{Shift Down}{Home}{Shift Up}^x
    return

; F13 + d : 後方の一文字を削除
; F13 + Shift + d : クリップボードに履歴を残さずカーソル位置から文末までを削除
F13 & d::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Down}{End}{Shift Up}{Backspace}
        return
    }
    Send,{Blind}{Delete}
    return

; F13 + o : 折り返して改行
; F13 + Shift + o : 前の行に行を挿入
F13 & o::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{Home}{Enter}{Up}
        return
    }
    Send,{Blind}{End}{Enter}
    return

; F13 + k : クリップボードに履歴を残してカーソル位置から文末までを一括削除
; F13 + Shift + k : クリップボードに履歴を残して一行を削除
F13 & k::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{End}{Shift Down}{Home}{Shift Up}^x
        return
    }
    Send,{Blind}{Shift Down}{End}{Shift Up}^x
    return

; F13 + k : クリップボードに履歴を残してカーソル位置から文末までを一括削除
; F13 + Shift + k : クリップボードに履歴を残して一行を削除
F13 & y::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{Home}{Enter}{Up}^v
        return
    }
    Send,{Blind}^v
    return

F13 & Tab::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}
        Send,{Blind}{Ctrl Down}{Shift Down}{Tab}{Shift Up}{Ctrl Up}
        return
    }
    Send,{Blind}^{Tab}
    return
