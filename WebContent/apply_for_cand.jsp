<%@page import="jsp.*,java.util.*"%>
<%@ include file="noCache.jsp"%>
<!--
AUTHOR                   : LNMIIT_ONLINE_VOTING_SYSTEM_TEAM
LAST MODIFIED DATE       : 17-APRIL-2015
-->

<!DOCTYPE HTML>
<html>
<head>
<title>Apply for Candidature- LNMIIT_ONLINE_VOTING_PORTAL</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script type="text/javascript" src="../1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="../1.8.11/jquery-ui.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- <script src="js/jquery.min.js"></script>-->
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/jquery.scrollgress.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>

<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-wide.css" />
<link rel="stylesheet" href="css/style-noscript.css" />
<link
	href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">


<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
<style type="text/css">
#nav ul li {
	color: black;
}

.contact {
	background-color: #000;
	background: url("../images/LNMIIT-contact.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: 75em, 60em, auto, cover;
}
</style>
<script type="text/javascript">
	function checkForm(form) {
		// regular expression to match required date format
		re = /^\d{1,2}\/\d{1,2}\/\d{4}$/;

		if (form.date.value != '' && !form.date.value.match(re)) {
			alert("Invalid date format: " + form.date.value);
			form.date.focus();
			return false;
		}

		// regular expression to match required time format
		re = /^\d{1,2}:\d{1,2}:\d{1,2}$/;
		if (form.starttime.value != '' && !form.starttime.value.match(re)) {
			alert("Invalid time format: " + form.starttime.value);
			form.starttime.focus();
			return false;
		}

		alert("All input fields have been validated!");
		return true;
		
		//check for CGPA
		double val = document.getElementById("cgpa");
		if(val>10 || val<0)
			{
				alert("Invalid Input");
			}
	}
</script>
<script>
	$(function() {
		$('#datepicker').datepicker(
				{
					onSelect : function(dateText, inst) {
						//Get today's date at midnight
						var today = new Date();
						today = Date.parse(today.getMonth() + 1 + '/'
								+ today.getDate() + '/' + today.getFullYear());
						//Get the selected date (also at midnight)
						var selDate = Date.parse(dateText);

						if (selDate < today) {
							//If the selected date was before today, continue to show the datepicker
							$('#datepicker').val('');
							$(inst).datepicker('show');
						}
					}
				});
	});
</script>

</head>
<body class="contact">
	<%
		session.setAttribute("fname", "apply_for_cand");
	String sessionID = null;
	int loginindex = 0;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cooki : cookies) {
			if (cooki.getName().equals("JSESSIONID")) {
				sessionID = cooki.getValue();
				System.out.println("JSESSIONID=" + sessionID);
				break;
			}

		}
		for (Cookie cooki : cookies) {
			if (cooki.getName().equals("loginindex")) {
				loginindex = Integer.parseInt(cooki.getValue());
				System.out.println("loginindex=" + loginindex);
				break;
			}

		}
	}

	if (!Session.isSameSession(sessionID, loginindex)) {
		response.sendRedirect("index.jsp");
		System.out.println("different session");

	}

	
	%>

	<!-- Header -->
	<header id="header" class="alt">
		<h1 id="logo">
			<a href="http://www.lnmiit.ac.in"><img
				src="images/LNMIIT_logo.png" width="200px" height="100px"></a>
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="index.jsp">Welcome</a></li>
				<li><a href="">Election Rules</a></li>
				<li><a href="">Help Page</a></li>
				<li><a href="contact.jsp">Contact Us</a></li>
				<li><a href="logout.jsp" class="button special">LOGOUT</a></li>
			</ul>
		</nav>
	</header>

	<!-- Main -->
	<article id="main">

		<header class="container">
			<!-- <span class="icon fa-envelope"></span>-->
			<h2 align="center">APPLY FOR CANDIDATURE</h2>
			<p></p>
		</header>

		<!-- One -->
		<section class="wrapper style4 special container 75%">

			<!-- Content -->
			<div class="content">
				<form action="C_ceo.jsp" method="post">
					<div class="row 50%">
						<!--class= 6u 12u(mobile) -->
						<div class="12u">
							<input type="text" name="Name" placeholder="NAME" />
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							<input type="text"  name="Roll_no" value="Roll No."
								placeholder="Roll No." />
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							Gender:
							<select name="Gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							<input type="email" name="email"
								placeholder="Email : format --> abc@xyz.com" />
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							<input type="text" id="cgpa" name="cgpa" placeholder="CGPA"/>
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							<input type="text" name="phone_no" placeholder="Phone No"/>
						</div>
					</div>
					<div class="row 50%">
						<div class="12u">
							Position Applying For: 
							<select name="position">
								<option value="president">President</option>
								<option value="vice-president">Vice-President</option>
								<option value="GSS">G.Sec. Sports</option>
								<option value="GSC">G.Sec. Cultural</option>
								<option value="GSST">G.Sec. Science and Tech.</option>
								<option value="UG_Senate_Fourth_Year">Senate Fourth Year UG</option>
								<option value="UG_Senate_Third_Year">Senate Third Year UG</option>
								<option value="UG_Senate_Second_Year">Senate Second Year UG</option>
								<option value="UG_Senate_First_Year">Senate First Year UG</option>
								<option value="PG">Post Graduate</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<ul class="buttons">
								<li><input type="submit" class="special" value="Apply" /></li>
							</ul>
						</div>
					</div>
				</form>
			</div>

		</section>

	</article>

	<!-- Footer -->
	<footer id="footer">

		<ul class="icons">
			<li><a href="#" class="icon circle fa-twitter"><span
					class="label">Twitter</span></a></li>
			<li><a href="#" class="icon circle fa-facebook"><span
					class="label">Facebook</span></a></li>
			<li><a href="#" class="icon circle fa-google-plus"><span
					class="label">Google+</span></a></li>
			<li><a href="#" class="icon circle fa-github"><span
					class="label">Github</span></a></li>
			<li><a href="#" class="icon circle fa-dribbble"><span
					class="label">Dribbble</span></a></li>
		</ul>

		<ul class="copyright">
			<li>&copy; SEPM-GROUP 26</li>
		</ul>

	</footer>

</body>
</html>
