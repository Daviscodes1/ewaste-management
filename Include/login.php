<?php 
session_start();
include "db_conn.php";

if (isset($_POST['uname']) && isset($_POST['password'])) {

    function validate($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $uname = validate($_POST['uname']);
    $pass = validate($_POST['password']);

    if (empty($uname)) {
        header("Location: ../index.php?error=User Name is required");
        exit();
    }
    elseif(empty($pass)){
        header("Location: ../index.php?error=Password is required");
        exit();
    }
    else{
        $sql = "SELECT * FROM employees WHERE phone=:uname AND password=:pass AND status='Active'";

        $query = $conn->prepare($sql);
        $query->execute(array(':uname' => $uname, ':pass' => $pass));
        $fetch = $query->rowCount();
        
        if ($fetch === 1) {
            $row = $query->fetch();
            $_SESSION['user_name'] = $row['fname'];
            $_SESSION['name'] = $row['empno'];
            $_SESSION['id'] = $row['id'];
            $_SESSION['station'] = $row['workstation'];
            $_SESSION['account'] = $row['position'];
            
            if($_SESSION['account'] == "Admin"){
                // Redirect admin users to admin/index.php
                header("Location: ../Admin/index.php");
                exit();    
            }
            elseif($_SESSION['account'] == "Employee"){
                header("Location: ../Employees/index.php");
                exit();
            }
            else{
                header("Location: ../index.php");
                exit();
            }
        }
        else{
            $sql = "SELECT * FROM customer WHERE phone=:uname AND password=:pass";

            $query = $conn->prepare($sql);
            $query->execute(array(':uname' => $uname, ':pass' => $pass));
            $fetch = $query->rowCount();
            
            if ($fetch === 1) {
                $row = $query->fetch();
                $_SESSION['account'] = 'Customer';
                $_SESSION['name'] = $row['phone'];
                header("Location: ../customer/index.php");
                exit();              
            }
            else{
                header("Location: ../index.php?error=Incorrect User name or password");
                exit();
            }
        }
    }
}   
else{
    header("Location: ../index.php");
    exit();
}
?>

