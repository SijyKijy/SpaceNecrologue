/obj/structures/bush
	name = "bush"
	icon_state = "bush1"
	density = 0
	New()
		icon_state = "bush[pick("1","2")]"
		dir = dir8()

/obj/structures/bush/berries
	name = "berry bush"
	icon_state = "berrybush"
	density = 0
	var/full = 1
	attack_hand(var/mob/living/H)
		if(H in range(1, src))
			if(!H.acthand && full)
				view() << "\blue \bold [H.name] ������� [ya]����!"
				new/obj/items/food/berries(H.loc)
				full = 0
	New()
		check()

/obj/structures/bush/berries/proc/check()
	if(full)
		icon_state = "berrybush"
	else
		icon_state = "berrybush_empty"
		sleep(600)
		full = 1
	spawn(0.1) check()

/obj/structures/tree
	name = "tree"
	icon = 'trees.dmi'
	icon_state = "tree"
	layer = 12