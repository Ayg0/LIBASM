extern __errno_location
global ft_read
section .text
	ft_read:
		mov eax, 0
		syscall
		jc _errno
		ret
	_errno:
		push rbp
		push rax
		call __errno_location WRT ..plt ;https://www.nasm.us/xdoc/2.10rc8/html/nasmdoc9.html#section-9.2.5
		pop rcx
		mov byte [rax], cl
		pop rbp
		mov rax, -1
		ret

;Calling procedures outside your shared library has to be done by means of a procedure linkage table, or PLT. The PLT is placed at a known offset from where the library is loaded, so the library code can make calls to the PLT in a position-independent way. Within the PLT there is code to jump to offsets contained in the GOT, so function calls to other shared libraries or to routines in the main program can be transparently passed off to their real destinations.
;To call an external routine, you must use another special PIC relocation type, WRT ..plt. This is much easier than the GOT-based ones: you simply replace calls such as CALL printf with the PLT-relative version CALL printf WRT ..plt.
