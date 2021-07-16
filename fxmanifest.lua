fx_version "adamant"
games {"gta5"}

description "vRP basic needs"
--ui_page "ui/index.html"

dependency "vrp"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "vrp.lua"
}

client_script {
  "@vrp/lib/utils.lua",
  "client.lua"
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
