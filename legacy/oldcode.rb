<content:page>

<head>
	<link rel="stylesheet" type="text/css" href="../_static/site.css"/>
	<?r
	require_relative "../lib/notice.rb"
	notices = NoticeController.new(Time.new, File.expand_path("../db", __dir__))
	content = notices.retrieve_notices
	date = notices.date
	display_none = false
	if content == []
		display_none = true
	end
	?>
	<?r if request.session[:failed] == true ?>
		<script> alert("Login Failed. #{request.session[:failed]} #{request.session[:debug]}") </script>
		<?r request.session[:failed] = false ?>
	<?r end ?>

</head>

<div class="mocha">
	<header>
	<div>
		<h1 style="height: 50px; text-align: center;font-size: 70px;float: left;padding-left: 30px; "> CBHS<br/>Notices </h1>
	</div>
	</header>
	<?r
	require_relative "../lib/date"
	?>
	<p class="date"> #{date_conv(date)} </p>

<?r if display_none == false ?>
	<?r content.each do |notice| ?>
		<div class="notice_title">
			<h2 class="name"> #{notice["name"]} </h2>
			<h4 class="teachercode"> [#{notice["tsub"]}] </h4>
		</div>
		<p> #{notice["content"]} </p>
	<?r end ?>
<?r
else
	nn = true
?>
<?r end ?>
	<nav>
		<div class="container">
			<a href="http://intranet.cbhs.school.nz/start/"> CBHS Intranet </a>
			<a href="login"> Teacher Portal </a>
		</div>
	</nav>
	<?r if nn == true ?>
		<h3 class="cent"> No notices to display for #{date_conv(date)}. </h3>
	<?r end ?>
</div>
</content:page>
