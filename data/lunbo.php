<?php
	require("init.php");
	$sql="select * from mm_banner";
	$result=mysqli_query($conn,$sql);
	$rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
	echo json_encode($rows);
?>