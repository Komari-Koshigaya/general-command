:: 使用方法 （需要进入电路文件的工作目录）
:: 1. zkcomp mycircom    编译电路并生成证据，在mycircom改动之后必须执行该命令
:: 【后面的mycircom对应的是circom的文件前缀】
:: 2. zkcomp mycircom prove 
:: 【生成证据，在电路文件没有改动，只改了input.json时可以只执行该命令】
@echo off

:: 通过第二个参数来判断是否只生成证据
if "%2"=="prove" (
    set a=1
    if not exist input_%1.json set a=0
    if not exist build/%1.wasm set a=0
    if not exist build/circuit_final_%1.zkey set a=0

    if %a% == 0 (
        echo ==========execute 'zkcomp %1' firstly==========  && GOTO end
    )

    mkdir build >Nul 2>Nul
    cd build
    move /y %1.wasm ../ >Nul 2>Nul
    move /y circuit_final_%1.zkey ../ >Nul 2>Nul
    cd ..
    Goto prove
)


:: 调用 circom.cmd 编译电路文件
@ echo.
echo circom %1.circom --r1cs --wasm
call circom %1.circom --r1cs --wasm || Goto error

:: 下载 ptau
if not exist pot_10.ptau (
    echo ==========download pot_10.ptau==========
    curl -o pot_10.ptau https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
)

@ echo.
echo snarkjs zkey new %1.r1cs pot_10.ptau circuit_0000_%1.zkey
call snarkjs zkey new %1.r1cs pot_10.ptau circuit_0000_%1.zkey || Goto error

@ echo.
echo snarkjs zkey contribute circuit_0000_%1.zkey circuit_final_%1.zkey -e="random text"
call snarkjs zkey contribute circuit_0000_%1.zkey circuit_final_%1.zkey -e="random text" || Goto error

:: generate proof.json and public.json
:prove
@ echo.
echo snarkjs groth16 fullprove input_%1.json %1.wasm circuit_final_%1.zkey proof_%1.json public_%1.json
call snarkjs groth16 fullprove input_%1.json %1.wasm circuit_final_%1.zkey proof_%1.json public_%1.json || Goto error


:: result about executing commands above
:success
@ echo.
echo ============执行成功！！！已生成证据=========== && Goto end
:error
@ echo.
echo ============执行出错!!! 请检查电路文件或input.json=========== && Goto end

:end
del /f /s /q *.r1cs  *_00*.zkey 2>NUL


:: 将所有编译生成的文件移动到 build文件夹
:: rmdir /s /q build 2>Nul
mkdir build >Nul 2>Nul
::  %~dp0为文件当前路径可以改为自己要移动文件的路径 *.dll表示此文件
:: /Y - 禁止提示以确认要覆盖现有的目标文件。
move /y ./proof*.json ./build >Nul 2>Nul
move /y ./public*.json ./build >Nul 2>Nul
move /y circuit_final*.zkey build >Nul 2>Nul
move /y *.wasm build >Nul 2>Nul
:: Pause

