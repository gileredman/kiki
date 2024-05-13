#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�6~ ��o� ����������PD@ `�雵.����\�5mAC�5&"cMI�O(� mSzSCф#F���ڃ���dщ2�� �dړ��C 4��z���d�D�$�h�4           BI�P�=F   ��=A�   8�����  4 4   H�d&�č1��&S�6�G����C@h i�&]�(D ��<�S����]}���9���0�3)�|#Ͱ�
�UB�-��-DcBA�L����9rZ��*[殔�$��H,�m��+�*[>Ն)�ĕ�ڍ�����<���Uw��
pS/��SxѰ��u� HLɍo����p� ��dڭt�!��SF��#���-�	ø�M�H
rFg�,y�R8��snQ_�>(X��v�}Y����Jpڸ!�[^�5�ѵ�'3��х*V����-���d��Cs��ǖ�Ȋ��qo˭㼓bLbG���!q�|x0�#�^h��
���$�'=L@3�D���9��6;fE�doX(���_��VիV�ՂN�����9���"n�r�室�Nx�C�l���r#��y�B�+��C ;����r�{.Xg�����^���Zx�b�����
b5g�B$�m�x��F~tq��/�$�;���#"H���\�ːv��gS5�i$fqV�� ^���O@i���i0�
"Q��@R�����e�H��{ZV���Q����"��l�`��TN%Jh�N��ת���8�Ue� ����r��'i�x��y��؂���0G7�Ib�iY���p�j���'!��/m���{++1v�!`�K�vX���`�v48�g�BptL�$ǎ�44�T���8����$~�׵9���D�1�01~��+��^3pÀ1$����ei2Bs�֚YK�ƌy<~�rN�e���&�ȢW8�-'mZLA�Ϛ��"o0�@��\G$5C�s���!y/�r.P�n	��#�QTC�j��T�ݎog�����-�W�٬������3�T��A	����c�-�QW�����bo�����6��cT��1_�i�A�?�6�k�;��<�������/��;��4U$!���B�jPd�`Vq7���%R��hV&�0�L�R�Z~g�Qb�Lfے�5��<?���G8X !Ż����z��[�F��=+���4�:�P<6L�X��j^ 0f�=��p�!�Ցպ؝�T�{(��;�$gȠ��A�q$��Kj7���.���@};h��s x"މ���_���� 
�f3�&+��]�,a�rE���F`����+3
�@�߮���^�1�[�~��&�wFrHp��A�cY���O�D6�QE��bT��b'iRqu<Ct��C;�Q�V��u��� cvi�I�qW���,FB^�����-%%��pW�\X�y�|ƈar+��C^�a���j�-��t�o2t�BƆXK ��S��"WE�j.�b)r����M �\�7��אɥuM.����6�z�p�(I��#��T�(��pk���]��Sq@p�4�uB)�[�_���b3f�`��m�
��F� a��"Alg�3i��ƢF�
��ûl�l-��F���y�pn�0`����ܲ
�lE�rM�1�����f�r`�xXK'��/{��"�D��>�EAh�聻L]<\D�Z-D~F�%-;��E��s���Wy���8P�p�uB U�D� �{�g���A� =�^�9΃��G�S�=@!�B=>�I$C�$C!��C@�8�B�@]��BB���