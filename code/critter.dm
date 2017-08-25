/mob/living
	var/isAnimal = 0
	var/friendly = 0
	var/isUndead = 0

/mob/living/zombie
	name = "Unknown"
	icon = 'critter.dmi'
	icon_state = "zombie"
	isUndead = 1
	rundelay = 5
	New()
		zombies++
		strength = rand(5, 10)
		endurance = rand(5, 10)
		dexterity = rand(5, 10)
		meleeskill = rand(1, 2)
		if(prob(1))
			rundelay = 2
		if(prob(10))
			icon_state = "zombie_blacksuit"
		stamina = stamina_max
		skill_check()
		.=..()
		spawn(1)
			zombieAI()

/mob/living/proc/zhit(var/mob/living/zombie)
	if(!src.isDead && zombie.canhit && zombie.stamina >= 5)
		if(prob(src.dexterity*4))
			view() << "\red \bold [zombie.name] ��������[ya] ������� [src.name] ����[ya]��!"
			view() << "\red \bold [src.name] ������� �����!"
			view() << miss
		else
			view() << "\red \bold [zombie.name] ���� ����� [src.name] ������ ����[ya]��!"
			view() << zombiehit
			src.HurtMe(max(zombie.strength*1.3, 0))
		zombie.stamina = max(zombie.stamina - 10, 0)
		zombie.canhit = FALSE
		spawn(7)
			zombie.canhit = TRUE

/mob/living/skeleton
	name = "Skeleton"
	icon = 'critter.dmi'
	icon_state = "skeleton"
	isUndead = 1
	New()
		strength = rand(5, 10)
		endurance = rand(5, 10)
		dexterity = rand(5, 10)
		meleeskill = rand(1, 2)
		stamina = stamina_max
		skill_check()
		.=..()
		spawn(1)
			hostileAI()