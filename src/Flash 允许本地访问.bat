c:
cd %windir%\system32\Macromed\Flash
md FlashPlayerTrust
cd FlashPlayerTrust
echo c:\ >>myTrustFiles.cfg
echo d:\ >>myTrustFiles.cfg
echo e:\ >>myTrustFiles.cfg
echo F:\ >>myTrustFiles.cfg

cd %userprofile%\Application Data\Macromedia\Flash Player\#Security
md FlashPlayerTrust
cd FlashPlayerTrust
echo c:\ >>myTrustFiles.cfg
echo d:\ >>myTrustFiles.cfg
echo e:\ >>myTrustFiles.cfg
echo F:\ >>myTrustFiles.cfg