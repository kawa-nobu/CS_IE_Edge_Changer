cls
@echo off
set sqlite_data_path=%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config.sqlite
echo ======================================================
echo CLIPSTUDIO IE/Edge�\���ݒ�ύX by kawa-nobu(@kw_nobu)
echo ======================================================
echo.
echo CLIPSTUDIO�̕\���ݒ�ɂ��A
echo �A�v�����̂̓��삪��~������������ł��邩������Ȃ�������c�[���ł��B
echo �ύX�O�Ƀf�[�^���o�b�N�A�b�v���܂����A���ȐӔC�ł��g�p���������B
echo.
echo �{�o�b�`��SQLite�̌����o�C�i�����g�p���Ă��܂��B
echo �ŐV�̃o�C�i����A�o�C�i�������S���ǂ����C�ɂȂ�ꍇ��
echo https://www.sqlite.org/download.html
echo ���A�o�C�i�����_�E�����[�h���ď㏑�����Ă��������B
echo.
echo !=================22-01-17(Update)===================!
echo ��������񂪌��J����Ă��܂����B
echo �Q�lURL:https://support.clip-studio.com/ja-jp/faq/articles/20230001
echo 4�Ԃ̏����͌��������J�������@�����������Ă��܂��B
echo �쐬�҂�4�ԑI���𐄏����܂��B
echo 4�Ԃ̏�����SQLite�o�C�i�������Ŏ��s�ł��܂��B
echo !====================================================!
echo.
echo 1.���݂̏����擾(�܂����߂ɍs�����Ƃ𐄏�)
echo 2.IE���[�h�ɕύX(��������P������ɂ͂���!)
echo 3.Edge���[�h�ɕύX(���삪�~�܂錻�ۂ���������\������B)
echo 4.Config�폜(������񎩓���)�������̏������������������̂ł��B��(����)
echo 5.���̃o�b�`���I�����܂��B
echo.

echo �s�����������1~5���͂���Enter���������Ă��������B
SET /P ans="���샂�[�h�����(1~5)>"

if /i {%ans%}=={1} (goto :pr1)
if /i {%ans%}=={2} (goto :pr2)
if /i {%ans%}=={3} (goto :pr3)
if /i {%ans%}=={4} (goto :pr4)
if /i {%ans%}=={5} (goto :pr5)

exit

:pr1
cls
echo ���݂̐ݒ��\�����܂��B
echo "PW_ID(�s��)|ClipStudio�A�v���o�[�W����|IE�\�����[�hON�EOFF"
echo �o�͌���
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo �o�͌��ʂ̖������u0�v�̏ꍇ�AEdge���[�h���I���ɂȂ��Ă���
echo ���삪�~�܂��Ă��錻�ۂ��������Ă���\��������܂��B
echo ���̉�ʂ�2�Ԃ�I�������s����΁A���P�����\��������܂��B
echo.
pause
%~dp0Start.bat


:pr2
cls
echo IE���[�h�ɕύX
echo �\�����[�h��IE���[�h�ɕύX���A��������P���܂��B
echo.
echo �ύX�O�f�[�^���R�s�[���܂��B
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_IEMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo �ύX�O�f�[�^���R�s�[���܂����B�ȉ��A�t�@�C���p�X
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_IEMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo �l��ύX���܂��B
%~dp0sqlite3 %sqlite_data_path% "UPDATE main.Other SET UseIEWebView = 1;"
echo �l�̕ύX���������܂����B�ȉ��A���s�㌋��
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo �������u1�v�ɂȂ��Ă���ꍇ�A���샂�[�h�̕ύX���������Ă��܂��B
echo CLIPSTUDIO�A�v���̋N�������������������B
pause
%~dp0Start.bat

:pr3
cls
echo Edge���[�h�ɕύX
echo �\�����[�h��Edge���[�h�ɕύX���܂��B(�ύX��A���삪�~�܂�\������)
echo.
echo �ύX�O�f�[�^���R�s�[���܂��B
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_EdgeMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo �ύX�O�f�[�^���R�s�[���܂����B�ȉ��A�t�@�C���p�X
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_EdgeMode_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo �l��ύX���܂��B
%~dp0sqlite3 %sqlite_data_path% "UPDATE main.Other SET UseIEWebView = 0;"
echo �l�̕ύX���������܂����B�ȉ��A���s�㌋��
%~dp0sqlite3 %sqlite_data_path% "SELECT * FROM Other UseIEWebView;"
echo.
echo �������u0�v�ɂȂ��Ă���ꍇ�A���샂�[�h�̕ύX���������Ă��܂��B
echo CLIPSTUDIO�A�v���̋N�������������������B
pause
%~dp0Start.bat

:pr4
cls
echo Config�폜(������񎩓���)
echo �����������ɎQ�l�ɂ����������������������̂ł��B
echo �Q�lURL
echo https://support.clip-studio.com/ja-jp/faq/articles/20230001
echo.
echo �ύX�O�f�[�^���R�s�[���܂��B
copy %sqlite_data_path% "%APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_BackUp_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite"
echo �ύX�O�f�[�^���R�s�[���܂����B�ȉ��A�t�@�C���p�X
echo %APPDATA%\CELSYSUserData\CELSYS\CLIPStudioVer1_5_0\Preference\Config_BackUp_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.sqlite
echo.
echo ���݂�Config�f�[�^���폜���܂��B
del %sqlite_data_path%
echo �폜���������܂����B
echo.
echo CLIPSTUDIO�A�v���̋N�������������������B
pause
%~dp0Start.bat

:pr5
exit