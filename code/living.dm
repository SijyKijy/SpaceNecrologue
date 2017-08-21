/mob/living
	var/cantalk = 1
	var/dressed = 0
	var/haspocket = 0
	var/isDead = 0
	var/health = 100
	var/calories = 300
	var/stamina
	var/stamina_max = 100
	var/canhit = 1
	var/mymob = ""
	var/spawnlocation = ""
	layer = 5
	New()
		life()

/mob/living/Stat(var/mob/living/H = usr)
	..()
	if(statpanel("Status"))
		stat(null, "ST: [strength]")
		stat(null, "EN: [endurance]")
		stat(null, "DX: [dexterity]")
		stat(null, "Health: [health]")
		stat(null, "Calories: [calories]")
		stat(null, "Stamina: [stamina]")

/mob/living/verb/check()
	set name = "About Me"
	set category = "IC"
	usr << "<B>*---------*</B>"
	usr << "<B>СТАТЫ:</B>"
	usr << "<B><font color=purple>Сила - [strength]</B>"
	usr << "<B><font color=purple>Выносливость - [endurance]</B>"
	usr << "<B><font color=purple>Ловкость - [dexterity]</B>"
	usr << "<B>Про мен[ya]:</B>"
	if(meleeskill > 0)
		usr << "<B><font color=purple>Ближний бой - [meleeskill]</B>"
	if(miningskill > 0)
		usr << "<B><font color=purple>Горное дело - [miningskill]</B>"
	if(craftskill > 0)
		usr << "<B><font color=purple>Инженери[ya] - [craftskill]</B>"
	usr << "<B>*---------*</B>"

/mob/living/ghost
	isDead = 1
	density = 0
	movement = 1

/mob/living/verb/say(msg as text)
	set name = "Say"
	set category = "IC"
	if(cantalk)
		if(!msg)
			return
		else
			for(var/mob/M in view())
				msg = fix255(msg)
				M << "<B>[usr]</B> говорит, \"[msg]\""

/mob/verb/OOC(msg as text)
	set category = "OOC"
	msg = fix255(msg)
	if(ooc)
		if(!msg)
			return
		else
			world << "<B>\blue OOC: [key]: [msg]</B>"
	else
		usr << "<B>\red Недоступно.</B>"

proc/mob_controller()
	for(var/mob/living/M in world)
		if(M.stamina < M.stamina_max)
			M.stamina += M.stamina_regen
			if(M.stamina > M.stamina_max)
				M.stamina = M.stamina_max

/mob/living/proc/life()
	if(!isDead && health > 0 && calories != 0 && !isZombie)
		calories -= 1
		sleep(10)
	if(calories <= 0 && !isDead && !isZombie)
		HurtMe(0.5)
		stamina--
	if(health < 0)
		health = 0
	if(stamina < 0)
		stamina = 0
	spawn(10) life()