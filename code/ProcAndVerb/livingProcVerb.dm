/mob/living
	var/cantalk = 1
	var/rests = 0
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
		stat(null, "Daytime: [daytime]")

/mob/living/verb/check()
	set name = "About Me"
	set category = "IC"
	usr << "<B>*---------*</B>"
	usr << "<B>�����:</B>"
	usr << "<B><font color=purple>���� - [strength]</B>"
	usr << "<B><font color=purple>������������ - [endurance]</B>"
	usr << "<B><font color=purple>�������� - [dexterity]</B>"
	usr << "<B>��� ���[ya]:</B>"
	if(meleeskill > 0)
		usr << "<B><font color=purple>������� ��� - [meleeskill]</B>"
	if(miningskill > 0)
		usr << "<B><font color=purple>������ ���� - [miningskill]</B>"
	if(medskill > 0)
		usr << "\bold <font color=purple>�������� - [medskill]"
	if(craftskill > 0)
		usr << "<B><font color=purple>��������[ya] - [craftskill]</B>"
	usr << "<B>*---------*</B>"

/mob/living/ghost
	isDead = 1
	density = 0
	move = 0

proc/mob_controller()
	for(var/mob/living/M in world)
		if(M.stamina < M.stamina_max)
			M.stamina += M.stamina_regen
			if(M.stamina > M.stamina_max)
				M.stamina = M.stamina_max
		if(M.health < 100 && M.calories > 250)
			M.health += 0.1
		if(M.health > 100)
			M.health = 100

/mob/living/proc/life()
	if(!isDead && health > 0 && calories != 0 && !isUndead)
		calories -= 1
		sleep(10)
	if(calories <= 0 && !isDead && !isUndead)
		HurtMe(0.2)
		stamina--
		if(prob(15))
			usr << "\red *� ����� �������...*"
	if(health < 0)
		health = 0
	if(stamina < 0)
		stamina = 0
	if(!dressed && !isUndead)
		try_to_cold()
	spawn(10) life()

/mob/living/var/canrest = 1

/mob/living/verb/rest()
	set name = "Rest"
	set category = "IC"
	if(!isDead && canrest)
		if(!rests)
			fall_down()
			canrest = 0
			spawn(10)
				canrest = 1
		else
			view() << "\blue<B>[src.name]</B> ����������[ya] �� ����!"
			canrest = 0
			sleep(10)
			var/matrix/Ma = matrix()
			Ma.Turn(360)
			transform = Ma
			rests = 0
			rundelay -= 3
			spawn(10)
				canrest = 1

/mob/living/proc/fall_down()
	var/matrix/Ma = matrix()
	Ma.Turn(90)
	transform = Ma
	view() << "<B>[src.name]</B> ������ �� �����!"
	rests = 1
	rundelay += 3

/mob/living/proc/DelHUD(var/mob/living/human/H)
	H.overlays = null
	del(R)
	del(L)
	del(D)
	del(C)
	del(ACT)
	del(E)
	del(M)
	del(P)
