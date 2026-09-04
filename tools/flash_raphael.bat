@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
title Automação de Flash - Mi 9T Pro / K20 Pro (crDroid Raphael Edition)
color 0A

echo ============================================================
echo   AUTOMAÇÃO DE FLASH VIA ADB SIDELOAD - MI 9T PRO (RAPHAEL)
echo   crDroid Raphael Edition (Android 13) - by Jairo Rossi
echo ============================================================
echo.
echo Certifique-se de que este script esta na MESMA PASTA dos zips!
echo.
pause

:: 1. Script Retrofit Dynamic
call :flash_zip "legacy to retrofit dynamic by @raphael_alpha.zip" "1/5 - Script Retrofit Dynamic"

:: AVISO MANUAL
cls
color 0E
echo ============================================================
echo [!] ACAO MANUAL NECESSARIA NO RECOVERY (ORANGEFOX / TWRP)
echo ============================================================
echo.
echo 1. No Recovery, saia do modo ADB Sideload.
echo 2. Va em Wipe > Advanced Wipe.
echo 3. MARQUE AS OPCOES:
echo    [X] Dalvik / ART Cache
echo    [X] Cache
echo    [X] Data
echo    [X] Metadata
echo 4. Arraste a barra para confirmar o Wipe.
echo 5. Va no menu principal > Reboot > Recovery (Obrigatorio!).
echo 6. Quando o Recovery reiniciar, reative o ADB SIDELOAD!
echo.
echo ============================================================
pause
color 0A

:: 2. Firmware MIUI 12.5.2
call :flash_zip "fw_raphael_miui_RAPHAELGlobal_V12.5.2.0.RFKMIXM_edbf5f63e8_11.0.zip" "2/5 - Firmware MIUI 12.5.2"

:: 3. ROM crDroid Raphael Edition
for %%f in (crDroidAndroid-13.0-*-raphael-*.zip) do set "ROM_ZIP=%%f"
if not defined ROM_ZIP (
    set "ROM_ZIP=crDroidAndroid-13.0-20260904-raphael-v9.20.zip"
)
call :flash_zip "%ROM_ZIP%" "3/5 - ROM crDroid Raphael Edition (A13)"

:: 4. GApps (Opcional)
if exist "NikGapps-*.zip" (
    for %%g in (NikGapps-*.zip) do call :flash_zip "%%g" "4/5 - GApps (Opcional)"
)

:: 5. DFE (Opcional - Decrypt)
if exist "Disable_Dm-Verity*.zip" (
    for %%d in (Disable_Dm-Verity*.zip) do call :flash_zip "%%d" "5/5 - DFE (Disable Dm-Verity)"
)

:: ETAPA FINAL
cls
color 0C
echo ============================================================
echo [!] PROCESSO DE FLASH CONCLUIDO NO PC!
echo ============================================================
echo.
echo ULTIMA ETAPA NO RECOVERY:
echo.
echo 1. No celular, cancele o ADB Sideload.
echo 2. Va em Wipe > Format Data.
echo 3. Digite 'yes' e confirme.
echo 4. Toque em Reboot System!
echo.
echo ============================================================
pause
exit

:esperar_sideload
echo.
echo [*] Procurando dispositivo em modo ADB Sideload...
:loop_wait
adb devices | findstr /R /C:"sideload" >nul
if %errorlevel% neq 0 (
    cls
    echo ============================================================
    echo [!] AGUARDANDO ADB SIDELOAD...
    echo ============================================================
    echo Conecte o cabo USB e ative o ADB Sideload no Recovery!
    timeout /t 3 /nobreak >nul
    goto loop_wait
)
echo [+] Dispositivo em ADB Sideload encontrado!
goto :eof

:flash_zip
set "ARQUIVO=%~1"
set "ETAPA=%~2"
cls
color 0A
echo ============================================================
echo Executando: %ETAPA%
echo Arquivo: %ARQUIVO%
echo ============================================================
if not exist "%ARQUIVO%" (
    echo [i] Arquivo "%ARQUIVO%" nao encontrado (etapa pulada ou opcional).
    timeout /t 2 >nul
    goto :eof
)
call :esperar_sideload
echo [*] Enviando via ADB Sideload...
adb sideload "%ARQUIVO%"
echo [+] Concluido!
echo [!] Reative o ADB Sideload no aparelho para a proxima etapa...
pause
goto :eof
