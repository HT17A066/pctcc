@echo off
:PCToColorCylinder�̃e�X�g

:�l�[�~���O�T�[�r�X�̊m�F
rtls /localhost > nul
if errorlevel 1 (
  echo �l�[�~���O�T�[�o��������܂���
  pause
  exit /b 1
  rem /b�I�v�V�����͐e���I��点�Ȃ����߂ɕK�{
)


:�R���|�[�l���g�̋N��
call ..\RealSense2ToPC\RealSense2ToPC.bat
call ..\PCToColorCylinder-private\PCToColorCylinder.bat

:�R���|�[�l���g����ϐ���
set k=/localhost/\RealSense2ToPC0.rtc
set c=/localhost/PCToColorCylinder0.rtc

:���ԑ҂�
timeout 5

:�ڑ�
rtcon %k%:pc %c%:pc

:�A�N�e�B�x�[�g
rtact %k% %c%

:loop
set /p ans="�I�����܂����H (y/n)"
if not "%ans%"=="y" goto loop

:�f�B�A�N�e�B�x�[�g
rtdeact %k% %c%

:�I���irtexit�́C����������j
for %%i in (%k% %c%) do (
  rtexit %%i
)
