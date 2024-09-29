# Setup ASL3 Shari <> DVSwitch <> MMDVM Reflector

## Install ASL3 on debian 12 server or pi:

```bash
sudo -s
cd /tmp
wget https://repo.allstarlink.org/public/asl-apt-repos.deb12_all.deb
dpkg -i asl-apt-repos.deb12_all.deb
apt update
apt install asl3
apt install allmon3 (optional, do it if you want the dashboard)
```

## Configure ASL3

 - `asl-menu`

Enter your node settings in the configuration page, pretty much guide yourself on the top of the menu. Save and restart asterisk.

 - `nano /etc/asterisk/simpleusb.conf`
 - 
Enter this into the bottom node sectio, node-main section, and general section. Remove the node-main section info before you do this.

```bash
eeprom = 0
hdwtype = 0
rxboost = 0
carrierfrom = usbinvert
ctcssfrom = no
deemphasis = yes
plfilter = no
rxondelay = 5
rxaudiodelay = 10
txmixa = voice
txmixb = no
txboost = 0
invertptt = 0
preemphasis = yes
duplex = 0
```

Afterwards, reboot your node and kerchunk your shari node to see if it worked. The audio is likely low so go back into `asl-menu` and all the way into your node and then hit interface-tune. Hit number 2 and aim for your tramission to be on average hitting the 3KHz. You can adjust the audio levels. Go back and adjust your transmit levels with menu item 3 and 4. Hit W and 0 to exit. Restart asterisk.

Now to test, run `asterisk -r` and then `rpt fun <your node number here> *355553` this connects you to the echotest server, make sure you add your node number in their where it says too! Do a echo tranmission and hope it says audio level is pretty good. If not you can go back and adjust it again. When your done restart asterisk.

## Configure allmon3

 - `nano /etc/allmon3/allmon3.ini`
 - `allmon3-passwd –delete allmon3`
 - `allmon3-passwd admin` (create the password for the allmon3 page)
 - `nano /etc/asterisk/manager.conf`
 - 
Make your password to be 'password' and then save.

 - `systemctl restart asterisk`
 - `systemctl start allmon3`

Test to make sure it works by going to `http://youripaddress/allmon3` replace youripaddress with the IP address of your node. Run `ip a` to find your ip.
