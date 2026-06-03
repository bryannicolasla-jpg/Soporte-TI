@echo off
:: Configura el título de la ventana y el color (0 = Negro, B = Cian claro)
title Entorno de Pruebas de Red - TI
color 0B
cls

:: Pantalla de Bienvenida con tu Arte ASCII original
echo.
echo                     ____
echo                   _(____)_
echo          _____ooO_(_o__o_)_Ooo_____
echo        Bienvenido Administrador %USERNAME%
echo                 Hora %time%
echo.
echo ====================================================
echo        ENTORNO DE PRUEBAS PERSONALIZADO
echo ====================================================
echo.
echo [INFO] Iniciando componentes de red...
timeout /t 2 >nul

echo [PASO 1] Verificando variables de entorno...
echo Usuario actual: %USERNAME%
echo Directorio de trabajo: %CD%
echo.
timeout /t 1 >nul

echo [PASO 2] Verificando registro de sesion en C:\Scripts...

:: Asegura que la carpeta Scripts exista en el Disco C antes de escribir
if not exist "C:\Scripts" mkdir "C:\Scripts"

if not exist "C:\Scripts\prueba_log.txt" (
    :: SI NO EXISTE: Crea el archivo por primera vez en la ruta especificada usando '>'
    echo ==================================================== > "C:\Scripts\prueba_log.txt"
    echo REGISTRO HISTORICO DE SESIONES DE TI >> "C:\Scripts\prueba_log.txt"
    echo ==================================================== >> "C:\Scripts\prueba_log.txt"
    echo Sesion inicial: Usuario: %USERNAME% ^| Fecha: %DATE% ^| Hora: %TIME% >> "C:\Scripts\prueba_log.txt"
    echo [OK] Archivo nuevo creado en 'C:\Scripts\prueba_log.txt'.
) else (
    :: SI YA EXISTE: Añade la nueva sesión en la siguiente línea disponible usando '>>'
    echo Sesion adicional: Usuario: %USERNAME% ^| Fecha: %DATE% ^| Hora: %TIME% >> "C:\Scripts\prueba_log.txt"
    echo [OK] Archivo detectado. Nueva sesion añadida al historial en C:\Scripts.
)
echo.

echo Cargando el menu principal...
timeout /t 2 >nul


:menu
cls
echo =======================================================
echo              MENU PARA SOPORTE TI
echo =======================================================
echo  Usuario: %USERNAME%  ^| Fecha: %DATE%
echo =======================================================
echo.
echo  [1] Pruebas de Redes
echo  [2] Pruebas de mantenimiento 
echo  [3] Salir al CMD estandar
echo.
echo =======================================================
set "opcion="
set /p opcion=Seleccione una opcion (1-3): 

if "%opcion%"=="1" goto menu1
if "%opcion%"=="2" goto menu2
if "%opcion%"=="3" goto salir
       
echo.
echo [ERROR] Opcion no valida, por favor intente de nuevo.
pause
goto menu



:menu1
cls
echo =======================================================
echo              MENU DE PRUEBAS DE RED (TI)
echo =======================================================
echo  Usuario: %USERNAME%  ^| Fecha: %DATE%
echo =======================================================
echo.
echo  [1] Realizar PING (Verificar conectividad)
echo  [2] Muestra IPCONFIG (Configuracion de red)
echo  [3] Ejecutar NETSTAT (Ver conexiones activas)
echo  [4] Realizar TRACERT (Trazar ruta de red)
echo  [5] Obtener GETMAC (Direcciones fisicas de red)
echo  [6] Manda NSLOOKUP (Info dominio DNS)
echo  [7] Ejecutar SpeddTest (Prueba de velocidad)
echo  [8] Salir al CMD estandar
echo.
echo =======================================================
set "opcion="
set /p opcion=Seleccione una opcion (1-6): 

if "%opcion%"=="1" goto ping_opc
if "%opcion%"=="2" goto ipconfig_opc
if "%opcion%"=="3" goto netstat_opc
if "%opcion%"=="4" goto tracert_opc
if "%opcion%"=="5" goto getmac_opc
if "%opcion%"=="6" goto nslookup_opc
if "%opcion%"=="7" goto MenuST
if "%opcion%"=="8" goto salir
       
echo.
echo [ERROR] Opcion no valida, por favor intente de nuevo.
pause
goto menu

:menu2
cls
echo =======================================================
echo              MENU DE MANTENIMIENTO DE HOST 
echo =======================================================
echo  Usuario: %USERNAME%  ^| Fecha: %DATE%
echo =======================================================
echo.
echo  [1] Reparador de red (Limpieza profunda)
echo  [2] Optimizacion de sistema (optimizador)
echo  [3] Salir 
echo.
echo =======================================================
set "opcion="
set /p opcion=Seleccione una opcion (1-6): 

if "%opcion%"=="1" goto 
                  :: ipconfig /release, ipconfig /renew, ipconfig /flushdns, netsh int ip reset, netsh winsock reset 
if "%opcion%"=="2" goto 
                      :: temp, %temp%, Prefetch, además de vaciar la Papelera de Reciclaje oculta (rd /s /q %systemdrive%\$Recycle.Bin) y limpiar los archivos temporales de actualización de Windows (SoftwareDistribution\Download).
if "%opcion%"=="3" goto salir
       
echo.
echo [ERROR] Opcion no valida, por favor intente de nuevo.
pause
goto menu

:MenuST


cls
echo ====================================================
echo             HERRAMIENTAS DE DIAGNOSTICO
echo ====================================================
echo  1. Ejecutar Speedtest (Prueba Completa)
echo  2. Hacer un Ping continuo a Google (Ver Estabilidad)
echo  3. Ver mi IP actual e informacion de Red
echo  4. Salir
echo ====================================================
echo.

set /p opcion="Selecciona una opcion (1-4): "

if "%opcion%"=="1" goto run_speedtest
if "%opcion%"=="2" goto run_ping
if "%opcion%"=="3" goto Menu1
if "%opcion%"=="4" goto salir




:run_speedtest
cls
echo ====================================================
echo             EJECUTANDO SPEEDTEST CLI
echo ====================================================
echo.

set "SPEEDTEST_PATH=C:\Scripts\speedtest.exe"

:: Ejecutar el test
"%SPEEDTEST_PATH%" --accept-license --accept-gdpr
echo.
echo ====================================================
echo Presiona cualquier tecla para volver al menu...
pause > nul
goto menu
























:ping_opc
cls
echo =======================================================
echo                    HERRAMIENTA: PING
echo =======================================================
echo.
echo [M] Volver al Menu Principal
echo.
set "host="
set /p host=Ingrese IP/Dominio o 'M' para salir: 
if "%host%"=="" goto menu
if /i "%host%"=="M" goto menu

echo.
echo Ejecutando ping a %host%...
ping %host%
echo.
goto pausa_menu

:ipconfig_opc
cls
echo =======================================================
echo                    HERRAMIENTA: IPCONFIG
echo =======================================================
echo.
echo [1] Ipconfig basico (Configuracion de red de tu equipo)
echo [2] Ipconfig /release (Liberar direccion IP)
echo [3] Ipconfig /renew   (Renovar direccion IP)
echo [M] Volver al Menu Principal
echo.
set /p net_opc=Seleccione modalidad: 
if "%net_opc%"=="" goto menu
if /i "%net_opc%"=="M" goto menu

echo.
if "%net_opc%"=="1" (
    echo Ejecutando Ipconfig basico...
    ipconfig 
) else if "%net_opc%"=="2" (
    echo Ejecutando Ipconfig /release...
    ipconfig /release
) else if "%net_opc%"=="3" (
    echo Ejecutando Ipconfig /renew...
    ipconfig /renew
) else (
    echo Opcion no valida, volviendo al menu...
    timeout /t 2 >nul
    goto menu
)
echo.
goto pausa_menu

:netstat_opc
cls
echo =======================================================
echo                  HERRAMIENTA: NETSTAT
echo =======================================================
echo.
echo [1] Netstat basico (Conexiones activas)
echo [2] Netstat completo (Mostrar puertos numericos y PID)
echo [M] Volver al Menu Principal
echo.
set "net_opc="
set /p net_opc=Seleccione modalidad: 
if "%net_opc%"=="" goto menu
if /i "%net_opc%"=="M" goto menu

echo.
if "%net_opc%"=="1" (
    echo Ejecutando netstat...
    netstat
) else if "%net_opc%"=="2" (
    echo Ejecutando netstat -ano...
    netstat -ano
) else (
    echo Opcion no valida, volviendo al menu...
    timeout /t 2 >nul
    goto menu
)
echo.
goto pausa_menu

:tracert_opc
cls
echo =======================================================
echo                  HERRAMIENTA: TRACERT
echo =======================================================
echo.
echo [M] Volver al Menu Principal
echo.
set "thost="
set /p thost=Ingrese IP/Dominio o 'M' para salir: 
if "%thost%"=="" goto menu
if /i "%thost%"=="M" goto menu

echo.
echo Ejecutando tracert a %thost% (esto puede tardar unos minutos)...
tracert %thost%
echo.
goto pausa_menu

:getmac_opc
cls
echo =======================================================
echo                  HERRAMIENTA: GETMAC
echo =======================================================
echo.
echo Obteniendo las direcciones MAC de los adaptadores de red...
echo.
getmac /v /fo list
echo.
goto pausa_menu

:pausa_menu
echo =======================================================
echo Presione cualquier tecla para regresar al Menu Principal...
pause > nul
goto menu

:salir
cls
echo ====================================================
echo           LIMPIANDO ENTORNO Y SALIENDO
echo ====================================================
echo.
echo Volviendo a la linea de comandos estandar...
echo.