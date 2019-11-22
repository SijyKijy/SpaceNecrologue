/mob/living/proc/HurtMe(D)
	health = health - D
	if(D >= 10)
		if(prob(30))
			new/obj/cleanable/blood(src.loc)
	if(health <= 0)
		die()

/mob/living/proc/HealMe(D)
	health = health + D

/mob/living/proc/die(var/mob/living/human/H = src)
	killed++
	H.dropinventory()
	H.fall_down()
	H.density = 0
	H.isDead = 1
	if(H.client)
		var/mob/ghost = null
		ghost = new /mob/living/ghost(src.loc, 1)
		DelHUD(H)
		ghost.key = H.key
		alert(ghost,"Вот и помер дед [H.name]","You died!","Окей, нажму респаун!")
