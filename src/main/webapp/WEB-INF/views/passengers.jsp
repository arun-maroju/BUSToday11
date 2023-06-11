<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
    <title>Passenger Management</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .passenger-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 10px;
            margin-bottom: 10px;
        }

        .passenger-container input,
        .passenger-container select {
            width: 100%;
            padding: 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Passengers Details</h1>
        <form action="passengerPreview" method="POST">
            <div id="passenger-list">
                <%   int counter = (Integer) request.getAttribute("count");
               		 System.out.println(counter);
                     String seatsData = (String) request.getAttribute("seatsData");
               		 System.out.println(seatsData);
                
                     Gson gson = new Gson();
                     Map<String, String> selectedSeatsData = gson.fromJson(seatsData, Map.class);
                     int i=1;
                %>
 
                
                
                <%for (Map.Entry<String, String> entry : selectedSeatsData.entrySet()) {
                	System.out.println("key is");
                    String seatNumber = entry.getKey();
                    System.out.println("Value is");
                    String genderStatus1 = entry.getValue();
                    System.out.println("Seat Number: " + seatNumber + ", Gender Status: " + genderStatus1);
                    String genderStatus = selectedSeatsData.getOrDefault(seatNumber, "Any");

                 %>
                <div class="passenger-container">
                	<label>Passenger Id</label>
                	<label>Seat Number</label>
                    <input type="text" name="passenger_id[]" value="P<%= String.format("%03d", i) %>" required readonly>
                    <input type="text" name="seat_number[]" value="<%= seatNumber %>" required readonly>
                    <input type="text" name="passenger_name[]" placeholder="Passenger Name" required>
                    <input type="text" name="passenger_age[]" placeholder="Passenger Age" required>
                    <select name="passenger_gender[]"  <%= genderStatus.equals("Female") ? "disabled" : "" %> required>
                        <option value="Male" <%= genderStatus.equals("Male") ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= genderStatus.equals("Female") ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= genderStatus.equals("Other") ? "selected" : "" %>>Other</option>
                    </select>
                    <input type="hidden" name="passenger_gender[]" value="<%= genderStatus %>" <%= genderStatus.equals("Female") ? "" : "disabled" %>>
                </div>
                <% i++;} %>
            </div>
            <br>
            <button type="submit" value="Submit">Submit</button>
        </form>
    </div>
</body>
</html>
