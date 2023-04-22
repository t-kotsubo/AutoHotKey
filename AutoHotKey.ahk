F13 & p::Send,{Blind}{Up}
F13 & n::Send,{Blind}{Down}
F13 & a::Send,{Blind}{Home}
F13 & e::Send,{Blind}{End}
F13 & 0::Send,{Blind}{Home}
F13 & h::Send,{Backspace}
F13 & l::Send,{Blind}^l
F13 & m::Send,{Blind}{Enter}
F13 & i::Send,{Blind}^i
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
F13 & ScrollLock::Shutdown, 2 ; F13 + ScrollLock: 再起動
F13 & PrintScreen:: ; F13 + PrintScreen: 休止モード
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    return

; F13 + Delete ; スリープモード
; F13 + Shift + Delete : 全てのウィンドウを閉じる(CloseAllのアプリを実行)
F13 & Delete::
    if GetKeyState("Shift"){
        Run,"C:\ShortCut\CloseAll.exe.lnk"
        return
    }
    Send,{Blind}#x
    Send,{Blind}us
    return

; F13 + Pause ; シャットダウン
; F13 + Shift + Pause : 全てのアプリを強制終了してシャットダウン
F13 & Pause::
    if GetKeyState("Shift"){
        Shutdown, 5 ; (アプリの強制終了:4 + シャットダウン:1)
        return
    }
    Shutdown, 1 ; シャットダウン:1
    return

; F13 + r : 元に戻す
; F13 + Shift + r : やり直す(Ctrl + Shift + Z)
F13 & r::
    if GetKeyState("Shift"){
	Send,{Blind}^+z
        return
    }
    Send,{Blind}^z
    return

; F13 + w : 前方の単語の一区切りをクリップボードに履歴を残さず削除(削除)
; F13 + Shift + w : 前方の単語の一区切りをクリップボードに履歴を残して削除(切り取り)
F13 & w::
    if GetKeyState("Shift"){
	  Send,{Blind}{Control Down}{Shift Down}{Left}{Shift Up}{Control Up}^x
        return
    }
    Send,{Blind}{Control Down}{Shift Down}{Left}{Shift Up}{Control Up}{Backspace}
    return

; F13 + u : クリップボードに履歴を残さずカーソル位置から文頭までを一括削除
; F13 + Shift + u : クリップボードに履歴を残してカーソル位置から文頭までを一括削除
F13 & u::
    if GetKeyState("Shift"){
	  Send,{Blind}{Shift Down}{Home}{Shift Up}^x
        return
    }
    Send,{Blind}{Shift Down}{Home}{Shift Up}{Backspace}
    return

; F13 + d : 後方の一文字を削除
; F13 + Shift + d : クリップボードに履歴を残してカーソル位置から文末までを削除
F13 & d::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Down}{End}{Shift Up}^x
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

; F13 + k : クリップボードに履歴を残さずカーソル位置から文末までを一括削除
; F13 + Shift + k : クリップボードに履歴を残して一行を削除
F13 & k::
    if GetKeyState("Shift"){
        Send,{Blind}{Shift Up}{End}{Shift Down}{Home}{Shift Up}^x
        return
    }
    Send,{Blind}{Shift Down}{End}{Shift Up}{Backspace}
    return

; F13 + y : 貼り付け(Ctrl + v)
; F13 + Shift + y : 前に行を挿入して貼り付け
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

; F13 + ↑キー : 上矢印入力
; F13 + Shift + ↑キー : 音量UP
F13 & Up::
    if GetKeyState("Shift"){
        Send,{Volume_Up}
        return
    }
    Send,{U+2191}
    return

; F13 + ↓キー : 下矢印入力
; F13 + Shift + ↓キー : 音量DOWN
F13 & Down::
    if GetKeyState("Shift"){
        Send,{Volume_Down}
        return
    }
    Send,{U+2193}
    return

; F13 + →キー : 右矢印入力
; F13 + Shift + →キー : 次のメディア
F13 & Right::
    if GetKeyState("Shift"){
        Send,{Media_Next}
        return
    }
    Send,{U+2192}
    return

; F13 + ←キー : 左矢印入力
; F13 + Shift + ←キー : 前のメディア
F13 & Left::
    if GetKeyState("Shift"){
        Send,{Media_Prev}
        return
    }
    Send,{U+2190}
    return

; F13 + Endキー : ミュート/ミュート解除
F13 & End:: Send,{Volume_Mute}

; F14: 左クリック
F14::Send,{LButton}

; F14 + 数字キー(1~5)： 各ファンクキー(F1~F5)
F14 & 1::Send,{F1}
F14 & 2::Send,{F2}
F14 & 3::Send,{F3}
F14 & 4::Send,{F4}
F14 & 5::Send,{F5}

; スクリーンショット(Windows + Shift + S)
F14 & s::Send,{Blind}#+s

; 画面動画をキャプチャー(Windows + Alt + R)
F14 & r::Send,{Blind}#!r

; ターミナルを起動
F14 & t::Run,wt.exe

; メモ帳を起動
F14 & w::Run,notepad.exe

; エクスプローラーを起動
F14 & e::Run,explorer.exe

; ダウンロードフォルダを開く
F14 & d::Run,"C:\Users\t_kot\Downloads"

; ペイントを開く
F14 & p::Run,pbrush.exe

; コントロールパネルを開く
F14 & c::Run,control

; VS Codeを起動
F14 & v::Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk"

; Windows + Xメニュー
F14 & x::Send,{Blind}#x

; OneNote クイックノートを起動する
F14 & q::Send,{Blind}#!n

; アプリケーションキー設定
AppsKey::Send,{AppsKey}

; Chromeを起動：アプリケーションキー + C
AppsKey & c::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk"

; Typoraを起動: アプリケーションキー + T
; Todoistを起動: アプリケーションキー + Ctrl + T
AppsKey & t::
    if GetKeyState("Control"){
        Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Todoist.lnk"
        return
    }
    Run,"C:\Program Files\Typora\Typora.exe"
    return

; Kindleを起動: アプリケーションキー + R
Appskey & r::Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Amazon\Amazon Kindle\Kindle.lnk"

; Excelを起動: アプリケーションキー + E
Appskey & e::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"

; Wordを起動: アプリケーションキー + W
Appskey & w::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word.lnk"

; OneNoteを起動: アプリケーションキー + Q
Appskey & q::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote.lnk"

; サクラエディタを起動: アプリケーションキー + S
Appskey & s::Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\サクラエディタ.lnk"

; アプリを終了(ウィンドウを閉じる):(Shift + Backspace)
+Backspace::Send,{Blind}!{F4}

#ifWinActive ahk_exe EXCEL.EXE
AppsKey & V::Send,{Appskey}s{Enter}v{Enter}