<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Avengers BusBooking</title>
  <style>
    /* Navbar styles */
    .navbar { background-color: #333; height: 45px; padding: 10px; display: flex; align-items: center; justify-content: space-between; }
    .logo { color: #fff; font-size: 24px; text-decoration: none; font-weight: bold; }
    .navbar-nav { list-style-type: none; margin: 0; padding: 0; }
    .nav-item { display: inline-block; margin-right: 10px; }
    .nav-link { color: #fff; text-decoration: none; padding: 15px; border-radius: 5px; }
    .nav-link.active { background-color: #555; }
    .nav-link:hover { background-color: #555; }
    .nav-link:active { background-color: #777; }
    .nav-link:focus { outline: none; background-color: #777; }
    .navbar-right { display: flex; align-items: center; }
    .user-actions { position: relative; }
    .user-actions .login-btn { background-color: #555; }
    .user-actions .signup-btn { background-color: #777; }
    .user-actions a { color: #fff; text-decoration: none; padding: 10px; border-radius: 5px; margin-right: 5px; }
    .user-actions a:hover, .user-actions a:active { background-color: #999; }
    .user-actions .dropdown { position: absolute; top: 100%; left: 0; width: 150px; background-color: #333; padding: 10px; display: none; }
    .user-actions:hover .dropdown { display: block; }
    .user-actions .dropdown a { display: block; color: #fff; text-decoration: none; padding: 5px; }
    
    /* Popup styles */
    .popup { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 9999; align-items: center; justify-content: center; }
    .popup-content { background-color: #fff; padding: 20px; border-radius: 5px; }
    .popup-form .form-group { margin-bottom: 10px; }
    .popup-close { position: absolute; top: 10px; right: 10px; color: #777; cursor: pointer; }
    .welcome-text { font-weight: bold; font-size: 24px; color: #fff; background-color: #333; padding: 10px; text-align: center; }
  </style>
</head>
<body>
<nav>
  <div class="navbar">
    <a href="#" class="logo">Avengers BTRS</a>
    <ul class="navbar-nav">
      <li class="nav-item"><a class="nav-link active" href="#" onclick="getContentData()">Home</a></li>
      <li class="nav-item"><a class="nav-link" href="#">My Bookings</a></li>
      <li class="nav-item"><a class="nav-link" href="#" onclick="showContactContent()">Contact Us</a></li>
      <li class="nav-item"><a class="nav-link" href="#" onclick="showAboutParagraph()">About</a></li>
    </ul>
    <div class="navbar-right">
      <div class="user-actions">
        <div class="dropdown">
          <a href="#">Admin Login</a>
          <div class="popup" id="adminPopup">
            <div class="popup-content">
              <span class="popup-close" onclick="closePopup('adminPopup')">&times;</span>
              <h2>Admin Login</h2>
              <form class="popup-form">
                <div class="form-group">
                  <label for="usernameAdmin">Username:</label>
                  <input type="text" id="usernameAdmin" class="form-control">
                </div>
                <div class="form-group">
                  <label for="passwordAdmin">Password:</label>
                  <input type="password" id="passwordAdmin" class="form-control">
                </div>
                <button type="button" class="btn btn-primary">Login</button>
              </form>
            </div>
          </div>
          <a href="#">User Login</a>
          <div class="popup" id="userPopup">
            <div class="popup-content">
              <span class="popup-close" onclick="closePopup('userPopup')">&times;</span>
              <h2>User Login</h2>
              <form class="popup-form">
              </form>
            </div>
          </div>
        </div>
        <a href="#" class="login-btn">Login</a>
      </div>
      <div class="user-actions">
        <div class="dropdown"></div>
        <a href="#" class="signup-btn" onclick="openPopup('signupPopup')">Sign Up</a>
        <div class="popup" id="signupPopup">
          <div class="popup-content">
            <span class="popup-close" onclick="closePopup('signupPopup')">&times;</span>
            <h2>Sign Up</h2>
            <form class="popup-form">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</nav>
<script>
  function openPopup(popupId) {
    document.getElementById(popupId).style.display = "flex";
  }
  function closePopup(popupId) {
    document.getElementById(popupId).style.display = "none";
  }
</script>
<script>
  function showAboutParagraph() {
    document.getElementById("contactContent").style.display = "none";
    document.getElementById("aboutParagraph").style.display = "block";
  }
</script>
<div>
  <div id="contentOfThePage"></div>
</div>
<script>
  function showContactContent() {
    document.getElementById("aboutParagraph").style.display = "none";
    document.getElementById("contactContent").style.display = "block";
  }
  function getContentData() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("contentOfThePage").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "/BUS/", true);
    xhttp.send();
  }
</script>
</body>
</html>