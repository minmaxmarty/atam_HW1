x86_64-w64-mingw32-as -o ex5.o ../ex5.asm ../ex5_tester
x86_64-w64-mingw32-ld -o ex5.exe ex5.o -e _start -lkernel32
