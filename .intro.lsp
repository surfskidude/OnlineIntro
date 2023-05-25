<?lsp 

local d=request:domain()

if d == "embedded-app-server.info" then
   response:sendredirect("https://tutorial.realtimelogic.com", true)
end

if d ~= "tutorial.realtimelogic.com" and d~="localhost" then
   response:sendredirect("https://tutorial.realtimelogic.com", true)
end

title="Online Lua Tutorials" response:include"/.header.lsp"

local now = os.date("*t",os.time())
local left = 60 - now.min
now = string.format("%02d:%02d",now.hour, now.min)
local url=request:data'url'
?>
<link rel="stylesheet" href="/assets/css/intro-style.css" />


<h2>Online Lua and LSP Tutorials</h2>

<div class="alert <?lsp= left< 4 and 'alert-danger' or (left < 8 and 'alert-warning' or 'alert-success')?>" style="font-size:125%;font-weight:bold">
<p>Local server time: <?lsp=now?>.</p>
<p>The App Server will reboot <?lsp=left < 2 and "soon" or string.format("in %d minutes",left)?>.</p>
</div>

<h2>Why we restart the tutorials every hour:</h2>

<p>To ensure that our tutorials run smoothly and prevent abuse, we restart them every hour. This allows us to provide a safe and enjoyable learning environment for everyone.</p>

<p>While these tutorials give you the ability to write server-side code, run executables, and perform other tasks that might normally be restricted on a public server, we ask that you be respectful and avoid writing code that could potentially block the server or crash it. This helps to maintain the integrity of the tutorials and make them accessible to all users.</p>

<p>If you prefer, you can also download and run the tutorials on your own computer. Check out the <a href="https://makoserver.net/documentation/manual/">Mako Server getting started guide</a> for more information. Thank you for your cooperation and understanding.</p>

<div style="max-width:640px;margin:auto">
<object class="background-white" style="width:100%;padding: 10px;border-radius:10px;" id="LuaREPL" type="image/svg+xml" data="images/LuaREPL.svg"></object>
</div>

<p>It's important to note that the browser is only used as an editor and to display the results of your code. The actual processing takes place on the server side. When you click the 'Run' button, the Lua code example displayed in the browser is sent to the server to be parsed and executed. The server will then send the response back to the browser for display.</p>

<?lsp if url then ?>
<input type="button" value="Continue" onclick="history.back(-1)" />

<?lsp else ?>
<h1>Next:</h1>

<p>Continue by reading <a href="Introduction.lsp">Introduction to LSP</a>.</p>

<p>If you just want the Lua tutorials, start by running the <a href="Lua-Types.lsp">Lua types tutorial</a>. Note that you may edit and run any script by using the inline editor.</p>
<?lsp end ?>


<script src="LuaREPL.js"></script>

<?lsp response:include"/footer.shtml" ?>
