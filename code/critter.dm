/mob/living
	var/isAnimal = 0
	var/friendly = 0
	var/isZombie = 0

/mob/living/zombie
	name = "Unknown"
	icon = 'critter.dmi'
	icon_state = "zombie"
	mymob = "zombie"
	isZombie = 1
	rundelay = 5
	New()
		zombies++
		strength = rand(5, 10)
		endurance = rand(5, 10)
		dexterity = rand(5, 10)
		meleeskill = rand(1, 2)
		if(prob(1))
			rundelay = 2
		stamina = stamina_max
		skill_check()
		.=..()
		spawn(1)
			hostileAI()

