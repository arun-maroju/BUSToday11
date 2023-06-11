<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.avengers.bus.entityModels.*,java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Booking System</title>

<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Font Awesome icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
/* Styles */

body {
  background-color: white;
  padding: 20px;
}

.container {
  max-width: 500px;
  margin: 0 auto;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

select,
input[type="date"],
button {
  width: 100%;
  padding: 12px;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 16px;
}

.button-group {
  display: flex;
  justify-content: space-between;
}

button {
  background-color: #4CAF50;
  color: white;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}
.smaller-btn {
  font-size: 16px;
  padding: 1px;
  height: 30px;
  width: 30px;
}

#swap-button
{
	margin-top: 34px;
	margin-bottom: 20px;
}




body{
  background-image: url('https://static.abhibus.com/assets/img/bus-seach-bg.png');
  background-repeat: no-repeat;
  background-size: 100% 170%;
}


.container {
  max-width: 500px;
  margin: 0 auto;
}
</style>

<script>

$(document).ready(function(){
  $("#searchBuses").click(function(){
    $("#buslist").show();
  });

  // Update destination options based on source selection
  $("#fssId").change(function() {
    var selectedSource = $(this).val();
    $("#tssId option").show(); // Show all options
    $("#tssId option[value='" + selectedSource + "']").hide(); // Hide selected source option
  });
  
  $("#tssId").change(function() {
    var selectedSource = $(this).val();
    $("#fssId option").show(); // Show all options
    $("#fssId option[value='" + selectedSource + "']").hide(); // Hide selected source option
  });
  
  // Swap values between source and destination fields
  $("#swapBtn").click(function() {
    var sourceValue = $("#fssId").val();
    var destinationValue = $("#tssId").val();
    
    $("#fssId").val(destinationValue);
    $("#tssId").val(sourceValue);
    
    
    
  });
});

</script>

</head>
<body >

<div class="container" id="me">
  <form method="POST" action="getBusList">
    <div class="form-group">
      <div class="row">
        <div class="col">
          <label for="fssId"><i class="fas fa-map-marker-alt"></i> From:</label>
          <select id="fssId" name="fssId" class="form-control" required>
            <option value="" disabled selected hidden>Source</option>
            <% List<Stations> slist=(List<Stations>)request.getAttribute("stationList");
              for(Stations s:slist){ %>
              <option value="<%= s.getStop_id() %>"><%= s.getStop_name()%></option>
            <% } %>
          </select>
        </div>
        
		 <div class="col1" id="swap-button">
         <button id="swapBtn" type="button" class="btn btn-secondary smaller-btn"><i class="fas fa-exchange-alt"></i></button>
       	 </div>
       	 
        <div class="col">
          <label for="tssId"><i class="fas fa-map-marker-alt"></i> To:</label>
          <select id="tssId" name="tssId" class="form-control" required>
            <option value="" disabled selected hidden>Destination</option>
            <% for(Stations s:slist){ %>
              <option value="<%= s.getStop_id() %>"><%= s.getStop_name()%></option>
            <% } %>
          </select>
        </div>
		
		   
       	 
      </div>
    </div>

    <div class="form-group">
      <div class="row">
        <div class="col">
          <label for="travelClass"><i class="fas fa-graduation-cap"></i> Type:</label>
          <select id="travelClass" name="travelClass" class="form-control" required>
            <option value="-1">Any</option>
            <% List<BusTypes> btlist=(List<BusTypes>)request.getAttribute("busTypeList");
              for(BusTypes bt:btlist){ %>
              <option value="<%= bt.getBsty_id() %>"><%= bt.getBsty_title() %></option>
            <% } %>
          </select>
        </div>
             
        <div class="col">
          <label for="datePicker"><i class="fas fa-calendar-alt"></i> Travel Date:</label>
          <input type="date" id="datePicker" name="date" class="form-control" required>
        </div>
      </div>
    </div>

    <div class="form-group">
      <div class="button-group">
<!-- id="searchBuses" -->        <button  type="submit" class="btn btn-primary">Search Buses</button>
      </div>
    </div>
  </form>
</div>



<script>
  // Set the minimum and maximum dates for the date picker
//  var today = new Date();
 // var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);
 // var nextMonth = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

//  var datePicker = document.getElementById('datePicker');
//  datePicker.min = tomorrow.toISOString().split('T')[0];
// datePicker.max = nextMonth.toISOString().split('T')[0];

var today = new Date();
var nextMonth = new Date();
nextMonth.setMonth(nextMonth.getMonth() + 1);

var datePicker = document.getElementById('datePicker');
datePicker.min = today.toISOString().split('T')[0];
datePicker.max = nextMonth.toISOString().split('T')[0];

</script>


</body>
</html>