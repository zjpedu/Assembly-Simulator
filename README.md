## **汇编语言模拟器**

支持的指令序列有：

```python
op = ["load", "move", "add", "sub", "shiftl", "shiftr", "store", "slt", "sle", "beqz", "goto", "and", "or", "xor", "call", "ret", "clz", "push",
      "pop", "_pr","div","mul","_data"]
```
## <center>**使用Visual Studio 编写并执行汇编语言**</center>

![Github stars](https://img.shields.io/github/stars/Ethanzjp/Assembly-Simulator.svg) ![github language](https://img.shields.io/badge/language-assembly-green.svg) ![](https://img.shields.io/github/license/Ethanzjp/Assembly-Simulator.svg) ![Github stars](https://img.shields.io/github/forks/Ethanzjp/Assembly-Simulator.svg)

### **概述**

学习汇编语言，对于我们深刻理解计算机程序的执行有极大好处，每一个计算机从业人员都应该掌握这项基本技能。就像Knuth在《计算机程序设计艺术》一书中说道：有人说使用机器语言，从根本上来说，是我所犯的极大错误。但是我真的认为，只有有能力讨论底层细节，才可以为严肃的计算机程序员写书。当今充斥着各种高级语言，从比较接近底层的C、C++、到Java，再到类似于Python的脚本语言。为什么在这么多语言中还要学习汇编语言呢？我想，如果你想成为一个合格的计算机科学家，这非常有必要。

### **环境说明**

不同的计算机体系结构采用的汇编语言有所不同，也就是说汇编语言不能在体系结构不同的计算机中兼容，本文选择Microsoft的Windows操作系统，并且基于X86处理器，要求你的系统首先安装了MASM（Microsoft Macro Assembler），MASM的下载地址为：http://www.masm32.com/download.htm ，进入后选择一个下载地址如
US Site 1，点击即可下载。下载后按照提示默认下一步安装即可。安装完成之后，我们采用微软提供的Visual Studio工具编写并执行汇编语言。后续部分将详细说明如何配置Visual Studio才能正确执行汇编程序。

### **第一个汇编程序**

下面一段代码将作为第一个汇编程序，MASM32规定，每一个单行注释都要用;开头，每条执行的大致含义在下面的代码中已经标注好，如果你还是不理解，也不要紧，后面会持续根据教材《Assembly Language For x86 processors》深入学习每一细节。

```asm
.386     ;(单行注释，使用;引导)表示该汇编语言的指令集
.model flat,stdcall    ;存储模式，平坦内存模式flat 语言类型为stdcall 从右向左压栈
option casemap:none    ;大小写敏感
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
```

### **Visual Studio 2013编写并执行.asm文件**

#### **新建项目**

使用Visual Studio 2013编写汇编语言和C、C++一样，首先都需要“新建项目”，这里我们新建“Visual C++”-> “空项目”，记住这里一定要是空项目。

##### **创建.asm文件**

点击新创建好的项目，右键“添加”-> "新建项" -> "first.asm"，将上面提到的代码粘贴到该文件中。**注意：Visual Studio 2013不支持直接创建.asm文件，我们创建任意的.cpp文件，并将后缀改为.asm即可**。

#### **配置项目属性**

* 右键新创建好的项目，选择“生成依赖项”，接着选择“生成自定义”，接着勾选“masm(.targets,.props)”

* 右键新创建好的项目，选择“属性”-> “链接器”-> "常规" -> "附加库目录"，将MASM32安装目录下的lib文件夹包含在内，比如“D:\masm32\lib;%(AdditionalLibraryDirectories)”

* 右键新创建好的项目，选择“属性”-> “链接器”-> "系统" -> "子系统"，点击选择“控制台(/SUBSYSTEM:CONSOLE)”

* 右键新创建好的项目，选择“属性”-> “链接器”-> "高级" -> "入口点"，写上main，否则顺序执行

* 右键新创建好的项目，选择“属性”-> “Microsoft Macro Assembler”-> "General" -> "Include Paths"，填入例如“D:\masm32\include;%(IncludePaths)”

* 右键新创建好的项目，选择“属性”-> “Microsoft Macro Assembler”-> "Object File" -> "Make All Symbols Public"，选择：是(/Zf)

* 点击“生成”-> "生成解决方案"，如果没有错，点击“本地Windows调试器”即可看到.asm文件的执行结果。

### **示例**

示例见firstAssembly工程，它是使用Visual Studio 2013编辑的汇编语言的完整示例。

### **参考教材**

该仓库所有的示例代码编写规范参见教材：《Assembly Language For x86 processors》，中文版本《汇编语言：基于x86处理器》。


