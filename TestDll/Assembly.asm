; Win32 Assembly Console
; Use's Irvine's library found here: http://kipirvine.com/asm/gettingStartedVS2017/Irvine.zip
; unzip the folder into your c drive
; Irvine's Library documentation can be found here: http://programming.msjc.edu/asm/help/index.html

.386
.model flat,stdcall
option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

.data
messageToDisplay db "Hello World!",0
messageLength db sizeof messageToDisplay
LibMain proto h:DWORD,r:DWORD, v:DWORD


.DATA?

consoleOutHandle dd ? 
bytesWritten dd ?

.code
LibMain proc,h:DWORD, r:DWORD, v:DWORD
	mov eax,1
	ret
LibMain endp

HWorld proc
	invoke GetStdHandle, -11
	mov [consoleOutHandle], eax
	invoke WriteConsole,consoleOutHandle, offset messageToDisplay, messageLength, offset bytesWritten, 0
	invoke ExitProcess,0
HWorld endp

end LibMain
