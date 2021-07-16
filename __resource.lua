resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

description "vRP basic needs"
--ui_page "ui/index.html"

dependency "vrp"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "vrp.lua"
}

client_script {
	'client.lua'
 }

ui_page('html/index.html')
files({
	"html/script.js",
	"html/jquery.min.js",
	"html/jquery-ui.min.js",
	"html/styles.css",
	"html/img/*.svg",
	"html/index.html",
})
