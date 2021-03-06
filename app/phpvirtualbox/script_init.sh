#!/bin/bash
set -euxo pipefail

# https://github.com/phpvirtualbox/phpvirtualbox
# https://github.com/clue/docker-phpvirtualbox
# http://remotebox.knobgoblin.org.uk

cd /opt
wget -q -O phpvirtualbox.zip https://github.com/phpvirtualbox/phpvirtualbox/archive/develop.zip
unzip -q phpvirtualbox.zip
rm phpvirtualbox.zip
mv phpvirtualbox-develop phpvirtualbox

cat > /opt/phpvirtualbox/config.php <<'EOL'
<?php
class phpVBoxConfig {
var $username = 'vbox';
var $password = 'pass';
var $location = 'http://172.17.0.1:18083/';
var $language = 'en';
var $vrdeports = '9000-9100';
var $vrdeaddress = '127.0.0.1'; // '0.0.0.0'
var $noAuth = true;
var $previewUpdateInterval = 10;
var $previewWidth = 240;
var $maxProgressList = 5;
var $deleteOnRemove = true;
var $browserRestrictFiles = ['.iso','.vdi','.vmdk','.img','.bin','.vhd','.hdd','.ovf','.ova','.xml','.vbox','.cdr','.dmg','.ima','.dsk','.vfd'];
var $hostMemInfoRefreshInterval = 5;
var $vmMemoryStartLimitWarn = true;
var $vmMemoryOffset = 1024;
var $enableGuestAdditionsVersionDisplay = true;
var $consoleResolutions = ['640x480','800x600','1024x768','1280x720','1440x900'];
var $consoleKeyboardLayout = 'EN';
var $nicMax = 4;
}
EOL

rm /script_init.sh
exit 0
