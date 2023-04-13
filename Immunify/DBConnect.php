<?php
class DBConnect
{
    private $db = NULL;

    const DB_SERVER = "localhost";
    const DB_USER = "root";
    const DB_PASSWORD = "";
    const DB_NAME = "immunify";

    public function __construct()
    {
        $dsn = 'mysql:dbname=' . self::DB_NAME . ';host=' . self::DB_SERVER;
        try {
            $this->db = new PDO($dsn, self::DB_USER, self::DB_PASSWORD);
        } catch (PDOException $e) {
            throw new Exception('Connection failed: ' .
                $e->getMessage());
        }
        return $this->db;
    }
    // public function auth()
    // {
    //     session_start();
    //     if (!isset($_SESSION['username'])) {
    //         header("center: index.php");
    //     }
    // }
    public function personUser($fname, $mname, $lname, $sex, $mail, $mobile, $haddress, $city, $hstate, $pincode, $dob, $dov, $bg, $cnic, $center)
    {
        $stmt = $this->db->prepare("INSERT INTO person (fname,mname,lname,sex,email,mobile,haddress,city,hstate,pincode,dob,dov,bg,cnic,center_id)"
            . "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        $stmt->execute([$fname, $mname, $lname, $sex, $mail, $mobile, $haddress, $city, $hstate, $pincode, $dob, $dov, $bg, $cnic, $center]);
        return true;
    }

    public function getcentersList()
    {
        $stmt = $this->db->prepare("select * from center");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getCenterName($loc)
    {
        $stmt = $this->db->prepare("select center.name from center where center_id =?");
        $stmt->execute([$loc]);
        return $stmt->fetchAll();
    }
}