<?lsp
local now = os.date("*t",os.time())
local left = 60 - now.min
now = string.format("%02d:%02d",now.hour, now.min)
?>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="intro-style.css" />
<link rel="stylesheet" href="online-style.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<title>Barracuda Application Server Tutorials</title>
<script src="/rtl/jquery.js"></script>
<script>
   $(function() {
       $("#gotit").attr("action",location);
   });
</script>
</head>
<body>


<div id="mainContainer">
  <div id="header">
    <img src="images/BAS-logo.png" />
    <div id="headertxt">BAS Tutorials</div>
  </div>
  <div id="leftSidebar">
  </div>
  <div id="mainContent">
    <div class="innertube">
        <h2>Online Lua and LSP Tutorials</h2>
  <?lsp if request:method() == "POST" then?>
  <div class="alert alert-danger"><p>You must have cookies enabled!</p></div>
  <?lsp else ?>
  <p>Welcome to the Mako Server and Barracuda App Server tutorials running on an online Virtual Private Server! In this environment, the browser acts as an editor and is used to display the results of your code. The actual processing, however, takes place on the server side. Please keep in mind that all tutorials are reset and re-installed every hour to maintain the integrity and performance of the system.</p>
<p>We hope you find these tutorials helpful and informative as you learn about these powerful tools for developing applications. If you have any questions or need assistance along the way, don't hesitate to reach out for help.</p>
<p>Happy learning!</p>

<div style="max-width:640px;margin:auto">
<object style="width:100%" id="LuaREPL" type="image/svg+xml" data="images/LuaREPL.svg"></object>
</div>
  <?lsp end ?>
  <form id="gotit" method="POST" action="<?lsp=request:url()?>">
     <button type="submit" style="font-weight:bold;color:white"><span style="font-size:140%">OK, got it!</span></button>
  </form>
  <p><br><a href="/?url=<?lsp=request:uri()?>">No, I need more information!</a></p>

<div class="alert <?lsp= left< 4 and 'alert-danger' or (left < 6 and 'alert-warning' or 'alert-success')?>" style="font-size:120%;font-weight:bold">
<p>Local server time: <?lsp=now?>.</p>
<p>The App Server will reboot <?lsp=left < 2 and "soon" or string.format("in %d minutes",left)?>.</p>
</div>


</div>
</div>
</div>
<script src="LuaREPL.js"></script>
</body>
</html>
