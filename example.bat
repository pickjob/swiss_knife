@echo off
@REM run example
set num=0
for %%a in (%*) do (
    set /a num+=1
)
if %num% == 0 (
    cargo run --target x86_64-pc-windows-gnu
)
if %num% == 1 (
    cargo run --example %1 --target x86_64-pc-windows-gnu
)
