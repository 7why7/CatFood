<?php
	require("init.php");
	@$lid=$_REQUEST["lid"];
	$sql="select * from mm_product where lid=$lid";
	$result=mysqli_query($conn,$sql);
	$row=mysqli_fetch_all($result,MYSQL_ASSOC);
	echo json_encode($row);
?>