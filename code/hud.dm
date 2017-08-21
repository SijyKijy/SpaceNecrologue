/mob/living
	var/obj/hud/lhand/L = null
	var/obj/hud/rhand/R	= null
	var/obj/items/my_rhand_contents = null
	var/obj/items/my_lhand_contents = null
	var/obj/items/my_clothes_contents = null
	var/obj/items/my_pocket_contents = null
	var/obj/hud/drop/D
	var/obj/hud/movement/M
	var/obj/hud/clothes/C
	var/obj/hud/consume/E
	var/obj/hud/intent/ACT
	var/obj/hud/pocket/P
	var/hand = RHAND
	var/acthand
	var/movement = 0
	var/act = "help"

/obj/hud
	layer = MOB_LAYER + 50
	icon = 'hud.dmi'
	var/time_to_swap = 0
	var/time_to_drop = 0
	var/time_to_wearc = 0
	var/time_to_intent = 0
	var/active = 0

/obj/hud/drop
	name = "drop"
	icon_state = "drop"
	New()
		screen_loc = "10,1"
		usr.client.screen += src
	Click(var/mob/living/H = usr)
		time_to_drop = 1
		H.drop()

/obj/hud/movement
	icon_state = "movement_walk"
	New()
		screen_loc = "5,1"
		usr.client.screen += src
	Click(var/mob/living/H = usr)
		if(!H.movement)
			H.movement = 1
			icon_state = "movement_run"
		else
			H.movement = 0
			icon_state = "movement_walk"

/obj/hud/consume
	name = "consume"
	icon_state = "consume"
	New()
		screen_loc = "12,1"
		usr.client.screen += src
	Click(var/mob/living/H = usr)
		if(H.acthand)
			var/obj/items/food/F = H.acthand
			if(istype(F))
				F.consume()

/obj/hud/pocket
	name = "pocket"
	icon_state = "pocket"
	New()
		screen_loc = "6,1"
		usr.client.screen += src
	Click(var/mob/living/H = usr)
		if(H.dressed)
			if(!H.haspocket)
				H.epocket()
			else
				H.upocket()

/obj/hud/clothes
	name = "clothes"
	icon_state = "clothes"
	New()
		screen_loc = "7,1"
		usr.client.screen += src
	Click(var/mob/living/H = usr)
		if(!H.dressed)
			time_to_wearc = 1
			H.eclothes()
		else
			H.cunequip()

/obj/hud/intent
	name = "intent"
	icon_state = "intent_help"
	New()
		screen_loc="11,1"
		usr.client.screen += src
	Click()
		time_to_intent = 1

/obj/hud/rhand
	name = "right hand"
	icon_state = "hand"
	active = 1
	New()
		screen_loc = "8,1"
		usr.client.screen += src
	Click()
		time_to_swap = 1

/obj/hud/lhand
	name = "left hand"
	icon_state = "hand"
	active = 1
	New()
		screen_loc = "9,1"
		usr.client.screen += src
	Click()
		time_to_swap = 1

/obj/hud/proc/check_act_hand()
	if(active)
		icon_state = "act_hand"
	else
		icon_state = "hand"

/mob/living/proc/hud_processor()
	spawn while(1)
		if(!isDead)
			sleep(0.001)
			L.check_act_hand()
			R.check_act_hand()
			if(hand == RHAND)
				R.active = 1
				acthand = my_rhand_contents
				L.active = 0
			else
				R.active = 0
				acthand = my_lhand_contents
				L.active = 1
			if(R.time_to_swap == 1 || L.time_to_swap == 1)
				R.time_to_swap = 0
				L.time_to_swap = 0
				swap_hands()
			if(ACT.time_to_intent == 1)
				ACT.time_to_intent = 0
				intent()

/mob/living/proc/cut_hands()
	if(R.active)
		R.overlays -= my_rhand_contents
		my_rhand_contents = null
	else
		L.overlays -= my_lhand_contents
		my_lhand_contents = null

/mob/living/proc/swap_hands()
	if(hand == RHAND)
		R.active = 0
		L.active = 1
		hand = LHAND
		return

	else if(hand == LHAND)
		R.active = 1
		L.active = 0
		hand = RHAND
		return

/mob/living/proc/intent()
	if(act == "help")
		act = "harm"
		ACT.icon_state = "intent_harm"
		return
	if(act == "harm")
		act = "help"
		ACT.icon_state = "intent_help"
		return