.386     ;(����ע�ͣ�ʹ��;����)��ʾ�û�����Ե�ָ�
.model flat,stdcall    ;�洢ģʽ��ƽ̹�ڴ�ģʽflat ��������Ϊstdcall ����������ջ
option casemap:none    ;��Сд����
includelib msvcrt.lib  ;���뾲̬�������ӿ⣬�൱��#include <stdio.h>
printf proto C:VARARG  ;������Ҫʹ�õĺ���ͷ���������ɱ���������ջ�������ɵ����߸�����ջ

.data     ;ȫ�־�̬��
msg db "Hello World!",    ;�����ַ����ռ䣬�洢��hello,world!��
0dh, 0ah, 0     ;�س� ����
.code    ;������
start:    ;start��ţ���ʵ�����壬Ҳ�ɽ����޸ĳ���������
call main   ;����main����
ret      ;�����أ���ջ1���ֵ�Ԫ���ı�EIPָ��Զ����Ϊretf
main proc   ;main�ӳ���
push offset msg  ;��ȡmsp��ƫ��ֵ��ѹջ
call printf    ;��������������printf
add esp,4     ;�ӳ������������4�ֽڣ�ƽ���ջ
ret      
main endp  
end start 