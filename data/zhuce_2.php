<?php
	require("init.php");
	@$uname=$_REQUEST["uname"];
	$sql="SELECT * FROM mm_user WHERE uname='$uname'";
	$result=mysqli_query($conn,$sql);
	$row=mysqli_fetch_row($result);
	if($row){
		echo '{"code":-1,"msg":"用户名已被占用"}';
	}else{
		echo '{"code":1,"msg":"用户名可用"}';
	}
?>