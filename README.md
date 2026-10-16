# my_ffi_win32
nasm -f win32 main.asm -o callf.obj  
gcc -c main.c -o main.obj  
gcc main.obj callf.obj -o main.exe -nostdlib -e _entry -lkernel32  
main.exe  
