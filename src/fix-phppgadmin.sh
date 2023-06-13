#!/bin/php
<?php
/**
 * fix-phppgadmin.php
 *
 * Fix phpPgAdmin issues; (discussion at: https://forum.hestiacp.com/t/project-to-run-hestia-in-docker/)
 *
*/

$files = ['/usr/share/phppgadmin/conf/config.inc.php', '/usr/share/phppgadmin/classes/database/Connection.php'];

foreach($files as $file) {
	if ( file_exists( $file ) ) {
        unlink($file);
        echo "$file has been removed";
    }
}

file_put_contents('/usr/share/phppgadmin/conf/config.inc.php', file_get_contents('/etc/phppgadmin/config.inc.php'));
file_put_contents('/usr/share/phppgadmin/classes/database/Connection.php ', file_get_contents('https://raw.githubusercontent.com/Steveorevo/phppgadmin/master/classes/database/Connection.php'));