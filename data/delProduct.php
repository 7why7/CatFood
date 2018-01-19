<?php
	require("init.php");
	@$pid=$_REQUEST["pid"];
	$sql="delete from mm_product_add where pid=$pid";
	$result=sql_execute($sql);
	if($result){
		echo '{"code":1,"msg":"删除成功"}';
	}else{
		echo '{"code":-1,"msg":"删除失败"}';
	}
?>