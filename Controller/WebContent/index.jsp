<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domus.client.Client"%>
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

<link href="template.css" rel="stylesheet">


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<jsp:useBean id="remote_object" scope="session" class="domus.client.Client" />

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
          <div class="col-md-4"><h3>Climate</h3></div>

          <!-- temperature column -->
          <div class="col-md-4"><h4>Temperature</h4>

            <div class="row">
              <div class="col-md-4">kitchen</div>
              <div class="col-md-2"><% out.print(remote_object.getLightState()); %> </div>
            </div>
            <div class="row">
              <div class="col-md-4">living room</div>
              <div class="col-md-2"><% out.print(remote_object.test()); %></div>
            </div>
            <div class="row">
              <div class="col-md-4">bathroom</div>
              <div class="col-md-2"><% out.print(remote_object.test()); %></div>
            </div>

          </div>

          <!-- thermostat column -->
          <div class="col-md-4"><h4>Thermostat</h4>

            <div class="row">
              <div class="col-md-4">setted temperature</div>
              <div class="col-md-2">
              	<form method="POST" action="setThermostatTemperature.jsp" >
              		<input type="text"
              			name="settedTemperature" 
              			class="form-control number-input" 
              			placeholder="<% out.print(remote_object.getSettedTemperature()); %>">
              	</form>
              </div>
              <!--<div class="col-md-2">23</div>-->
            </div>
            <div class="row">
              <div class="col-md-4">state</div>
              <div class="col-md-2"><span class="label label-success">working</span></div>
            </div>

          </div>

        </div> <!--end climate row-->
        
        
		<%-- 		<%@ include file="./template/climate.jsp" %> --%>
		<%-- 		<%@ include file="./template/lighting.jsp" %> --%>
		<%-- 		<%@ include file="./template/irrigation.jsp" %> --%>
		<%-- 		<%@ include file="./template/shutters.jsp" %> --%>

	</div>
	<!--end container-->


</body>
</html>
