/mob/living/human
	icon = 'human.dmi'
	icon_state = "human"
	mymob = "human"
	Login()
		meleeskill = rand(1, 2)
		craftskill = rand(1, 2)
		medskill = rand(0, 1)
		miningskill = rand(1, 2)
		strength = rand(5, 10)
		endurance = rand(5, 10)
		dexterity = rand(5, 10)
		stamina = stamina_max
		skill_check()
		name_pick()
		role_pick()
		L = new(src) // Left hand
		R = new(src) // Right hand
		C = new(src)
		D = new(src)
		E = new(src)
		M = new(src)
		P = new(src) // pocket
		ACT = new(src)
		process()
		hud_processor()
		loc = spawnLoc[rand(1,spawnLoc.len)]

/mob/living/verb/respawn()
	set name = "Respawn"
	set category = "OOC"
	if(client && isDead)
		var/mob/living/human = null
		human = new /mob/living/human(locate(/turf/menu))
		if(human)
			human.key = src.key
			human.name = human.key
			overlays = null
	else
		usr << "\red<B>Сначала ты должен умереть.</B>"
