:: 使用方法 （需要进入电路文件的工作目录）
:: zkverify mycircom    
:: 【后面的mycircom对应的是circom的文件前缀】
:: 
@echo off
set a=1
if not exist build/circuit_final_%1.zkey set a=0
if not exist build/public_%1.json set a=0
if not exist build/proof_%1.json set a=0
if %a% == 0 (
    echo ==========execute 'zkcomp %1' firstly==========  && GOTO end
)

mkdir build >Nul 2>Nul
cd build
move /y circuit_final_%1.zkey .. >Nul 2>Nul
move /y public_%1.json .. >Nul 2>Nul
move /y proof_%1.json .. >Nul 2>Nul
cd ..


:menu
echo.&echo  1. offline verify
echo.&echo  2. online verify
echo.&echo.
set /p opt=输入数字后回车：
IF "%opt%"=="" set opt=<nul&& CLS && Goto menu
if "%opt%"=="1" set opt=<nul&& Goto offline
if "%opt%"=="2" set opt=<nul&& Goto online
echo.&echo 输入无效，请重新输入！ 
PAUSE >NUL && CLS && GOTO menu



::         offline verify
:offline
@ echo.
:: call表示调用另一个批处理文件，也可以用start，不过start会另开一个命令行窗口，且不会关闭
echo snarkjs zkey export verificationkey circuit_final_%1.zkey verification_key_%1.json
call snarkjs zkey export verificationkey circuit_final_%1.zkey verification_key_%1.json
@ echo.
echo snarkjs groth16 verify verification_key_%1.json public_%1.json proof_%1.json
call snarkjs groth16 verify verification_key_%1.json public_%1.json proof_%1.json && GOTO end

::        online verify
:online
echo snarkjs zkey export solidityverifier circuit_final_%1.zkey verifier_%1.sol
call snarkjs zkey export solidityverifier circuit_final_%1.zkey verifier_%1.sol

echo snarkjs zkey export soliditycalldata public_%1.json proof_%1.json
call snarkjs zkey export soliditycalldata public_%1.json proof_%1.json


:end
:: 将所有编译生成的文件移动到 build文件夹
rem rmdir /s /q build >Nul 2>Nul

::  %~dp0为文件当前路径可以改为自己要移动文件的路径 *.dll表示此文件
move /y proof*.json build >Nul 2>Nul
move /y public*.json build >Nul 2>Nul
move /y circuit_final*.zkey build >Nul 2>Nul
move /y verification_key*.json build >Nul 2>Nul
move /y verifier*.sol build >Nul 2>Nul
:: Pause
