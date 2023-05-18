<?lsp 

title="Run LSP Example" response:include".header.lsp"

local src=request:data"src"
local exio=app.exio
if not src or not exio then response:sendredirect"/" end

local fn="ex"..tostring(ba.rnd())
local fp=exio:open(fn..".lsp","w")
if not fp then response:sendredirect"/" end
fp:write(src)
fp:close()

?>

<div class="lspeditor" id="edit" example="<?lsp=fn?>"></div>


<script>
$(function() {
    $("#edit").find("button:nth-child(3)").remove();
});
</script>

<?lsp response:include"footer.shtml" ?>
