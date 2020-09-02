@echo off
c:\cc65\bin\ca65 src\cleanmem.asm
c:\cc65\bin\ld65 src\cleanmem.o -C atari2600.cfg -o cart.bin
del src\*.o /q