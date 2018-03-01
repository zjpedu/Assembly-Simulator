.386     ;(单行注释，使用;引导)表示该汇编语言的指令集
.model flat,stdcall    ;存储模式，平坦内存模式flat 语言类型为stdcall 从右向左亚栈
option casemap:none    ;大小写敏感
includelib msvcrt.lib  ;引入静态数据链接库，相当于#include <stdio.h>
printf proto C:VARARG  ;声明需要使用的函数头，函数不由被调用者清栈，而是由调用者负责清栈

.data     ;全局静态区
msg db "Hello World!",    ;分配字符串空间，存储“hello,world!”
0dh, 0ah, 0     ;回车 换行
.code    ;代码区
start:    ;start标号，无实际意义，也可将它修改成其它名字
call main   ;调用main函数
ret      ;近返回，出栈1个字单元，改变EIP指向；远返回为retf
main proc   ;main子程序
push offset msg  ;获取msp的偏移值，压栈
call printf    ;调用上面声明的printf
add esp,4     ;子程序结束，弹出4字节，平衡堆栈
ret      
main endp  
end start 