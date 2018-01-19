<?php
	require("init.php");
	$sql="DELETE FROM mm_product_add";
	$result=mysqli_query($conn,$sql);
	if($result){
		echo '{"code":200, "msg":"删除成功"}';
	}else{
		echo '{"code":300, "msg":"删除失败"}';
	}
?>