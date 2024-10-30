F13 & p::Send,{Up}
F13 & n::Send,{Down}
F13 & 0::Send,{Home}
F13 & h::Send,{Backspace}
F13 & l::Send,{Blind}^l
F13 & m::Send,{Blind}{Enter}
F13 & i::Send,{Blind}^i
F13 & t::Send,{Blind}{Shift Down}{Left}{Shift Up}^x{Right}^v{Left}
F13 & x::Send,{Blind}^x
F13 & z::Send,{Blind}#!z ; Cliborのショートカットを呼び出し
; F13 + ;(セミコロン): 1行を丸ごとコピー
F13 & `;::Send,{Blind}{Home}{Shift Down}{End}{Shift Up}^c{End}
F13 & [::Send,{Esc}
F13 & sc01C::Send,{Blind}^{Enter} ; F13 + Enter: Ctrl + Enter
F13 & @::Send,{Blind}+\ ; F13 + @: |(パイプ)入力
F13 & sc073::Send,{Blind}^y ; F13 + / やり直す(Ctrl + Y)
F13 & ScrollLock::Shutdown, 2 ; F13 + ScrollLock: 再起動
F13 & PrintScreen:: ; F13 + PrintScreen: 休止モード
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    return

; F13 + a : 行の先頭に移動
; F13 + Shift + a : カーソル位置から文頭までを一括選択
; F13 + Control + a : ドキュメントの先頭に移動
F13 & a::
    if GetKeyState("Shift"){
	  Send,{Blind}{Shift Down}{Home}{Shift Up}
      return
    } else if GetKeyState("Ctrl"){
        Send,{Blind}^{Home}
        return
    }
    Send,{Home}
    return

; F13 + b : 左に移動(←)
; F13 + Ctrl + b : 単語単位で左に移動(Ctrl + ←)
F13 & b::
    if GetKeyState("Ctrl"){
        Send,{Blind}^{Left}
        return
    }
    Send,{Left}
    return

; F13 + e : 行の末尾に移動
; F13 + Shift + e : カーソル位置から文末までを一括選択
; F13 + Control + e : ドキュメントの末尾に移動
F13 & e::
    if GetKeyState("Shift"){
	  Send,{Blind}{Shift Down}{End}{Shift Up}
      return
    } else if GetKeyState("Ctrl"){
        Send,{Blind}^{End}
        return
    }
    Send,{End}
    return

; F13 + c : 選択範囲をコピー(Ctrl + cと同じ)
; F13 + Shift + c : クリップボードに履歴を残してカーソル位置から文頭までを一括コピー
F13 & c::
    if GetKeyState("Shift"){
	  Send,{Home}{Blind}{Shift Down}{End}{Shift Up}^c
      return
    }
    Send,{Blind}^c
    return

; F13 + f : 右に移動(→)
; F13 + Ctrl + f : 単語単位で右に移動(Ctrl + →)
F13 & f::
    if GetKeyState("Ctrl"){
        Send,{Blind}^{Right}
        return
    }
    Send,{Right}
    return

; F13 + Delete ; アプリを終了(ウィンドウ)を閉じる
; F13 + Shift + Delete : 全てのウィンドウを閉じる(CloseAllのアプリを実行)
F13 & Delete::
    if GetKeyState("Shift"){
        Run,"C:\Users\takayuki_kotsubo\CloseAll.exe"
        return
    }
    Send,{Blind}!{F4}
    return

; F13 + Pause ; スリープ
; F13 + Shift + Pause : シャットダウン
F13 & Pause::
    if GetKeyState("Shift"){
      Shutdown, 1 ; シャットダウン:1
      return
    }
    Send,{Blind}^d
    Send,{Blind}#x
    Send,u
    Send,s
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

; F13 + v : 貼り付け(Ctrl + v)
; F13 + Shift + v : 前に行を挿入して貼り付け
F13 & v::
    if GetKeyState("Shift"){
      Send,{Home}{Enter}{Up}^v
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

; F13 + ↑キー : デスクトップ管理画面
; F13 + Shift + ↑キー : 上矢印入力
F13 & Up::
    if GetKeyState("Shift"){
    Send,{U+2191}
    return
    }
    Send,{Blind}#{Tab}
    return

; F13 + ↓キー : デスクトップ管理画面
; F13 + Shift + ↓キー : 下矢印入力
F13 & Down::
    if GetKeyState("Shift"){
      Send,{U+2193}
      return
    }
    Send,{Blind}#{Tab}
    return

; F13 + →キー : 右側のデスクトップに移動
; F13 + Shift + →キー : 右矢印キー
F13 & Right::
    if GetKeyState("Shift"){
      Send,{U+2192}
      return
    }
    Send,{Blind}^#{Right}
    return

; F13 + ←キー : 左側のデスクトップに移動
; F13 + Shift + ←キー : 左矢印入力
F13 & Left::
    if GetKeyState("Shift"){
      Send,{U+2190}
      return
    }
    Send,{Blind}^#{Left}
    return

; F13 + PageUpキー : 音量UP
F13 & PgUp:: Send,{Volume_Up}

; F13 + PageDownキー : 音量Down
F13 & PgDn:: Send,{Volume_Down}

; F13 + Endキー : ミュート/ミュート解除
F13 & End:: Send,{Volume_Mute}

; タブを左に移動: F13 + 左クリック
; スクリーンショット: F13 + Shift + 左クリック
; 中央クリック: F13 + Control + 左クリック
F13 & LButton::
    if GetKeyState("Shift"){
        Send,{Blind}#+s
        return
    }
    if GetKeyState("Control"){
        MouseClick, Middle
        return
    }
    Send,{Blind}{Ctrl Down}{PgUp}{Ctrl Up}
    return

; タブを右に移動: F13 + 右クリック
; 画面動画をキャプチャー(RecExpertsを起動): F13 + Shift + 右クリック
; メモ帳を起動: F13 + Control + 右クリック
F13 & RButton::
    if GetKeyState("Shift"){
        Run,notepad.exe
        return
    }
    if GetKeyState("Control"){
        Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EaseUS RecExperts\EaseUS RecExperts.lnk"
        return
    }
    Send,{Blind}{Ctrl Down}{PgDn}{Ctrl Up}
    return

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
F14 & r::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EaseUS RecExperts\EaseUS RecExperts.lnk"

; ターミナルを起動
F14 & t::Run,wt.exe

; メモ帳を起動
F14 & w::Run,notepad.exe

; エクスプローラーを起動
F14 & e::Run,explorer.exe

; ダウンロードフォルダを開く
F14 & d::Run,"C:\Users\takayuki_kotsubo\Downloads"

; ペイントを開く
F14 & p::Run,pbrush.exe

; コントロールパネルを開く
F14 & c::Run,control

; Windows + Xメニュー
F14 & x::Send,{Blind}#x

; OneNote クイックノートを起動する
F14 & q::Send,{Blind}#!n

; アプリケーションキー設定
AppsKey::Send,{AppsKey}

; Notionを起動：AppsKeyキー + 1
AppsKey & 1::Run,"C:\Users\takayuki_kotsubo\AppData\Local\Programs\Notion\Notion.exe"

; Chromeを起動：アプリケーションキー + C
AppsKey & c::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk"

; GOM Playerを起動：アプリケーションキー + G
AppsKey & g::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\GOM\GOM Player Plus.lnk"

; Typoraを起動: アプリケーションキー + T
; PowerShellを起動: アプリケーションキー + Ctrl + T
AppsKey & t::
    if GetKeyState("Control"){
      Run,"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
      return
    }
    Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Typora\Typora.lnk"
    return

; Kindleを起動: アプリケーションキー + R
AppsKey & r::Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Amazon\Amazon Kindle\Kindle.lnk"

; Excelを起動: アプリケーションキー + E
AppsKey & e::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"

; Dockerを起動: アプリケーションキー + D
; DBeaverを起動: アプリケーションキー + Ctrl + D
AppsKey & d::
    if GetKeyState("Control"){
      Run,"C:\Users\takayuki_kotsubo\AppData\Local\DBeaver\dbeaver.exe"
      return
    }
    Run,"C:\Program Files\Docker\Docker\Docker Desktop.exe"
    return

; WinMergeを起動: アプリケーションキー + W
AppsKey & w::Run,"C:\Program Files\WinMerge\WinMergeU.exe"

; OneNoteを起動: アプリケーションキー + Q
AppsKey & q::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote 2016.lnk"

; サクラエディタを起動: アプリケーションキー + S
; Slackを起動: アプリケーションキー + Ctrl + S
AppsKey & s::
    if GetKeyState("Control"){
      Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Slack Technologies Inc\Slack.lnk"
      return
    }
    Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\sakura-editor.lnk"
    return

; Xmindを起動: アプリケーションキー + X
AppsKey & x::Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Xmind.lnk"

; A5M2を起動: アプリケーションキー + A
; Asanaを起動: アプリケーションキー + Ctrl + A
AppsKey & a::
    if GetKeyState("Control"){
	  Run,"C:\Users\t_kot\AppData\Local\Asana\Asana.exe"
      return
    }
    Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\A5M2.lnk"
    return

; VS Codeを起動: AppsKeyキー + V
; Visual Studio 2022を起動: AppsKeyキー + Ctrl + V
AppsKey & v::
    if GetKeyState("Control"){
        Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Visual Studio 2022.lnk"
        return
    }
    Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk"
    return

; Excel起動時のみ：値のみ貼り付け
#ifWinActive ahk_exe EXCEL.EXE
AppsKey & v::Send,{AppsKey}s{Enter}v{Enter}

; Excel起動時のみ：テーブルの枠線をつける
#ifWinActive ahk_exe EXCEL.EXE
F14 & f::Send,{Alt}hba
