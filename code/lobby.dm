/turf/menu
	icon_state = "plating"
	luminosity = 10

/mob/living/proc/name_pick()
	var/f_name = pick("Ivan", "Urist", "Randy", "Daniel", "Oscar", "Ottar", "Colton", "Dagon", "Michael", "Jew", "Darius", "Luther", "John", "Junkie", "Hooman", "Yurka", "Heh")
	var/l_name = pick("Rambold", "McDwarf", "Ratfucker", "Deadwood", "Shepard", "Smith", "Hitler", "Cobb", "Robustovich", "Shulgin", "Shaleez", "Rana", "Krasnogribov", "Stalin", "Huang")
	var/pick = input("Your name was generated") in list("Ok") as text|null
	if(pick)
		switch(pick)
			if("Ok")
				src.name = "[f_name] [l_name]"

/mob/default/Login()
	loc = locate(/turf/menu)

/mob/default/verb/Join_Game()
	set name = "Join Game"
	set category = "Lobby"
	join_game()

/mob/default/proc/join_game()
	var/mob/living/human/char = null
	char = new /mob/living/human
	if(char)
		char.key = src.key
		del(src)

/mob/living/human/proc/role_pick()
	var/pick = input("������ ���� �������") in list("�����������", "�������", "��������������") as text|null
	if(pick)
		switch(pick)
			if("�����������")
				usr << "<B>� �� ������������[ya] ������ �� �������� ���[ya]��� � ������, ��� ���� ���� �����. �� ������ ������ ���������[ya] � �������.</B>"
				dexterity++
				endurance++
				meleeskill++
			if("�������")
				usr << "<B>� �� ������������ �� ������� � �����������. �� ������� �����������[ya] � ���������, � ���� ������� ��� ��� ������� �����������.</B>"
				strength++
				craftskill++
			if("��������������")
				usr << "<B>� � ����� �������� ��������.</B>"
				dexterity++
				medskill++