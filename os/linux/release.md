# --- Определить дистрибутив Linux

Идентификация дистрибутива дело не сложное, для этого есть несколько способов, представленных ниже.

systemd-detect-virt

Через компилятор GCC
Используя lsb_release (Ubuntu)
Либо через uname
Через issue (OpenSUSE/Debian)
Через *version (Slackware/Ubuntu)
Через *release (Debian/RedHat/Gentoo/Fedora/Ubuntu)
Для справки
Автоматизируем процесс
Ссылки
Смотрите также
Самый простой и эффективный способ (работает для большинства систем) это спросить у компилятора GCC (GNU Compiler Collection)


$ gcc -v
$ lsb_release -a
$ uname -a
$ cat /etc/issue
$ cat /etc/issue.net
$ cat /etc/*version
$ cat /etc/*release

Дистрибутив	Путь
Annvix	/etc/annvix-release
Arch Linux	/etc/arch-release
Arklinux	/etc/arklinux-release
Aurox Linux	/etc/aurox-release
BlackCat	/etc/blackcat-release
Cobalt	/etc/cobalt-release
Conectiva	/etc/conectiva-release
Debian	/etc/debian_version/etc/debian_release (редко)
Fedora Core	/etc/fedora-release
Gentoo Linux	/etc/gentoo-release
Immunix	/etc/immunix-release
Knoppix	knoppix_version
Linux-From-Scratch	/etc/lfs-release
Linux-PPC	/etc/linuxppc-release
Mandrake	/etc/mandrake-release
Mandriva/Mandrake Linux	/etc/mandriva-release/etc/mandrake-release/etc/mandakelinux-release
MkLinux	/etc/mklinux-release
Novell Linux Desktop	/etc/nld-release
PLD Linux	/etc/pld-release
Red Hat	/etc/redhat-release/etc/redhat_version (редко)
Slackware	/etc/slackware-version/etc/slackware-release (редко)
SME Server (Formerly E-Smith)	/etc/e-smith-release
Solaris SPARC	/etc/release
Sun JDS	/etc/sun-release
SUSE Linux	/etc/SuSE-release/etc/novell-release
SUSE Linux ES9	/etc/sles-release
Tiny Sofa	/etc/tinysofa-release
TurboLinux	/etc/turbolinux-release
Ubuntu Linux	/etc/lsb-release
UltraPenguin	/etc/ultrapenguin-release
UnitedLinux	/etc/UnitedLinux-release (covers SUSE SLES8)
VA-Linux/RH-VALE	/etc/va-release
Yellow Dog	/etc/yellowdog-release

Автоматизируем процесс
Из всего вышесказанного пробуем собрать скрипт

vim ../release

#!/bin/sh
OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`
GetVersionFromFile()
{
  VERSION=`cat $1 | tr "n" ' ' | sed s/.*VERSION.*= // `
}
if [ "${OS}" = "SunOS" ] ; then
  OS=Solaris
  ARCH=`uname -p`
  OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
elif [ "${OS}" = "AIX" ] ; then
  OSSTR="${OS} `oslevel` (`oslevel -r`)"
elif [ "${OS}" = "Linux" ] ; then
  KERNEL=`uname -r`
  if [ -f /etc/redhat-release ] ; then
    DIST='RedHat'
    PSUEDONAME=`cat /etc/redhat-release | sed s/.*(// | sed s/)//`
    REV=`cat /etc/redhat-release | sed s/.*release // | sed s/ .*//`
  elif [ -f /etc/SuSE-release ] ; then
    DIST=`cat /etc/SuSE-release | tr "n" ' '| sed s/VERSION.*//`
    REV=`cat /etc/SuSE-release | tr "n" ' ' | sed s/.*= //`
  elif [ -f /etc/mandrake-release ] ; then
    DIST='Mandrake'
    PSUEDONAME=`cat /etc/mandrake-release | sed s/.*(// | sed s/)//`
    REV=`cat /etc/mandrake-release | sed s/.*release // | sed s/ .*//`
  elif [ -f /etc/debian_version ] ; then
    DIST="Debian `cat /etc/debian_version`"
    REV=""
  fi
  if [ -f /etc/UnitedLinux-release ] ; then
    DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "n" ' ' | sed s/VERSION.*//`]"
  fi
  OSSTR="${OS} ${DIST} ${REV}(${PSUEDONAME} ${KERNEL} ${MACH})"
fi
echo ${OSSTR}


chmod u+x release
./release
Ссылки

