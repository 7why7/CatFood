 <?php
//2:设置响应头格式
header("Content-Type:application/json;charset=utf-8");
//3:获取数据库连接
$conn = mysqli_connect("127.0.0.1","root","","mm",3306);
header('Access-Control-Allow-Origin:http://localhost:3000');
header('Access-Control-Allow-Credentials:true');
//4:设置编码格式
mysqli_query($conn,"SET NAMES UTF8");
function sql_execute($sql){
  global $conn;
  $result = mysqli_query($conn, $sql);
  if(stripos($sql,"select") === 0)
    if(!$result){
      return  "查询执行失败！请检查SQL语法：$sql";
    }else {
      return $rowList = mysqli_fetch_all($result,MYSQLI_ASSOC);
    }
  else
    return $result;
}
?>