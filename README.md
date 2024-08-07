# LIBASM:
learning assembly why not doing a project at the same time.
## Why And What:
 in my opinion and after a year in 1337 I believe that learning by doing is the best way to gain the knowledge you need, so I dicided to start with a project even if it's far from my position now as a student, but it can serve as an intoduction to the assembly language, I'll be following the subject of the projects and while recreating those function and gaining more knowledge I may add other ones to the list.
## Progress
 - [X] [ft_strlen](https://man7.org/linux/man-pages/man3/strlen.3.html).
 - [X] [ft_strcpy](https://man7.org/linux/man-pages/man3/strcpy.3.html).
 - [X] [ft_strcmp](https://www.man7.org/linux/man-pages/man3/strcmp.3.html).
 - [X] [ft_write](https://man7.org/linux/man-pages/man2/write.2.html).
 - [X] [errno](https://man7.org/linux/man-pages/man3/errno.3.html).
 - [X] [ft_read](https://man7.org/linux/man-pages/man2/read.2.html).
 - [X] [ft_strdup](https://man7.org/linux/man-pages/man3/strdup.3.html).
 - [X] ft_atoi_base
<br>**Linux Only**
 - [X] ft_create_elem
 - [X] ft_list_push_front
 - [X] ft_list_size
 - [X] ft_list_last
 - [X] ft_list_remove_if
 - [X] ft_list_sort
## resources I used while learning:
- [Instructions](http://www.mathemainzel.info/files/x86asmref.html#repe) **easy to search and look for instructions**.  
- [Mac's system calls numbers](https://opensource.apple.com/source/xnu/xnu-1504.3.12/bsd/kern/syscalls.master) **looking for a syscall here's the number**.  
- [AT&T syntax](https://csiflabs.cs.ucdavis.edu/~ssdavis/50/att-syntax.htm)	**when generating an assembly from C in mac (gcc -S), you'll need this**.  
- [Linux syscalls](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)	**working on linux ? here you go** 
- [Calling Convention](https://www.ired.team/miscellaneous-reversing-forensics/windows-kernel-internals/linux-x64-calling-convention-stack-frame#accessing-1st-argument) **carefull with the calling convention**
- [Nasm Docs](https://www.nasm.us/xdoc/2.10rc8/html/)
## Tools to use:
- Online compilers:
  - [rextester](https://rextester.com/l/nasm_online_compiler) **online nasm compiler**.  
  - [godbolt](https://godbolt.org/)	**check the code from C to assembly**.  
  - [cpulator](https://cpulator.01xz.net/?sys=arm-de1soc)	**a very good emulator**.  
- COMMAND LINE TOOLS:
  - [nasm](https://www.nasm.us/) **compiler I use**.   
  - [lldb](https://lldb.llvm.org/) **debugger I use**.  
## keep in mind:
 - This is my first attempt to make real solutions in assembly the code may have bad practices (we all know that this happens when you start something new), and errors, if you stumbled upon one please contact me i'll appreciate that.
 - ft_atoi_base modification:  
   -> I'll not handle the negative values it's just pain to see -101 in binary or thinking of how the base "abc" will handle it.  
   -> ft_atoi_base returns long.  
   -> **MacOs** ft_atoi_base will return -1 in case of an error in the base and -2 in the case of error in the string itself.  
   -> **Linux** ft_atoi_base will return -1 in case of Null parameters and -2 in case of base Error. 
 - ft_list_sort:  
    -> ft_list_sort is using mergeSort under the hood.  
    -> didn't free the memory yet, I'm tired I'll make it later.  
    -> the compare function should return 0 if the right element is bigger then the left element.  
 - if you have any questions or found a problem in this repo and code contact me.
