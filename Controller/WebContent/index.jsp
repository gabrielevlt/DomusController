<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="domus.client.Client"%>
<%@ page import="java.util.StringTokenizer"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.text.DecimalFormat"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DOMUS - House Automation</title>

<!-- Bootstrap -->
<link href="resources/bootstrap-3.3.4-dist/css/bootstrap.min.css"
	rel="stylesheet">

<link href="resources/style.css" rel="stylesheet">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<jsp:useBean id="remote_object" scope="session"
		class="domus.client.Client" />


	<div class="container-fluid">
		<!-- HEADER -->
		<div class="row page-header">
			<h1>
				<span id="title-icon" class="glyphicon glyphicon-home"
					aria-hidden="true"></span> DOMUS <small>Here's what's
					happening in your house</small>
			</h1>
		</div>



		<!-- CLIMATE SECTION - first row
				-temperatura di cucina/salotto/bagno
				-temperatura settata sul termostato* e stato del termostato*
				
		-->
		<div class="row well" id="climate">
			<div class="col-md-4">
				<h3>Climate</h3>
			</div>

			<!-- temperature column -->
			<div class="col-md-4">
				<h4>Temperature</h4>

				<div class="row">
					<div class="col-md-2">
						<%
							NumberFormat f1 = new DecimalFormat("#0.00");
							out.print(f1.format(remote_object.getActualTemperature()));
						%>
					</div>
				</div>

			</div>

			<!-- thermostat column -->
			<div class="col-md-4">
				<h4>Thermostat</h4>



				<div class="row">
					<div class="col-md-4">setted temperature</div>
					<div class="col-md-3">
						<form method="POST" action="setThermostatTemperature.jsp">
							<input type="number" name="settedTemperature"
								class="form-control
								<% if(!remote_object.getThermostatState()) out.print("not-working"); %>"
								value="<%out.print(remote_object.getSettedTemperature());%>">
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">state</div>
					<div class="col-md-3">
						<% 
							if (remote_object.getThermostatState())
									out.print("<a href=\"setThermostatState.jsp?state=off\"><span class=\"label label-success\">working</span></a>");
								else
									out.print("<a href=\"setThermostatState.jsp?state=on\"><span class=\"label label-danger\">not working</span></a>");
						%>	
					</div>
				</div>

			</div>

		</div>
		<!--end climate row-->



		<!-- LIGHTING SECTION - second row
				luci di cucina/salotto/bagno
		
		-->
		<div class="row well" id="lighting">
			<div class="col-md-4">
				<h3>Lighting</h3>
			</div>

			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">kitchen</div>
					<div class="col-md-2">
						<%
							if (remote_object.getLightState(0))
								out.print("<a href=\"setLight.jsp?state=off&room=0\"><span class=\"label label-success\">on</span></a>");
							else
								out.print("<a href=\"setLight.jsp?state=on&room=0\"><span class=\"label label-danger\">off</span></a>");
						%>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">living room</div>
					<div class="col-md-2">
						<%
							if (remote_object.getLightState(1))
								out.print("<a href=\"setLight.jsp?state=off&room=1\"><span class=\"label label-success\">on</span></a>");
							else
								out.print("<a href=\"setLight.jsp?state=on&room=1\"><span class=\"label label-danger\">off</span></a>");
						%>
					</div>

				</div>
				<div class="row">
					<div class="col-md-4">bathroom</div>
					<div class="col-md-2">
						<%
							if (remote_object.getLightState(2))
								out.print("<a href=\"setLight.jsp?state=off&room=2\"><span class=\"label label-success\">on</span></a>");
							else
								out.print("<a href=\"setLight.jsp?state=on&room=2\"><span class=\"label label-danger\">off</span></a>");
						%>
					</div>
				</div>
			</div>
		</div>
		<!--end lighting row-->


		<!-- IRRIGATION SECTION - third row
				- stato dell'irrigatore
				- durata dell'irrigazione
				- ora della prossima irrigazione
				- flag per attivare/disattivare prossima irrigazione
				
		-->
		<div class="row well" id="irrigation">
			<div class="col-md-4">
				<h3>Irrigation</h3>
			</div>

			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">irrigator</div>
					<div class="col-md-2">
						<%
							if (remote_object.getSprinklerState())
								out.print("<a href=\"setSprinkler.jsp?state=off\"><span class=\"label label-success\">on</span></a>");
							else
								out.print("<a href=\"setSprinkler.jsp?state=on\"><span class=\"label label-danger\">off</span></a>");
						%>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">duty time (minutes)</div>
					<div class="col-md-2">
						<form method="POST" action="setSprinklerDutyTime.jsp">
							<input type="number" 
								class="form-control number-input 
								<% if(!remote_object.getSprinklerState()) out.print("not-working"); %>"
								name="dutyTime"
								value="<%out.print(remote_object.getDutyTime());%>">
						</form>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-md-4">activation time</div>
					<%
						int hour = 0;
						int minute = 0;
						try{
							String tmp = remote_object.getActivationTime();
							StringTokenizer st = new StringTokenizer(tmp,":");
							hour = Integer.parseInt(st.nextToken());
							minute = Integer.parseInt(st.nextToken());
						} catch(Exception e) {
						}
					%>
					<div id="activation-time" class="col-md-4">
						<form method="POST" action="setSprinklerActivationTime.jsp">
							<input type="number" name="hour"
								class="form-control number-input
								<% if(!remote_object.getSprinklerState()) out.print("not-working"); %>" 
								value="<% out.print(hour); %>">
							: <input type="number" name="minute"
								class="form-control number-input
								<% if(!remote_object.getSprinklerState()) out.print("not-working"); %>"
								 value="<% out.print(minute); %>">
							<input type="submit" value="Go">
						</form>
					</div>
				</div>
				 
			</div>
		</div>
		<!--end irrigation row-->


		<!-- SHUTTERS SECTION - fourth row
				tapparelle di cuina/salotto/bagno
				
		-->
		<div class="row well" id="shutters">
			<div class="col-md-4">
				<h3>Shutters</h3>
			</div>

			<div class="col-md-6">
				<div class="row">
					<div class="col-md-4">kitchen</div>
					<div class="col-md-2">
						<%
							if (remote_object.getShutterState(0))
								out.print("<a href=\"setShutter.jsp?state=down&room=0\"><span class=\"label label-success\">up</span></a>");
							else
								out.print("<a href=\"setShutter.jsp?state=up&room=0\"><span class=\"label label-danger\">down</span></a>");
						%>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">living room</div>
					<div class="col-md-2">
						<%
							if (remote_object.getShutterState(1))
								out.print("<a href=\"setShutter.jsp?state=down&room=1\"><span class=\"label label-success\">up</span></a>");
							else
								out.print("<a href=\"setShutter.jsp?state=up&room=1\"><span class=\"label label-danger\">down</span></a>");
						%>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">bathroom</div>
					<div class="col-md-2">
						<%
							if (remote_object.getShutterState(2))
								out.print("<a href=\"setShutter.jsp?state=down&room=2\"><span class=\"label label-success\">up</span></a>");
							else
								out.print("<a href=\"setShutter.jsp?state=up&room=2\"><span class=\"label label-danger\">down</span></a>");
						%>
					</div>
				</div>
			</div>
		</div>
		<!--end shutters row-->




	</div>
	<!--end container-->


</body>
</html>
