<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>My Neu Portal</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,700italic,400italic'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/style_index.css">


</head>

<body>

	<div class="container">
		<h1>My Neu Portal</h1>
		<a id="modal_trigger" href="#modal" class="btn">Click here to
			Login or register</a>

		<div id="modal" class="popupContainer" style="display: none;">
			<header class="popupHeader">
				<span class="header_title">Login</span> <span class="modal_close"><i
					class="fa fa-times"></i></span>
			</header>

			<section class="popupBody">
				<!-- Social Login -->
				<div class="social_login">
					<div class="">
						<a href="#" class="social_box fb"> <span class="icon"><i
								class="fa fa-facebook"></i></span> <span class="icon_title">Connect
								with Facebook</span>

						</a> <a href="#" class="social_box google"> <span class="icon"><i
								class="fa fa-google-plus"></i></span> <span class="icon_title">Connect
								with Google</span>
						</a>
					</div>

					<div class="centeredText">
						<span>Or use your Email address</span>
					</div>

					<div class="action_btns">
						<div class="one_half">
							<a href="#" id="login_form" class="btn">Login</a>
						</div>
						<div class="one_half last">
							<a href="#" id="register_form" class="btn">Sign up</a>
						</div>
					</div>
				</div>

				<!-- Username & Password Login form -->
				<div class="user_login">
					<form method="POST" action="user/home.htm">
						<label>Email / Username</label> <input type="email"
							name="login_username" /> <br /> <label>Password</label> <input
							type="password" name="login_password" /> <br />

						<div class="checkbox">
							<input id="remember" type="checkbox" name="login_remember" /> <label
								for="remember">Remember me on this computer</label>
						</div>

						<div class="action_btns">
							<div class="one_half">
								<a href="#" class="btn back_btn"><i
									class="fa fa-angle-double-left"></i> Back</a>
							</div>
							<div class="one_half last">
								<input type="submit" value="Login" class="submit btn_red"
									name="login_submit" />
							</div>
						</div>
					</form>

					<a href="#" class="forgot_password">Forgot password?</a>
				</div>

				<!-- Register Form -->
				<div class="user_register">
					<form method="POST" action="user/register.htm">
						<label>Full Name</label> <input type="text" name="userfullname" />
						<br /> <label>Email Address</label> <input type="email"
							name="useremail" /> <br /> <label>Password</label> <input
							type="password" name="userpassword" /> <br />

						<div class="checkbox">
							<input id="send_updates" type="checkbox" /> <label
								for="send_updates">Send me occasional email updates</label>
						</div>

						<div class="action_btns">
							<div class="one_half">
								<a href="#" class="btn back_btn"><i
									class="fa fa-angle-double-left"></i> Back</a>
							</div>
							<div class="one_half last">
								<input type="submit" value="Register" class="submit btn_red" />
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
	
	
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='https://andwecode.com/wp-content/uploads/2015/10/jquery.leanModal.min_.js'></script>

	<script src="js/index.js"></script>


</body>

</html>
