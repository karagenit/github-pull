<?php

if ( $_SERVER['HTTP_X_GITHUB_EVENT'] == 'push') {

	shell_exec("wiki-build");
	die("finished " . mktime());

}

?>
