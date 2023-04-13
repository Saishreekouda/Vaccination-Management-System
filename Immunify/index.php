<?php
// Include config file
require_once "DBConnect.php";
  $db = new DBConnect();
?>
<?php
$locations = $db->getcentersList();
if (isset($locations)) {
} else {

  echo '<script>alert("No Locations Available")</script>';
}

$success = NULL;
$message = NULL;
if (isset($_POST['submitBtn'])) {
  $fname = $_POST['fname'];
  $mname = $_POST['mname'];
  $lname = $_POST['lname'];
  $sex = $_POST['sex'];
  $mail = $_POST['mail'];
  $mobile = $_POST['mobile'];
  $haddress = $_POST['haddress'];
  $city = $_POST['city'];
  $hstate = $_POST['hstate'];
  $pincode = $_POST['pincode'];
  $dob = $_POST['dob'];
  $dov = $_POST['dov'];
  $bg = $_POST['bg'];
  $cnic = $_POST['cnic'];
  $location = $_POST['location'];


  $db = new DBConnect();
  $flag = $db->personUser($fname, $mname, $lname, $sex, $mail, $mobile, $haddress, $city, $hstate, $pincode, $dob, $dov, $bg, $cnic, $location);

  if ($flag) {
    $success = "Successfully Register!";
  } else {
    $message = "There was some error saving the user to the database!";
  }
}
// Employee Ke Game
$title = "Employee";
$setEmployeeActive = "active";
?>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/style.css">

<style>
  /* General styles */
body {
  font-family: Arial, sans-serif;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
}

.row {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.col {
  flex: 1;
  margin: 10px;
}

/* Header styles */
header {
  background-color: #02AEAE;
  color: white;
  padding: 10px;
}

.logo {
  max-width: 80px;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.navbar ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.navbar li {
  margin: 0 10px;
}

.navbar a {
  color: white;
  text-decoration: none;
  font-weight: bold;
}

/* Intro section styles */
#intro {
  background-image: url(./assets/back2.jpg);
  height: 100vh;
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
  background-position: center center;
}

.intro-text {
  font-size: 40px;
  font-weight: bold;
  color: #02AEAE;
}

.intro-subtext {
  font-size: 20px;
  color: #555;
}

.intro-button {
  background-color: #02AEAE;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  font-size: 18px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.intro-button:hover {
  background-color: #018282;
}

/* Form styles */
.form-group {
  margin-bottom: 20px;
}

.form-label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

.form-input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

.form-select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
  appearance: none;
}

form {
  max-width: 800px;
  margin: 0 auto;
}

label {
  display: block;
  font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="number"],
input[type="date"],
select {
  width: 100%;
  padding: 12px;
  margin-top: 8px;
  margin-bottom: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type="radio"] {
  margin: 4px 8px 4px 0;
}

button[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1.2rem;
}

button[type="submit"]:hover {
  background-color: #3e8e41;
}

.details {
  background-color: #f2f2f2;
  padding: 20px;
  border-radius: 5px;
}

.row {
  display: flex;
  flex-wrap: wrap;
  margin-right: -16px;
  margin-left: -16px;
}

.col-md-12,
.col-md-6,
.col-md-4 {
  flex: 0 0 auto;
  width: 100%;
  max-width: 100%;
  position: relative;
  padding-right: 16px;
  padding-left: 16px;
}

@media (min-width: 768px) {
  .col-md-12 {
    flex-basis: 0;
    flex-grow: 1;
    max-width: 100%;
  }
  .col-md-6 {
    flex: 0 0 auto;
    width: 50%;
    max-width: 50%;
  }
  .col-md-4 {
    flex: 0 0 auto;
    width: 33.333333%;
    max-width: 33.333333%;
  }
}

.form-group {
  margin-bottom: 1rem;
}

.form-control:focus {
  border-color: #4CAF50;
  box-shadow: none;
}
#intro {
    background-image: url("https://www.gannett-cdn.com/-mm-/9e1f6e2ee20f44aa1f3be4f71e9f3e52b6ae2c7e/c=0-110-2121-1303/local/-/media/2021/05/07/USATODAY/usatsports/vaccine-vial-and-syringe.jpg?width=2121&height=1193&fit=crop&format=pjpg&auto=webp");
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    background-position: center center;
  }

/* Navbar styling */
.navbar {
  background-color: #1a1a1a; /* Set background color */
  padding: 10px 0; /* Add padding */
  border-radius: 0; /* Remove border-radius */
}

.navbar img {
  margin-right: 10px; /* Add margin to the logo */
}

.navbar .nav-link {
  color: #fff; /* Set text color */
  margin-left: 20px; /* Add margin between links */
}

.navbar .nav-link:hover {
  color: #f5a623; /* Change text color on hover */
}

.white{
  color: white;
}



</style>



<body>
    <nav class="navbar navbar-expand-lg navbar-dark mB pb-4 pt-4">
      <div class="container-fluid">
        <div class="text-light container-fluid">
          Immunify
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.php">Home</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="details.php">Get Vaccination Report</a>
            </li>



            <li class="nav-item">
              <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#employeemodel">Employee Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#exampleModal">Admin Login</a>
            </li>

          </ul>
        </div>
      </div>
    </nav>

    <div div id="intro" class="bg-image">
      <div class="container px-5 mx-5">
        <div class="row justify-content-start mx-3">
          <div class="col ">
            <!-- <div class="badge text-wrap py-3 px-3 fs-6 mat" id="primary">
              Hello we are
            </div> -->
            <div class="fs-1 fw-bold mat mC heading white">Immunify</div>

            <div class="fs-3  mt-2 white">Vaccination Hub</div>
            <div class="fs-5  mt-3 white">Designed to Meet your Needs</div>

          </div>
        </div>
        <div class="row justify-content-start mt-4 mx-3 white">
          <div class="col ">
            <!-- <button class="btn text-white fs-5" id="primary">Get Report</button> -->
            <button class="btn btn-outline-dark fs-5 ">Get Report</button>
            <div class="fs-4  mt-4 mC white"><b>or Register Below</b> </div>

          </div>

        </div>
      </div>
    </div>

  <div class="container px-5">



    <div class="container" style="margin-top:2%;">
      <?php if (isset($success)) : ?>
        <div class="alert-success fade-out-5"><?= $success; ?></div>
      <?php endif; ?>
      <?php if (isset($message)) : ?>
        <div class="alert-danger fade-out-5"><?= $message; ?></div>
      <?php endif; ?>
      <h1 style="text-align:center" class="mC">Register for Vaccine</h1>
      <hr>
      <form method="post" role="form" action="">
        <div class="container details">
          <div class="row  justify-content-center">
            <div class="form-group col-md-4 col-12">
              <label for="fname"><b>First Name</b></label>
              <input type="text" class="form-control" placeholder="Enter First Name*" name="fname" required>
            </div>

            <div class="form-group col-md-4 col-12">
              <label for="mname"><b>Middle Name</b></label>
              <input type="text" class="form-control" placeholder="Enter Middle Name" name="mname">
            </div>

            <div class="form-group col-md-4 col-12">
              <label for="lname"><b>Last Name</b></label>
              <input type="text" class="form-control" placeholder="Enter Last Name*" name="lname" required>
            </div>
          </div>
          <br>
          <div class="form-group col-md-12 col-12">
            <label for="inputEmail4"><b>Email</b></label>
            <input type="email" class="form-control" placeholder="Email" name="mail">
          </div>
          <br>
          <div class="form-group col-md-12 col-12">
            <label for="gender"><b>Gender </b></label>
            <br>
            <input type="radio" name="sex" value="male" checked="true"> Male
            <input type="radio" name="sex" value="female"> Female
            <input type="radio" name="sex" value="other"> Other<br>

          </div>
          <br>

          <div class="form-group col-md-12 col-12">
            <label for="inpcnic"><b>UniqueID</b></label>
            <input type="text" class="form-control" placeholder="17301*********" name="cnic" required>

          </div>
          <br>
          <div class="row">
            <div class="form-group col-md-6 col-12">
              <label for="mobile"><b>Mobile Number</b></label>
              <input type="text" class="form-control" placeholder="10 digit mobile no" name="mobile" required>
            </div>

            <div class="form-group col-md-6 col-12">
              <label for="bg"><b>Blood Group </b></label>
              <input type="city" placeholder="Blood Group" class="form-control" name="bg" required>

            </div>

          </div>
          <br>
          <div class="form-group col-md-12 col-12">
            <label for="haddress"><b>Address </b></label>
            <input type="text" placeholder="Full Address" class="form-control" name="haddress" required>

          </div>

          <br>
          <div class="row">
            <div class="form-group col-md-6 col-12">
              <label for="city"><b>City </b></label>
              <input type="city" placeholder="City" class="form-control" name="city" required>
            </div>

            <div class="form-group col-md-6 col-12">
              <label for="hstate"><b>State </b></label>
              <input type="city" placeholder="State" class="form-control" name="hstate" required>
            </div>

            <div class="form-group col-md-4 col-12">
              <label for="pincode"><b>Pincode </b></label>
              <input type="number" placeholder="Pincode" class="form-control" name="pincode" required>
            </div>
          </div>
          <br>
          <div class="row">
            <div class="col-md-6 col-12">
              <label for="dob"><b>Enter Date of Birth </b></label>
              <input type="date" placeholder="mm/dd/yyyy" class="form-control" name="dob" required>
            </div>
            <div class="col-md-6 col-12">
              <label for="dov"><b>Schedule Date for Vaccination </b></label>
              <input type="date" placeholder="mm/dd/yyyy" class="form-control" name="dov" required>
            </div>
          </div>

        </div>
        <br>
        <div class="row mx-1">
          <div class="form-group col-md-12 col-12  px-2">
            <label for="Location"><b>Location</b></label>
            <select id="Location" type="dropdown" name="location">
              <option value="" selected disabled>Select Location</option>
              <?php
              if (isset($locations)) {
                $i = 1;
                foreach ($locations as $l) : ?>
                  <option value="<?php echo $l['center_id'] ?>"> <?php echo $i . "\t\t " . $l['name']; ?>
                  </option>
              <?php
                  $i++;
                endforeach;
              }

              ?>
            </select>

          </div>
        </div>
        <div class="row justify-content-center pt-5">
          <div class="col-md-1">
            <button type="submit" name="submitBtn" class="btn text-white fs-5 mB hBtn">Register</button>

          </div>

        </div>
        <!-- </div> -->
      </form>

    </div>

  </div>
</body>