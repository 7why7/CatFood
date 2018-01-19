<?php
	session_start();
	require_once("init.php");
	header("Content-Type:application/json");
	@$uid=$_SESSION["uid"];
//	echo $uid;
	if($uid){
	  $sql="SELECT uname FROM mm_user WHERE uid=$uid";
	  $result=mysqli_query($conn,$sql);
	  $row=mysqli_fetch_assoc($result);
//	  var_dump($row);
	  $uname=$row["uname"];
	  echo json_encode(["code"=>1,"uname"=>$uname]);
	}else{
	  echo json_encode(["code"=>0,"uname"=>""]);
	}
?>