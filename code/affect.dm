/obj/items/food/proc/consume(var/mob/living/H = usr)
	if(units > 0)
		if(H.calories < 500)
			view() << "\red \bold [H.name] кушает [src.name]!"
			view() << eat
			units--
			if(nutriments)
				H.calories += nutriments
		else
			usr << "\bold \red Не смогу больше съесть..."
	else
		usr << "\bold В [src.name] ничего нет."