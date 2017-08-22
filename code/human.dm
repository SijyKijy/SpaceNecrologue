/mob/living/human
	icon = 'human.dmi'
	icon_state = "human"
	mymob = "human"
	Login()
		meleeskill = rand(1, 3)
		craftskill = rand(1, 3)
		miningskill = rand(1, 3)
		strength = rand(5, 10)
		endurance = rand(5, 10)
		dexterity = rand(5, 10)
		stamina = stamina_max
		skill_check()
		L = new(src)
		R = new(src)
		C = new(src)
		D = new(src)
		E = new(src)
		M = new(src)
		P = new(src)
		ACT = new(src)
		process()
		hud_processor()
		x = pick(5,15,25)
		y = 4
		z = 1

/mob/living/verb/respawn()
	set name = "Respawn"
	set category = "OOC"
	if(client && isDead)
		var/mob/living/human = null
		human = new /mob/living/human(src.loc, 1)
		if(human)
			human.key = src.key
			human.name = human.key
			overlays = null
	else
		usr << "\red<B>Сначала ты должен умереть.</B>"