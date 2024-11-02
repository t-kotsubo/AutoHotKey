# AutoHotkey 運用ガイド

## 目次
- [基本的なキーマッピング記法](#基本的なキーマッピング記法)
- [修飾キーの組み合わせ](#修飾キーの組み合わせ)
- [特殊キー](#特殊キー)
- [基本的なコーディング構文](#基本的なコーディング構文)
- [アプリケーション起動スクリプト例](#アプリケーション起動スクリプト例)
- [よく使う関数とコマンド](#よく使う関数とコマンド)
- [トラブルシューティング](#トラブルシューティング)

## 基本的なキーマッピング記法

### 修飾キー
| 記号 | キー |
|------|------|
| ^ | Ctrl |
| + | Shift |
| ! | Alt |
| # | Windows |

### 基本的な書式
```autohotkey
修飾キー & キー::
    実行したいコマンド
return
```

例：
```autohotkey
^a::  ; Ctrl + A
+b::  ; Shift + B
!c::  ; Alt + C
#d::  ; Windows + D
```

## 修飾キーの組み合わせ

複数の修飾キーを組み合わせることができます：

```autohotkey
^!a::  ; Ctrl + Alt + A
+#b::  ; Shift + Windows + B
^+c::  ; Ctrl + Shift + C
```

## 特殊キー

| 記述 | キー |
|------|------|
| Space | スペース |
| Tab | タブ |
| Enter | エンター |
| Esc | エスケープ |
| BS | バックスペース |
| Del | デリート |
| Ins | インサート |
| Home | ホーム |
| End | エンド |
| PgUp | ページアップ |
| PgDn | ページダウン |
| Up | 上矢印 |
| Down | 下矢印 |
| Left | 左矢印 |
| Right | 右矢印 |
| AppsKey | アプリケーションキー |
| PrintScreen | プリントスクリーン |
| SC029 | 半角/全角 |
| VKF3 | 変換 |
| VKF4 | 無変換 |

## 基本的なコーディング構文

### 変数
```autohotkey
MyVar := "Hello"  ; 変数の代入
```

### 条件分岐
```autohotkey
if (条件) {
    ; 処理
} else if (条件) {
    ; 処理
} else {
    ; 処理
}
```

### GetKeyState関数の使用
```autohotkey
if GetKeyState("Control") {
    ; Controlキーが押されている時の処理
}
```

### メッセージボックス
```autohotkey
MsgBox, テキストメッセージ
```

## アプリケーション起動スクリプト例

### 通常のデスクトップアプリケーション
```autohotkey
^!a::
    Run, "C:\Program Files\Application\App.exe"
return
```

### Microsoft Storeアプリ
```autohotkey
^!b::
    Run, shell:AppsFolder\PackageFamilyName!App
return
```

### 条件付き起動
```autohotkey
^!c::
    if GetKeyState("Shift") {
        Run, "C:\Path\To\App1.exe"
    } else {
        Run, "C:\Path\To\App2.exe"
    }
return
```

## よく使う関数とコマンド

### ウィンドウ操作
```autohotkey
WinActivate, タイトル  ; ウィンドウをアクティブ化
WinClose, タイトル     ; ウィンドウを閉じる
WinMinimize, タイトル  ; ウィンドウを最小化
WinMaximize, タイトル  ; ウィンドウを最大化
```

### クリップボード操作
```autohotkey
clipboard := "テキスト"  ; クリップボードにコピー
Send, ^v               ; ペースト
```

### ファイル・フォルダ操作
```autohotkey
FileCreateDir, パス    ; フォルダ作成
FileDelete, パス       ; ファイル削除
FileMove, 元, 先       ; ファイル移動
FileCopy, 元, 先       ; ファイルコピー
```

## トラブルシューティング

### よくあるエラーと解決方法

1. パス指定のエラー
   - ダブルクォートの確認
   - パスの存在確認
   - 管理者権限の確認

2. キーの組み合わせが機能しない
   - 他のアプリケーションとの競合確認
   - スクリプトの実行権限確認
   - 構文エラーの確認

3. Microsoft Storeアプリが起動しない
   - PackageFamilyNameの確認
   - `shell:AppsFolder`の構文確認
   - `!App`の指定確認

### デバッグ方法

```autohotkey
; デバッグメッセージの表示
MsgBox, % "変数の値: " . MyVar

; ログファイルへの書き込み
FileAppend, ログメッセージ`n, log.txt
```

### スクリプトのリロード
- `Reload`コマンドの使用
```autohotkey
^r::Reload  ; Ctrl + Rでスクリプトをリロード
```

---

## 補足情報

### コメントの書き方
```autohotkey
; 1行コメント

/*
  複数行
  コメント
*/
```

### ホットストリング（テキスト置換）
```autohotkey
::btw::by the way
::asap::as soon as possible
```

### 推奨される命名規則
- 変数名: キャメルケース (myVariable)
- ラベル: パスカルケース (MyLabel)
- ホットキー: 分かりやすい説明をコメントで

---

## Microsoft Storeからインストールしたアプリの起動の設定方法

1. Windowsキー + rで「ファイルを指定して実行」を起動

2. 「shell:AppsFolder」と入力

3. 起動したアプリのアイコンを右クリックしてショートカットを作成

4. 作成したショートカットを任意のフォルダ(例`C:\Shortcuts`)を作成して設置

5. 設置したショートカットをAutoHotKeyのスクリプトで実行

   ```
   Run, "C:\Shortcuts\Amazon Music.lnk"
   ```
