local u = require("utils")

u.nmap("<M-n>", '<cmd> lua require"illuminate".next_reference{wrap=true}<CR>')
u.nmap("<M-p>", '<cmd> lua require"illuminate".next_reference{reverse=true,wrap=true}<CR>')
