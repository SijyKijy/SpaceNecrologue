/mob/living/verb/craft_furniture()
	set name = "Furniture"
	set category = "Craft"
	var/turf/T = src.loc
	var/obj/items/metal/M
	var/pick = input("��� ����� ���������?") in list("���", "�����", "�����", "�������", "����") as text|null
	if(pick && !isDead)
		switch(pick)
			if("���")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� ���!"
						new/turf/simulated/floor(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� ���������!"
						del M
			if("�����")
				for(M in T)
					if(prob(craftskill*30)+5)
						view() << "<B>[src.name]</B> ������� �����!"
						new/obj/machinery/doors/cage(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� ���������!"
						del M
			if("�����")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� ��������� ��[ya] �����!"
						new/obj/structures/girder(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� ���������!"
						del M
			if("�������")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� �������!"
						new/obj/structures/grille(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� ���������!"
						del M
			if("����")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� ����!"
						new/obj/structures/table(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� ���������!"
						del M

/mob/living/verb/craft_tools()
	set name = "Tools"
	set category = "Craft"
	var/turf/T = src.loc
	var/obj/items/metal/M
	var/pick = input("�������������") in list ("��������", "���") as text|null
	if(pick && !isDead)
		switch(pick)
			if("��������")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� ��������!"
						new/obj/items/weapon/screwdriver(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� �������!"
						del M
			if("���")
				for(M in T)
					if(prob(craftskill*30))
						view() << "<B>[src.name]</B> ������� �������!"
						new/obj/items/weapon/crowbar(T)
						del M
					else
						view() << "<B>[src.name]</B> - ���������, ������� ������ �� ���� �������!"
						del M


