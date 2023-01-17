cls
@echo off
set sqlite_data_path=%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config.sqlite
echo ======================================================
echo CLIPSTUDIO IE/Edge表示設定変更 by kawa-nobu(@kw_nobu)
echo ======================================================
echo.
echo CLIPSTUDIOの表示設定により、
echo アプリ自体の動作が停止する問題を解決できるかもしれない非公式ツールです。
echo 変更前にデータをバックアップしますが、自己責任でご使用ください。
echo.
echo 本バッチはSQLiteの公式バイナリを使用しています。
echo 最新のバイナリや、バイナリが安全かどうか気になる場合は
echo https://www.sqlite.org/download.html
echo より、バイナリをダウンロードして上書きしてください。
echo.
echo !=================22-01-17(Update)===================!
echo 公式より情報が公開されていました。
echo 参考URL:https://support.clip-studio.com/ja-jp/faq/articles/20230001
echo 4番の処理は公式が公開した方法を自動化しています。
echo 作成者は4番選択を推奨します。
echo 4番の処理はSQLiteバイナリ無しで実行できます。
echo !====================================================!
echo.
echo 1.現在の情報を取得(まず初めに行うことを推奨)
echo 2.IEモードに変更(動作を改善させるにはこれ!)
echo 3.Edgeモードに変更(動作が止まる現象が発生する可能性あり。)
echo 4.Config削除(公式情報自動化)※公式の情報を自動化させたものです。←(推奨)
echo 5.このバッチを終了します。
echo.

echo 行いたい動作の1~5入力してEnterを押下してください。
SET /P ans="動作モードを入力(1~5)>"

if /i {%ans%}=={1} (goto :pr1)
if /i {%ans%}=={2} (goto :pr2)
if /i {%ans%}=={3} (goto :pr3)
if /i {%ans%}=={4} (goto :pr4)
if /i {%ans%}=={5} (goto :pr5)

exit

:pr1
cls
echo 現在の設定を表示します。
echo "PW_ID(不明)|ClipStudioアプリバージョン|IE表示モードON・OFF"
echo 出力結果
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo 出力結果の末尾が「0」の場合、Edgeモードがオンになっており
echo 動作が止まっている現象が発生している可能性があります。
echo 次の画面で2番を選択し実行すれば、改善される可能性があります。
echo.
pause
%~dp0Start.bat


:pr2
cls
echo IEモードに変更
echo 表示モードをIEモードに変更し、動作を改善します。
echo.
echo 変更前データをコピーします。
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_IEMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo 変更前データをコピーしました。以下、ファイルパス
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_IEMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo 値を変更します。
%~dp0sqlite3 %sqlite_data_path% "UPDATE main.Other SET UseIEWebView = 1;"
echo 値の変更が完了しました。以下、実行後結果
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo 末尾が「1」になっている場合、動作モードの変更が完了しています。
echo CLIPSTUDIOアプリの起動をお試しください。
pause
%~dp0Start.bat

:pr3
cls
echo Edgeモードに変更
echo 表示モードをEdgeモードに変更します。(変更後、動作が止まる可能性あり)
echo.
echo 変更前データをコピーします。
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_EdgeMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo 変更前データをコピーしました。以下、ファイルパス
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_EdgeMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo 値を変更します。
%~dp0sqlite3 %sqlite_data_path% "UPDATE main.Other SET UseIEWebView = 0;"
echo 値の変更が完了しました。以下、実行後結果
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo 末尾が「0」になっている場合、動作モードの変更が完了しています。
echo CLIPSTUDIOアプリの起動をお試しください。
pause
%~dp0Start.bat

:pr4
cls
echo Config削除(公式情報自動化)
echo 公式情報を元に参考にした処理を自動化したものです。
echo 参考URL
echo https://support.clip-studio.com/ja-jp/faq/articles/20230001
echo.
echo 変更前データをコピーします。
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_BackUp_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo 変更前データをコピーしました。以下、ファイルパス
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_BackUp_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo 現在のConfigデータを削除します。
del %sqlite_data_path%
echo 削除が完了しました。
echo.
echo CLIPSTUDIOアプリの起動をお試しください。
pause
%~dp0Start.bat

:pr5
exit