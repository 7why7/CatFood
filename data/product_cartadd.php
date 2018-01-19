<?php
	require("init.php");
	@$pid=$_REQUEST["pid"];
	@$price=$_REQUEST["price"];
	@$count=$_REQUEST["count"];
	$sql="select * from mm_product_add where pid=$pid";
	$result=sql_execute($sql);
	if(count($result)==0){
		$sql="insert into mm_product_add values($pid,$count,$price)";
	}else{
		$sql="update mm_product_add set count=count+$count where pid=$pid";
	}
	$se_result=sql_execute($sql);
	if($se_result){
		echo '{"code":1,"msg":"成功"}';
	}else{
		echo '{"code":-1,"msg":"失败"}';
	}
?>