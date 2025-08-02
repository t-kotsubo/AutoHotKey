F13 & 0::Send,{Home}
F13 & ^::Send,{Home}{Ctrl Down}{Right}{Ctrl Up}
F13 & m::Send,{Blind}{Enter}
F13 & i::Send,{Blind}^i
F13 & t::Send,{Blind}{Shift Down}{Left}{Shift Up}^x{Right}^v{Left}
F13 & x::Send,{Blind}^x
; F13 + ;(セミコロン): 1行を丸ごとコピーして文末に移動
F13 & `;::Send,{Blind}{Home}{Shift Down}{End}{Shift Up}^c{End}
F13 & [::Send,{Esc}
F13 & sc01C::Send,{Blind}^{Enter} ; F13 + Enter: Ctrl + Enter
F13 & @::Send,{Blind}+\ ; F13 + @: |(パイプ)入力
F13 & sc073::Send,{Blind}^y ; F13 + / やり直す(Ctrl + Y)
F13 & /::Send,{Blind}#/ ; F13 + /: Windows + / (IMEの再変換)
F13 & F16::Shutdown, 2 ; F13 + F16: 再起動
F13 & F15:: ; F13 + F15: 休止モード
    DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
return

; F13 + h: 前方の1文字削除
; F13 + Shift + h: Windowsを左にスナップ
; F13 + Control + .(ドット): 左側のデスクトップに移動
F13 & h::
    if GetKeyState("Shift"){
        Send,{LWin Down}{Shift Down}{Left}{Shift Up}{LWin Up}
        return
    } else if GetKeyState("Control"){
        Send,{Blind}^#{Left}
        return
    }
    Send,{Backspace}
return

; F13 & l: Control + l
; F13 + Shift + l: Windowsを右にスナップ
; F13 + Control + l: 右側のデスクトップに移動
F13 & l::
    if GetKeyState("Shift"){
        Send,{LWin Down}{Shift Down}{Right}{Shift Up}{LWin Up}
        return
    } else if GetKeyState("Control"){
        Send,{Blind}^#{Right}
        return
    }
    Send,{Blind}^l
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
; F13 + Shift + b : 左に移動して複数文字を選択(Shift + ←)
; F13 + Alt + b : 前のページに戻る(Alt + ←)
F13 & b::
    if GetKeyState("Ctrl"){
        Send,{Blind}^{Left}
        return
    } else if GetKeyState("Shift"){
        Send,{Blind}{Shift Down}{Left}{Shift Up}
        return
    } else if GetKeyState("Alt"){
        Send,{Blind}!{Left}
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
; F13 + Shift + c : １行を丸ごとコピーして文頭に移動
F13 & c::
    if GetKeyState("Shift"){
        Send,{Home}{Blind}{Shift Down}{End}{Shift Up}^c{Home}
        return
    }
    Send,{Blind}^c
return

; F13 + f : 右に移動(→)
; F13 + Ctrl + f : 単語単位で右に移動(Ctrl + →)
; F13 + Shift + f : 右に移動して複数文字を選択(Ctrl + →)
; F13 + Alt + f : 次のページに進む(Alt + →)
F13 & f::
    if GetKeyState("Ctrl"){
        Send,{Blind}^{Right}
        return
    } else if GetKeyState("Shift"){
        Send,{Blind}{Shift Down}{Right}{Shift Up}
        return
    } else if GetKeyState("Alt"){
        Send,{Blind}!{Right}
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

; F13 + n ; 下に移動
; F13 + Shift + n : 選択範囲を指定したまま下に移動
; F13 + Control + n : 画面を下にスクロール(Ctrl + ↓)
F13 & n::
    if GetKeyState("Shift"){
        Send,{Blind}+{Down}
        return
    } else if GetKeyState("Control"){
        Send,{Blind}^{Down}
        return
    }
    Send,{Down}
return

; F13 + p ; 上に移動
; F13 + Shift + p : 選択範囲を指定したまま上に移動
; F13 + Control + p : 画面を上にスクロール(Ctrl + ↑)
F13 & p::
    if GetKeyState("Shift"){
        Send,{Blind}+{Up}
        return
    } else if GetKeyState("Control"){
        Send,{Blind}^{Up}
        return
    }
    Send,{Up}
return

; F13 + q: workonaのタブ(Alt + w)を開くショートカットキー
F13 & q::
    Send,{Blind}!w
return

; F13 + F17 ; スリープモード
; F13 + Shift + F17 : シャットダウン
F13 & F17::
    if GetKeyState("Shift"){
        Shutdown, 1 ; シャットダウン:1
        return
    }
    DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
return

; F13 + r : Cliborのショートカットを呼び出し(Ctrl + Shift + Alt + R)
F13 & r::Send,{Blind}^+!r

; F13 + y : やり直す(Ctrl + Y)
F13 & y::Send,{Blind}^y

; F13 + z : 元に戻す
; F13 + Shift + z : やり直す(Ctrl + Shift + Z)
F13 & z::
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

; F13 + Shift + j : Windowを最小化
; F13 + Control + j : タスクビュー切替
F13 & j::
    if GetKeyState("Shift"){
        Send,{LWin Down}{Down}{LWin Up}
        return
    } else if GetKeyState("Control"){
        Send,{LWin Down}{Tab}{LWin Up}
        return
    }
return

; F13 + k : カーソル位置から文末までを一括削除
; F13 + Shift + k : Windowsを最大化
F13 & k::
    if GetKeyState("Shift"){
        Send,{LWin Down}{Up}{LWin Up}
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

; F13 + ↑キー : タスクビュー切替
; F13 + Control + ↑キー : 上矢印入力
; F13 + Shift + ↑キー : Windowを最大化
F13 & Up::
    if GetKeyState("Control"){
        Send,{U+2191}
        return
    } else if GetKeyState("Shift"){
        Send,{LWin Down}{Up}{LWin Up}
        return
    }
    Send,{Blind}#{Tab}
return

; F13 + ↓キー : タスクビュー切替
; F13 + Control + ↓キー : 下矢印入力
; F13 + Shift + ↓キー : Windowを最小化
F13 & Down::
    if GetKeyState("Control"){
        Send,{U+2193}
        return
    } else if GetKeyState("Shift"){
        Send,{LWin Down}{Down}{LWin Up}
        return
    }
    Send,{Blind}#{Tab}
return

; F13 + →キー : 右側のデスクトップに移動
; F13 + Control + →キー : 右矢印入力
; F13 + Shift + →キー : Windowを右画面にスナップ
F13 & Right::
    if GetKeyState("Control"){
        Send,{U+2192}
        return
    } else if GetKeyState("Shift"){
        Send,{LWin Down}{Shift Down}{Right}{Shift Up}{LWin Up}
        return
    }
    Send,{Blind}^#{Right}
return

; F13 + ←キー : 左側のデスクトップに移動
; F13 + Control + ←キー : 左矢印入力
; F13 + Shift + ←キー : Windowを左画面にスナップ
F13 & Left::
    if GetKeyState("Control"){
        Send,{U+2190}
        return
    } else if GetKeyState("Shift"){
        Send,{LWin Down}{Shift Down}{Left}{Shift Up}{LWin Up}
        return
    }
    Send,{Blind}^#{Left}
return

; F13 + PageUpキー : 音量UP(2段階)
; F13 + Shift + PageUpキー : 音量UP(1段階)
F13 & PgUp::
    if GetKeyState("Shift"){
        SoundSet, +1
        return
    }
    Send,{Volume_Up}
return

; F13 + PageDownキー : 音量Down(2段階)
; F13 + Shift + PageDownキー : 音量Down(1段階)
F13 & PgDn::
    if GetKeyState("Shift"){
        SoundSet, -1
        return
    }
    Send,{Volume_Down}
return

; F13 + Endキー : ミュート/ミュート解除
F13 & End:: Send,{Volume_Mute}

; タブを左に移動: F13 + 左クリック
; スクリーンショット: F13 + Shift + 左クリック
; 中央クリック: F13 + Control + 左クリック
F13 & LButton::
    if GetKeyState("Shift"){
        Send,{Blind}#+s
        return
    } else if GetKeyState("Control"){
        MouseClick, Middle
        return
    }
    Send,{Blind}{Ctrl Down}{PgUp}{Ctrl Up}
return

; タブを右に移動: F13 + 右クリック
; メモ帳を起動: F13 + Shift + 右クリック
; 画面動画をキャプチャー(RecExpertsを起動): F13 + Control + 右クリック
F13 & RButton::
    if GetKeyState("Shift"){
        Run,notepad.exe
        return
    } else if GetKeyState("Control"){
        Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EaseUS RecExperts\EaseUS RecExperts.lnk"
        return
    }
    Send,{Blind}{Ctrl Down}{PgDn}{Ctrl Up}
return

; F13 + Shift + .(ドット): 右のタブに移動(Ctrl + tab)
F13 & .::Send,{Blind}^{Tab}

; F13 + Shift + ,(カンマ): 左のタブに移動(Ctrl + Shift + tab)
F13 & ,::Send,{Blind}{Ctrl Down}{Shift Down}{Tab}{Shift Up}{Ctrl Up}

; F14: 左クリック
F14::Send,{LButton}

; F14 + Shift: 右クリック
+F14::Send,{RButton}

; F14 + 数字キー(1~5)： 各ファンクキー(F1~F5)
F14 & 1::Send,{F1}
F14 & 2::Send,{F2}
F14 & 3::Send,{F3}
F14 & 4::Send,{F4}
F14 & 5::Send,{F5}

; 画面動画をキャプチャー(RecExpertsを起動)
F14 & r::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EaseUS RecExperts\EaseUS RecExperts.lnk"

; サクラエディタを起動
F14 & s::Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\sakura-editor.lnk"

; ターミナルを起動
F14 & t::Run,wt.exe

; メモ帳を起動
F14 & w::Run,notepad.exe

; エクスプローラーを起動
F14 & e::Run,explorer.exe

; Docker Desktopを起動
F14 & d::Run,"C:\Program Files\Docker\Docker\Docker Desktop.exe"

; ペイントを開く
F14 & p::Run,pbrush.exe

; コントロールパネルを開く
F14 & c::Run,control

; Windows + Xメニュー
F14 & x::Send,{Blind}#x

; OneNote クイックノートを起動する
F14 & q::Send,{Blind}#!n

; アプリを終了(ウィンドウ)を閉じる
F14 & z::Send,{Blind}!{F4}

; アプリケーションキー設定
AppsKey::Send,{AppsKey}

; Notionを起動：AppsKeyキー + 1
AppsKey & 1::Run,"C:\Users\takayuki_kotsubo\AppData\Local\Programs\Notion\Notion.exe"

; 電卓を起動：AppsKeyキー + 2
AppsKey & 2::Run,"C:\Shortcuts\Calculator.lnk"

; Chromeを起動：アプリケーションキー + C
; Copilot(Windows)を起動: アプリケーションキー + Ctrl + C
AppsKey & c::
    if GetKeyState("Control"){
        Run,"C:\Shortcuts\Copilot.lnk"
        return
    }
    Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk"
return

; Glary Utilitiesを起動：アプリケーションキー + G
; ChatGPTを起動：アプリケーションキー + Ctrl + G
AppsKey & g::
    if GetKeyState("Control"){
        Run,"C:\Shortcuts\ChatGPT.lnk"
        return
    }
    Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Glary Utilities.lnk"
return

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

; エクスプローラーを起動: アプリケーションキー + E
; Excelを起動: アプリケーションキー + Ctrl + E
AppsKey & e::
    if GetKeyState("Control"){
        Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Excel.lnk"
        return
    }
    Run,explorer.exe
return

; ダウンロードフォルダを開く: アプリケーションキー + D
; DBeaverを起動: アプリケーションキー + Ctrl + D
AppsKey & d::
    if GetKeyState("Control"){
        Run,"C:\Users\takayuki_kotsubo\AppData\Local\DBeaver\dbeaver.exe"
        return
    }
    Run,"C:\Users\takayuki_kotsubo\Downloads"
return

; Focus To-Doを起動: アプリケーションキー + F
AppsKey & f::Run,"C:\Shortcuts\Focus To-Do.lnk"

; WinMergeを起動: アプリケーションキー + W
AppsKey & w::Run,"C:\Program Files\WinMerge\WinMergeU.exe"

; OneNoteを起動: アプリケーションキー + Q
AppsKey & q::Run,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneNote 2016.lnk"

; Sticky Notes(new)を起動: アプリケーションキー + S
; Slackを起動: アプリケーションキー + Ctrl + S
AppsKey & s::
    if GetKeyState("Control"){
        Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Slack Technologies Inc\Slack.lnk"
        return
    }
    Run,"C:\Shortcuts\Stickey Notes.lnk"
return

; Xmindを起動: アプリケーションキー + X
AppsKey & x::Run,"C:\Users\takayuki_kotsubo\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Xmind.lnk"

; Amazon Musicを起動: アプリケーションキー + A
; A5M2を起動: アプリケーションキー + Ctrl + A
AppsKey & a::
    if GetKeyState("Control"){
        Run,"C:\Users\t_kot\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\A5M2.lnk"
        return
    }
    Run,"C:\Shortcuts\Amazon Music.lnk"
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

; Excel起動時のみ
#ifWinActive ahk_exe EXCEL.EXE
    AppsKey & v::Send,{AppsKey}s{Enter}v{Enter} ; 値のみ貼り付け
    F14 & f::Send,{Alt}hba ; テーブルの枠線をつける
    F14 & c::Send,{Alt}oca ; 列幅の自動調整
    F14 & r::Send,{Alt}ora ; 行幅の自動調整
#IfWinActive

; VS Code内でのVimコマンド設定
#IfWinActive ahk_exe Code.exe
    ; F13 + g - 指定の行に移動 (Vimの":{行番号}コマンド)
    F13 & g::Send,{Blind}^g
    ; F13 + c - システムクリップボードにコピー (Vimの"+yコマンド)
    F13 & c::
        Send,"
        Send,{+}
        Send,y
    return
    ; F13 + v - システムクリップボードから貼り付け (Vimの"+pコマンド)
    F13 & v::
        if GetKeyState("Shift"){
            Send,"
            Send,{+}
            Send,{Blind}+p
            return
        }
        Send,"
        Send,{+}
        Send,p
    return
    ; F13 + Shift + ,(カンマ) - gT(左のタブに移動)
    F13 & ,::Send,gT
    ; F13 + Shift + .(ドット) - gt(右のタブに移動)
    F13 & .::Send,gt
    ; F14 + a - すべてのタブを閉じる
    ; F14 + F13 + a - すべてのタブを保存して閉じる
    F14 & a::
        if GetKeyState("F13"){
            Send,:wqa{Enter}
            return
        }
        Send,:qa{Enter}
    return
    ; F14 + v - ファイルを指定してタブ(Window)を左右に分割
    F14 & v::
        Send,:vsp{Space}
    return
    ; F14 + x - 現在アクティブなエディタ(ウィンドウ)のみを閉じる(F14 + vと組み合わせて使用)
    F14 & x::
        Send,:close{Enter}
    return
    ; F14 + t - 現在アクティブなタブページ以外のすべてのタブページを閉じる
    F14 & t::
        Send,:tabonly{Enter}
    return
    ; F14 + e - ファイルを開く
    F14 & e::
        Send,:e{Space}
    return
    ; F14 + w - 単語を選択
    F14 & w::
        Send,viw
    return
    ; F14 + c - 単語を全体を削除して挿入モードに移行
    F14 & c::
        Send,ciw
    return
    ; F14 + s - vim-surroundの「cs」コマンド
    F14 & s::
        Send,cs
    return
    ; F14 + d - vim-surroundの「ds」コマンド
    F14 & d::
        Send,ds
    return
    ; F14 + f -「:marks」でマーク一覧を表示
    F14 & f::
        Send,:marks
        Send,{Enter}
    return
    ; F14 + r：「:reg」でレジスタ一覧を表示
    F14 & r::
        Send,:reg
        Send,{Enter}
    return
    ; F14 + q：「:reg a-z A-Z」でマクロを含むレジスタ一覧を表示
    F14 & q::
        Send,:reg a-z A-Z
        Send,{Enter}
    return
#IfWinActive
