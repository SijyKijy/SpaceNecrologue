/obj/items/food/proc/consume(var/mob/living/H = usr)
	if(units > 0)
		if(H.calories < 500)
			view() << "\red \bold [H.name] ������ [src.name]!"
			view() << eat
			units--
			if(nutriments)
				H.calories += nutriments
		else
			usr << "\bold \red �� ����� ������ ������..."
	else
		usr << "\bold � [src.name] ������ ���."