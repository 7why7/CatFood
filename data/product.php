<?php
	require("init.php");
	@$kw=$_REQUEST["kw"];
	$kw=urldecode($kw);
//	var_dump($kw);
	@$pno=$_REQUEST["pno"];
	if(!$pno) $pno=1;
	$sql="SELECT msg,title,price,lid FROM mm_product ";		
	if($kw){
		$kws=explode(" ",$kw);//把kw的值切割
		for($i=0;$i<count($kws);$i++){
			$kws[$i]=" title like '%".$kws[$i]."%'";//再将kw拼接
		}
		$where=" where ".implode(" and ",$kws);
		$sql.=$where;
	}
	$result=mysqli_query($conn,$sql);
	$selectCount=mysqli_fetch_all($result,MYSQLI_ASSOC);
	$count=count($selectCount);//得到记录数
	$countPno=ceil($count/9);//得到有多少页
	$sql.=" limit ".(($pno-1)*9).","."9";
	$result=mysqli_query($conn,$sql);
	$rows=mysqli_fetch_all($result,MYSQLI_ASSOC);
	$output=[];
	$output["countPno"]=$countPno;
	$output["pno"]=$pno;
	$output["data"]=$rows;
	echo json_encode($output);
?>