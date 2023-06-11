<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.avengers.bus.dtoModels.*,com.avengers.bus.inputModels.*,java.util.*" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Seat Layout</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
    <style>
       .bus-seat-layout {
        
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 10px;
        }
        
          .space-layout {
          
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 10px;
           
        }
            .bus-seat-layout1 {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 5px;
            height: 463.5px;
       		}
       		
       		.bus-seat1 {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 87px;
            margin: 5px;
            text-align: center;
            line-height: 40px;
            border: 1px solid #ccc;
            background-color: #fff;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        	}
       		
       		
       	.bus-seat1.selected {
       		
            background-color: #2ecc71;
            color: rgb(256, 256, 256);
        }

        .bus-seat1.disabled {
            background-color: #ddd;
            color: black;
            cursor: not-allowed;
        }
       		
       		
       		
       		

        .bus-seat {
        
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            margin: 5px;
            text-align: center;
            line-height: 40px;
            border: 1px solid #ccc;
            background-color: #fff;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }

        .bus-seat.selected {
            background-color: #2ecc71;
            color: rgb(256, 256, 256);
        }

        .bus-seat.disabled {
            background-color: #ddd;
            color: black;
            cursor: not-allowed;
        }
        
            .bus-container {
            
            border: 1px solid black;
            border-top: 20px solid maroon;
            border-bottom: 3px solid black;
          	background-color: silver;  
          
        }
        
        
          #FirstBookingBlock {
  	  transform: rotate(0deg);
  }
  
        
    </style>
</head>
<body>
    
    
    
    <%  List<Passengers> pl = (List<Passengers>) request.getAttribute("pl");
   		 List<SeatsBookedForOneService> sl = (List<SeatsBookedForOneService>) request.getAttribute("sl");
   		 
   		 int passCount = pl.size();
    
    %>
    
      <table>
    <tr>
    		<th> passenger_id </th>
    		<th>passenger_name </th>
    		<th> passenger_gender </th>
    		<th> passenger_age </th>
    		<th> seat_name </th>
    </tr>
    
    <%for(Passengers p:pl){
    %>
    <tr> 	<td><%=p.getPassenger_id() %></td>	<td><%=p.getPassenger_name() %></td>	<td><%=p.getPassenger_gender() %></td>	<td><%=p.getPassenger_age() %></td>	<td><%=p.getSeat_name() %></td>	</tr>
    <% } %>
    </table>
    
    <!-- private int service_id;
	private int seat_id;
	private String seat_name;
	private boolean status;
	private String gender; -->
    
    
          <table>
    <tr>
    		<th> service_id </th>
    		<th>seat_id </th>
    		<th> status </th>
    		<th> gender </th>
    </tr>
    
    <%for(SeatsBookedForOneService s:sl){
    %>
    <tr> <td><%=s.getService_id() %></td>		<td><%=s.getSeat_id() %></td> <td><%=s.getStatus() %></td> 	<td><%=s.getGender() %></td>		</tr>
    <% } %>
    </table>
    
    
    <div class="bus-seat-layout">    
    <div class="bus-container">
   					          
    <canvas id="canvas" width="50" height="50" style="position: relative ;left:150px"></canvas>
       <script>
    // Get the canvas element
    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");

    // Define the center point of the canvas
    var centerX = canvas.width / 2;
    var centerY = canvas.height / 2;

    // Define the outer radius of the steering wheel
    var outerRadius = 20;
    var innerRadius = 15;

    // Define colors
    var backgroundColor = "#f2f2f2";
    var spokeColor = "#000000";

    // Draw the inner circle
    ctx.beginPath();
    ctx.arc(centerX, centerY, innerRadius, 0, 2 * Math.PI);
    ctx.fillStyle = backgroundColor;
    ctx.fill();
    ctx.lineWidth = 2;
    ctx.strokeStyle = spokeColor;
    ctx.stroke();

    // Draw the spokes of the steering wheel
    var numSpokes = 3;
    var angle = (2 * Math.PI) / numSpokes;

    for (var i = 0; i < numSpokes; i++) {
      ctx.save();
      ctx.translate(centerX, centerY);
      ctx.rotate(i * angle);

      ctx.beginPath();
      ctx.moveTo(0, 0);
      ctx.lineTo(innerRadius, 0);
      ctx.lineWidth = 3;
      ctx.strokeStyle = spokeColor;
      ctx.stroke();

      ctx.restore();
    }
  </script>
  
    		<div id="FirstBookingBlock" class="bus-seat-layout">
    		
        <%-- Loop to generate bus seats dynamically --%>
					      <!-- 1,2 -->  <div class="bus-seat-layout">
					      <hr>
					          <% int arr[][]={{1,2},{3,4},{5,6},{7,8},{9,10},{11,12},{13,14},{15,16}};
					         	for(int col=0;col<2;col++)	{%>
					         	 <div class="bus-seat-row">					         	
					         	<%  for(int row=0;row<8;row++)
					         		{
					         			int seatNumber = arr[row][col];
					         			
					         			 %>
						                    <%-- Output the seat element with dynamic seat number --%>
						                     <div class="bus-seat" id="<%= seatNumber %>">
						                        <%= seatNumber %>
						                    </div>
						                <% 	}%>
					         		</div>
					         		<% } %>
					      <!-- 1,2 -->   </div>
					       <!-- 3 -->   <div class="bus-seat-layout">
				        <%-- Loop to generate bus seats dynamically --%>
				       
				            <div class="bus-seat-row">
				                <% for (int col = 25; col <= 28; col++) { %>
				                    <%-- Generate seat numbers dynamically based on row and col --%>
				                    <% int seatNumber = col; %>
				                    <%-- Output the seat element with dynamic seat number --%>
				                    <div class="bus-seat1" id="<%= seatNumber %>">
				                        <%= seatNumber %>
				                    </div>
				                <% } %>
				                    
				            </div>
				
				     
				        <!-- 3 -->  </div>
        
         </div>
        </div>
     <div class="space-layout">
     </div>
        <div class="space-layout">
     </div>
        <div class="space-layout">
     </div>
    
    <div class="bus-container">
   							 <div id="SecondBookingBlock" class="bus-seat-layout1">
    	
						    	<div class="bus-seat-layout1">
						    	
						    	
						    	       
						            <div class="bus-seat-row">
						                <% for (int col = 17; col <= 23; col++) { %>
						                    <%-- Generate seat numbers dynamically based on row and col --%>
						                    <% int seatNumber =col;
						                    col++;%>
						                    <%-- Output the seat element with dynamic seat number --%>
						                    <div class="bus-seat1" id="<%= seatNumber %>">
						                        <%= seatNumber %>
						                    </div>
						                <% } %>
						                    
						            </div>
						
						     
						    	
						            <%-- Loop to generate bus seats dynamically --%>
						      
						            <div class="bus-seat-row">
						                <% for (int col = 18; col <= 24; col++) { %>
						                    <%-- Generate seat numbers dynamically based on row and col --%>
						                    <% int seatNumber = col ;
						                    col++;%>
						                    <%-- Output the seat element with dynamic seat number --%>
						                    <div class="bus-seat1" id="<%= seatNumber %>">
						                        <%= seatNumber %>
						                    </div>
						                <% } %>
						                    
						            </div>
				        
			 </div>

       <div class="space-layout">
       </div>
				
				         <div class="bus-seat-layout1">
				        <%-- Loop to generate bus seats dynamically --%>
				        
				            <div class="bus-seat-row">
				                <% for (int col = 29; col <= 32; col++) { %>
				                    <%-- Generate seat numbers dynamically based on row and col --%>
				                    <% int seatNumber = col; %>
				                    <%-- Output the seat element with dynamic seat number --%>
				                    <div class="bus-seat1" id="<%= seatNumber %>">
				                        <%= seatNumber %>
				                    </div>
				                <% } %>
				                    
				            </div>
				
				 
				   		 </div>
    </div>
    </div>
    </div>
    
    	  <% Gson gson = new Gson();
	    String seatStatusJson = gson.toJson(sl);
	    System.out.println(seatStatusJson); %>
	    
    
  <script>
 
  
  $(document).ready(function() {
	  
	  
	   
	  
	  
	  
	    var maxSeats = <%=passCount%>; // Maximum number of seats allowed
	    var seats_selected_count = 0;
	    var selected_seats = {};

	    
	    var seatStatusData = <%= seatStatusJson %>;
	    disableSeats(seatStatusData);
	    // Add event listener to each bus seat
	    $('.bus-seat').click(function() {
	        // Check if the maximum seat count has been reached
	        if (seats_selected_count >= maxSeats && !$(this).hasClass('selected')) {
	            showPopup("You can choose "+maxSeats+" seats only");
	            return; // Exit the function if the maximum count is reached and the seat is not selected
	        }

	        // Check if the seat is disabled
	        if ($(this).hasClass('disabled')) {
	            showPopup("This seat is not available");
	            return; // Exit the function if the seat is disabled
	        }

	        // Toggle selected class on seat click
	        $(this).toggleClass('selected');

	        var seatId = $(this).attr('id');
	        if ($(this).hasClass('selected')) {
	            // Increment count and add seat to selected_seats object
	            seats_selected_count++;
	            
	            if ($(this).css('background-color') === 'rgb(255, 192, 203)') {
	            	selected_seats[seatId] = "Female";
	              }
	            else
	            	{
	            	console.log("not pink");
		            selected_seats[seatId] = "Any";

	            	}
	            
	            
	        } else {
	            // Decrement count and remove seat from selected_seats object
	            seats_selected_count--;
	            delete selected_seats[seatId];
	        }

	        // Output selected seat count and seat data in JSON format
	        console.log('Seats selected:', seats_selected_count);
	        console.log('Selected seats:', JSON.stringify(selected_seats));
	    });

	    $('.bus-seat1').click(function() {
	        // Check if the maximum seat count has been reached
	        if (seats_selected_count >= maxSeats && !$(this).hasClass('selected')) {
	            showPopup("You can choose "+maxSeats+" seats only");
	            return; // Exit the function if the maximum count is reached and the seat is not selected
	        }

	        // Check if the seat is disabled
	        if ($(this).hasClass('disabled')) {
	            showPopup("This seat is not available");
	            return; // Exit the function if the seat is disabled
	        }

	        // Toggle selected class on seat click
	        $(this).toggleClass('selected');

	        var seatId = $(this).attr('id');
	        if ($(this).hasClass('selected')) {
	            // Increment count and add seat to selected_seats object
	            seats_selected_count++;
	            selected_seats[seatId] = true;
	        } else {
	            // Decrement count and remove seat from selected_seats object
	            seats_selected_count--;
	            delete selected_seats[seatId];
	        }

	        // Output selected seat count and seat data in JSON format
	        console.log('Seats selected:', seats_selected_count);
	        console.log('Selected seats:', JSON.stringify(selected_seats));
	    });

	    // Function to show the popup message
	    function showPopup(message) {
	        alert(message);
	    }


  
  function disableSeats(seats) {
      for (var i = 0; i < seats.length; i++) {
          var seatId = seats[i].seat_id;
          var status = seats[i].status;
          var gender = seats[i].gender;

          var seatElement = $('#' + seatId);

          // Check seat status and gender to determine blocking and color
          if (status) {
        	  console.log("Executing..1");
              if (gender === 'Male') {
            	  console.log("Executing..2");

                  seatElement.addClass('disabled');
                  seatElement.css('background-color', 'orange');
              } else if (gender === 'Female') {
            	  
            	  console.log("Executing..3");

            	  
                  seatElement.addClass('disabled');
                  
                  seatElement.css('background-color', 'rgb(255, 105, 180)');
              }
              else{
            	  console.log("Executing..4");

              }
          }
          else{
        	  
        	  
				if (gender === 'Female') {
            	  
            	  console.log("Executing..5");

            	 seatElement.css('background-color', 'rgb(255, 192, 203)');
              }
        	  
          }
      }
  }
  
  });

    </script>   
</body>
</html>