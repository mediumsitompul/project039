<?php

define('HOST', '192.168.100.100:6607');
define('USER', 'pqr');
define('PASS', 'Pensi2021');
define('DB', 'db_quiz');
$connect = mysqli_connect(HOST, USER, PASS, DB) or die('Not Connect');


$queryResult=$connect->
query("SELECT COUNT(answer) AS jumlah
FROM t_quiz_answer");


$result=array();
while($fetchData=$queryResult->fetch_assoc()) {
	$result[]=$fetchData;
}

    if($result){
        echo json_encode($result);
    }else{
        echo json_encode('KOSONG');
    }
?>
