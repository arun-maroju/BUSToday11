<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.avengers.bus.dtoModels.*,java.util.*, java.time.LocalTime, java.time.Duration" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus List Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5aa93;
            font-family: "Brush Script MT", cursive;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding-top: 30px;
        }

        .bus-block {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
        }

        .bus-block:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color:#d8f2f0 ;
            
            
        }

        .bus-title {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .bus-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .bus-details p {
            margin: 0;
        }

        .bus-details .label {
            font-weight: 500;
        }

        .bus-details .time {
            font-weight: bold;
            font-size: 18px;
        }

        .bus-details .date {
            margin-right: 20px;
        }

        .bus-details .seats {
            font-weight: bold;
        }

        .btn-book {
            background-color: #0069d9;
            border-color: #007bff;
            margin-left: 600px;
        }

        .btn-book:hover {
            background-color:#4CAF50 ;
            border-color: #4CAF50;
        }
        
        .green {
    color: black;
}

	.black{
	color: #249630;
	}

        .red {
    color: #7d2215;
}

.bold {
            font-weight: bold;
            font-size: 25px;
            font-family: "Brush Script MT", cursive;
        }
        

    </style>
</head>
<body>

<form method="Get" action="layout">
    <div class="container">
        <h1 class="text-center mb-4" style="color:white">Available Services</h1>
        <% 
        List<BusSearchListDto> buses = (List<BusSearchListDto>) request.getAttribute("buses");
        for (BusSearchListDto b : buses) {
            %>
            
            
            <div class="bus-block">
                <h4 class="bus-title">Service No: <span class="bold red"><%= b.getTrip_id()+""+b.getService_id() %></span></h4>
                <div class="bus-details">
                	<div>
                    <p><span class="label">Type:</span> <span class="time black"><%= b.getBsty_title() %></span></p>
                     
                    </div>
                     <div>
                        <p><span class="label ">Source:</span> <span class="time green"><%= b.getSource() %></span></p>
                        <p><span class="label ">Destination :</span> <span class="time green"><%= b.getDestination() %></span></p>
                    </div>
                    <div>
                        <p><span class="label">Departure:</span> <span class="time green"><%= b.getDepature() %></span></p>
                        <p><span class="label">Arrival:</span> <span class="time green"><%= b.getArrival() %></span></p>
                    </div>
                    <div>
                        <p><span class="label date">Date:</span> <span class="time green"><%= b.getTrip_date() %></span></p>
                        <p><span class="label ">Available Seats:</span> <span class="time green"><%= b.getAvailable_seats() %></span></p>
                    </div>
             
                    
                </div>
                

                
                <button type="submit" value="show" class="btn btn-primary btn-book">View Seats</button>
            </div>
            <% 
        } 
        %>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
</form>
</body>
</html>
