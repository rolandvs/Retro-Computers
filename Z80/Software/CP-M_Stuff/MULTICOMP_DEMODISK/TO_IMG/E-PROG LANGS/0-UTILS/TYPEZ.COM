�E ��C?MO?JH?XH?PR?LS?S                                           ��dQ	� 
###  Z80?  ###
$�{ �
          TYPE  v2.2   (c) 1986,87  MICROCode Consulting
�!� ~����  TYPE allows typing of any visible file or file in a library (.LBR) file.
Normal, squeezed and crunched files can be displayed.  The command
format is shown below with all optional values in brackets '[]':

       TYPE [du:]filename1[.ext1] [filename2][.ext2]

where  'du' is an optional drive and/or user followed by ; or :
       'filename1' is the 1 to 8 character name for the file [no * or ?]
       '.ext1' is the optional 1 to 3 filename extension [no * or ?]

Commands are interpreted as follows:

  TYPE [du:]filename[.ext]        <--- Types file provided that the
                                       extension is NOT '.LBR'
  TYPE [du:]filename.LBR          <--- Lists directory contents of
                                       named library (.LBR) file
  TYPE [du:]filename1.LBR filename2[.ext2]
                                  ^--- Types file 'filename2[.ext2]' located
                                       inside library file 'filename1'
                                       (The .LBR extension is optional.����Ɓo�2�2�2)
2�w:2d:2f!� �	ʰ\ �0��Invalid filename forma�y2�+�	ʷ@�8	 :@�(!��Second filename format invali�!e ~6L#� ʩ�L ~�B #~�Rʴ��First filename must have no extent or extent of .LBҾ6B �#�6R �2�!e :\ �!ݾ 8��Drive out of rang�ͦ!> ��(�8��User out of rang�_ � � � \ � <�a!e ~�  
6L#6B#6R�:�� ��File does not exis���.LBR file does not exis�! "�-"�\ � <�*!f :/��**e"�:���	!e ~��L #~��B #~��R>(���	�=͒�K�  �C��*e���� 	�x�(f����#˾� -���Two files of the same name in .LBR fil����8���*��RDM�[�! "�6 �+����# ��ó�# ���"�6 �*e>2f~�(\�!f5 6��> �(� :��~�#���~�#�##^#V#�� 	�<��<��<��  "��� �����

  �*�� �k in�*�� � active library members �*�� � deleted,�!  �[���R�[��R� � free���� � :���g	�=͒��
A#�� �#�^#V#�S} �2 ^#V�S�\ !� ��I"!  "} 2 \ !� �ʉ	��Empty fil�>�2��9 :���(
!��9�[e��R8!� ��R�>�0B� ���R�>@06 h��R>0,��Not enough memory to expand CRunched fil�2�W �:�*e������Error expanding CRunched fil�> �����������
 �!d5 �:w�[More...]���
��          ���(��(��(�!f�~ 5�(
�

	###  Maximum line count exceeded  ###
	###  Use XMODEM to download file  ##���*  ���File does not exist in librar��!7 �^ �#�V �#��<��R0�� �a > �0O������}�0��d 
 �6�|	!� �(��Not a valid .LBR fil�> #� ��#~#� �#^#V{�(��"�))+" 	!  "�"�>�2��> � 0!  +"�|���6�I>�2�o& ~�� 	!  #"��<�> � U!  +|� A> ��� (!  |�+"�ʠ!  "����� �6��� � �x2�:��g. �<�"�!  ~#"�>=(2> ��m��(2#��m� �>��>22r!� ~�v>�#~<(<>�<2)
�(Uncrunching�<2�##�(Unsqueezing�#~�(���)
�:���#^#V#z�� !*e���^#V#^#V�!  �*e####"�[))��Ke	"�"��! �9��R0&��Not enough memory to unSQueeze fil�� @�>��R�0
 ��R>8�2��`i�}�DO ����6 (��)D����� �6��� � ��[��R#"����SQueezed file incomplet�!    ���*�O|��(�	�Cq�j)�Ke	~#fo�|(�$ %/�>2����!� ~�w �#�?(��O#��(�����File extension .xxx not allowed��

### ����  ##���#~� (��	(�����!� ���	p�����~�#�!82�*(K�:(P�;(L�. �i�}+> �~#�!8�.�}�i�}˩�y��y(>�O+~� (	�	(�(7�����>?��Py�����}x����8��������#~�A8�0G<+w#6 #~6 �(+�086�
02G#~6 #6 �(�08#�
0Ox�G���A�� 0� O�˱�������,��}                ����~��~#������_� �� �������\ � ��                                     ��`�2Ee�*5�{�9go"�a2�a=2�a��͌�Copyright (c) Steven Greenberg 8/31/86  201-670-8724. May be reproduced for non-profit use only.� . "}>0�g">(�g�  ��R"��|�g�ss�!u��[��R"�͚̈́�v ̈́��(>
>>>7�{sɯ�̈́� �̈́̈́�̈́̈́�� ��Z���Sh�(�C�͗!j�>8	*h:u���:g�(��(�C�͗���*�9�/:~�gk~�� >2j�*h:u���~���3V|�g^�z ͗|�g~�`��|�g~2u�����g:~�g��OD~��(|�0g~�(
G|�gn`��`͌r|�gs|�gq�K��C�x��>�2g��!r��8̈́Ẅ́2��:�:�:�:_
̈́_:��Wz���?�!�"��p��!�����< ��*}T]>� w��6  @��>*}w����}�eo0$:~�� :~g:~��G}/< OT]>���(*}:~Gz�GK>����7+��|�0gr|�gs����  BO	���,�L}�Z8�90��)��))))l��� �;͙���Sh�.�[�͋!j�>8	*h:u���:g�(��� <2g��Sh�.�[�͋*h:u���{� ('��7!  "k�2g͙>	2n>2o��>2j���C��:~�g����*�9�/:~�gk~���� >2j�*h> 2z:u���2z�~���3V|�g^�z ˪͕|�g~�`��|�g~2u������*k:~�g:z�w|�gs|�g�w*k#"k#:o���'2o:n<�(2n�>�2g�  :nG:mO�!�Y���y2mz=��{���(��(��̈́7O��Kp�88��(	O�Cp͎��Cpɷ(=G�2qy2py͎��>��Cp͎���> 2z�!��������< ��!�������2z�*}T] 6���6   ��*T] (6���*6�G�hL~��(���[kr|�gs:�gy�g"v��[{:�W|�0��G>�2yx�hL~��( :y�� �V|�gn:~�g�n "x���*x|����[h:uGr|�gs|�gp]))))�o{�g:��g#��[�"{����������������/
�����!�g ��� ��  �	  U� �V|�gn:~�g�n "x���*x|����[h:uGr|�gs|�gp]))))�o{�g:��g#��[�"