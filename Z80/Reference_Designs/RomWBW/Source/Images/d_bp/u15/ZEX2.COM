�Z3ENV��*	͛���#x�����T�^#�{_�/z�w#x��?}��&�"��       à SRDATES$ NELTES' EVAS* PLEH- ��j�?�4x(C) Copyright 1979, Robert A. Van Valzah Ï  Ï >�m >
	 Ï �z�z �{ Ï  Ï  Ï  *9 	�����m �Ô * " !  " � ͔ $ �s � ͔ ' �s � ͔ * � :] �/��!  9"t1t>�2!� ��̓����7:] � ����̐� 
�[
�*�"�+	�9�9>��D�w+: w+: w+6�" !  :��ʓ*��*��Ø��" ~#fo"�� ^#V#~��2��"��	 ^#Vz�2��"��           ̓!��� ��!̓̓!m~��#�_� ���
ZEX Syntax:
		ZEX <zexfile> <parameters>
or
		ZEX

The first form executes the indicated command file
(<subfile> may be of type ZEX or SUB, and if a ZEX and
SUB both exist, the ZEX file is used), passing to it
the parameters, similar to the way SUBMIT is used.

The second form allows the user to enter commands.
ZEX presents the user with a prompt like "n:", where
n is a line number, and the user may type in a command
line.  Input is terminated by simply striking the
RETURN key (empty input line).

ZEX can be aborted by ^C from console.

    Strike Any Key to Continue, ^C to Abort -  

ZEX supports an enhanced command processing facility
which recognizes the following commands.  These may be
embedded in the text of the command file or user
input and will be executed after processing begins.

	Cmd Meaning		Cmd Meaning
	 |  insert <CR>		^|  insert <CR> <LF>
	^:  rerun command file	^.  suppress print of chars
	^#  toggle ZEX msgs	^$  define default params
	^?  wait for user <CR>	^/  ring and wait for <CR>
	^*  ring bell		^"  allow user input
	^<  display chars only	^>  stop display
	;;  ZEX comment		$n  1<=n<=9 for param
	$$  =$			$^  =^
	$|  =|			^c  insert ctrl char c

 *�DM�* ��}�_|�W�!x���~#������bkx��-:<2���~#�2~:~2~�)������"�+"���o& 6!�� ����>
2z �"|��ʈ� �\s#r#:z��m�ʈ� �u��\�>�!  "�>�2!"�͟*�#"���:�� ��
� G*������6#6
#"�á͸	e !��2| � � \ !�:���	*���I	���	���	e !��2| �\ �I	��	��	!�] �<6.#e �<6$Å"�	ͩ	<¥	�"�	*�	 �ͩ	2�	~���o	��_�$�|	: �<_ͩ	#~�#�_�$	:�	_ ͩ	*�	�ͩ	�<�f	>������� ���� � �� � 2�	� 2�	�:�	_� :�	_ � ��� <�+	*��!� "�� \ � ���	��	*� ��~��
#�
"���*�~#fo�:���L
G�x�;�<
��F
w#�;
6#6
#6"�}�|��|ɯ2v2w2x2�! "�*�"�"���

�H�z
���|¡
����>�H��
O:v��yʰ
�;�q�^��
�$��2y���
O:��y�z
��d�z
͝�:��?� �/�%�"�*�*�@�|�E�$�U�.���#���<���>���&�ú
>�ú
>�ú
>�ú
>�ú
��
�;��;�*>�ú
>�ú
>�>
�2y�z
�!�� ���>	2z�U�>
Ã
�!y�w�º
O:x��yʺ
:v��yʺ
#�!y:�=2��ʿ�
w:��ʹ�>�>
Ã
�>
Ã
��>�ú
>��!x����w�>�ú
>�2y�!v���z
2v2wú
>�2y�!w���z
2w2vú
���*���}��|�ʔ��w+��K��/̓*t���*�X �����/s#r�����/w����/~���̓åu̓å�̓å�̓*|͈�*F̓�*�̓�̓�*Z̓å�|��`ڮ�{�R� �@���:��?��/��*��"��$��.��#��<��>��&��R�@��R�$��^��|��1�d�:�d�1�2{��!��� _ ^#V�{�� �������z
�!�:{��[_ ^#V�{���� �w#�<��*�#"�!y6 !�6 kb"��"��� ����{��:x���:v���:�<2��	� ~��� > #�_� �È!Ã ̓*���͟*��~#����¸6 ����*~#��_������� �������	��
 	�|���{�0_� ����~#���_x�{��w#�SUBZEX Error Line # $
 ZEX Already Present$
Text Buffer Empty$
Input/ZEX Buffer Overlap$
Parameter Number out of range$
No Parameter or Default Parameter$
Parameter$
File filename.typ$ not there$
Control character$
Too many arguments - $ZEX, Version 3.1$
$G LDI CPI INI OUTILDD CPD IND OUTDLDIRCPIRINIROTIRLDDRCPDRINDROTDRSBC ADC RLC RR           �            �                                      pppppppppppppppppppppppppppppppp                                                               "l�"� 	͙ ~��� +	͎ 2�1j* "j#^#V�|�g."n* "pr��*p�!v ��1j	͙ ~��ʨ*p" *j" � � : O*n��L �uñ �B  �*� X ����̈́ s#r����̈́ ~#fo���̈́ w���̈́ ~��̈́ ~��x��� 6 !F��ͪ �ʨ!  9"�1j�u���x�ʜ���x�	͙ #w	͎ >*���:���&̈́ ~��&#��&>�2��,:2��N��ʜ��ʪ��������������0������%���<���<�:��ʆ̈́ ~�ʆ#�>�2�>Ì�2�>O:���y��{�� >ͣ *��ñ ͙ 	͎ �2�22�2��� �x�ʜ��� ��{��! `��u���+|����{���x�ʜ���O�B
�B��B�!��!�w�!���!��!!���8�w�2��:���y2~�{	͙ ~+	͎ ���#	͎ ��͆�y�ͣ *��>�!M��:~O�{*j�* {�z��og" �1j!4��ë�y�ͣ ��͆*l|��  T]�! 6 ��s#r�  *p�!r���~#����:����̈́ ~���#�����:����~��#�O�{��!rL ��!x� ��!{B��
[ZEX Aborted]
  ZEX:  Done                                 �r�u�x�{          "A$ A!"H  �A  ��@�$! @�"�$��!B��B�A�$B$��$A	!���	"H$ @$�HD� I �@  "@ $���       	$ "l�"�	͙~���+	͎2�1j* "j#^#V�|�g."n* "pr��*p�!v��1j	͙~��ʨ*p" *j" � � :�&͊!>k�R �!"T)*�)�*�)�y!("�)��"�)"�)��$�N	*�)�*�)�y!(!��0�@ ~��������!"T)*�)~�(	!"T)*�)"�)"�)@ ~