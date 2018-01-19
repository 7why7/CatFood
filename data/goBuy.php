<?php
	require("init.php");
	$sql="select n.price,m.title,n.count,n.pid from mm_product_add n,mm_product m where n.pid=m.lid";
	$result=mysqli_query($conn,$sql);
	$rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
	echo json_encode($rows);
?>