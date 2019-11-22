/mob/verb/adminverbs_c() // Получение админки
	set category = "OOC"
	set name = "Candy"
	if(usr.key == "SijyKijy")
		GM_check()
	else
		src << "Лизь."

/mob/proc/GM_check()
	usr << "<B>= Activation =</B>"
	usr.verbs+=new/mob/admin/verb/hardRestart
	usr.verbs+=new/mob/admin/verb/restart
	usr.verbs+=new/mob/admin/verb/announce
	usr.verbs+=new/mob/admin/verb/disableOOC

mob/admin/verb/hardRestart()
	set category = "Admin"
	set name = "Hard restart"
	world<<"<b><font color = red>FAST-REBOOT!"
	world.Reboot()

mob/admin/verb/restart()
	set category = "Admin"
	set name = "Restart world"
	Restart()

mob/admin/verb/disableOOC()
	set category = "Admin"
	set name = "Disable OOC"
	if(ooc)
		world << "<B>OOC вырубили!</B>"
		ooc = 0
	else
		world << "<B>OOC врубили!</B>"
		ooc = 1

mob/admin/verb/announce(message as message)
	set category = "Admin"
	set name = "Announce"
	if(message)
		for(var/client/C)
			C.mob << "<center><br><b><font color=red>[message] - [ckey]</font></center>"
	else
		usr << "<B>Буп.</B>"

var/reboottime = 0
proc/Restart()
	if(!reboottime)
		reboottime = 1
		world << "<b><font color = red>FUCK WHAT IS GOING ON."
			world.End()
