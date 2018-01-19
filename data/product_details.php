<?php
	require("init.php");
	@$lid=$_REQUEST["lid"];
	$sql="select * from mm_product_pic where pic_id=$lid";
	$result=mysqli_query($conn,$sql);
	$rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
	echo json_encode($rows);
?>