
<?php
$targetFolder = $_SERVER['DOCUMENT_ROOT'].'/storage/app/public';
$linkedFolder = $_SERVER['DOCUMENT_ROOT'].'/public/storage';
symlink($targetFolder,$linkedFolder);
echo "success";
?>