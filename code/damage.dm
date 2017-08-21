/mob/living/proc/HurtMe(D)
	health = health - D
	if(D >= 10)
		if(prob(30))
			new/obj/cleanable/blood(src.loc)
	if(health <= 0)
		die()
		killed++

/mob/living/proc/HealMe(D)
	health = health + D

/mob/living/proc/die(var/mob/living/human/H = src)
	H.dropinventory()
	var/matrix/Ma = matrix()
	if(H.client)
		var/mob/ghost = null
		ghost = new /mob/living/ghost(src.loc, 1)
		if(ghost)
			del(R)
			del(L)
			del(D)
			del(C)
			del(ACT)
			del(E)
			del(M)
			del(P)
			ghost.ckey = H.ckey
			Ma.Turn(pick(90, -90))
			transform = Ma
			H.overlays = null
			H.isDead = 1
			H.density = 0
	else
		Ma.Turn(pick(90, -90))
		transform = Ma
		H.isDead = 1
		H.density = 0