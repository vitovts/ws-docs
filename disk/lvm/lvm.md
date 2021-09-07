# --- LVM

[Содержание](../readme.md)

```
LVM - это менеджер логических томов, позволяющий использовать разные области одного диска и/или оласти с разных дисков как один логический том
Реализовано с помощью Device mapper - таже с помощью ее работает RAID и dm-crypt
```

```
PV, Physical Volume   /dev/sda /dev/sdb1 /dev/sdc 
VG, Volume Group      vg_xx
LV, Logical Volume    lv_root (root) lv_var (var) lv_swap (swap)
FS, File System       ext4 reiserfs xfs
```

```
PE- Physical extent, физический экстент
LE - Logical extent, логический экстент
```


## --- Плюсы
```
1.Логические тома LVM больше не привязаны к физизескому местоположению
2. Размер логических томов можно увеличивать прямо ня лету
3. Размонитованные тома можно уменьшить во время работы системы
4. Логические тома можно расположить на нескольких физических дисках
5. Делаются снапшоты файловой системы
```

## --- Минусы
```
1. Уровень обстракции (виртуализации)
2. При выходе диска можно получить битые данные
3. Фрагментация данных
```

### --- PHYSICAL VOLUME

```
pvcreate /dev/sd[cb]
```

```
pvs
pvdisplay
```

### --- VOLUME GROUP

```
# create
vgcreate sas /dev/sd[cb]
# add disk
vgextend sas /dev/sdc
```

```
vgs
vgdisplay
```

### --- LOGICAL VOLUME

```
lvcreate -L100000 sas --name lv01
```

```
lvs
lvdisplay
```

```
mkfs.ext4 /dev/sas/lv01
mkdir /mnt/lv01
mount /dev/sas/lv01 /mnt/lv01
```

```
lvextend -L150G /dev/pve-ws-sata2/lv01
resize2fs /dev/pve-ws-sata2/lv01
```

```
/etc/fstab/
...
```