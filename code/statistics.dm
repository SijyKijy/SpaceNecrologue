var/global/cleaned = 0
var/global/zombies = 0
var/global/killed = 0
var/global/lightsources

world/proc/End()
	autoreboot = 1
	world << "<b><font size=3>� ����� ��[ya].</font></B>"
	sleep(20)
	world << "<B><font size=2>��������� ����������[ya]:</font></B>"
	world << "<B>��[ya]���� ������:</B> [cleaned]"
	world << "<B>�����:</B> [killed]"
	world << "<b><font color = red>������� ����� 30 ������."
	sleep(300)
	if(autoreboot)
		world.Reboot()

proc/countLight()
	for(var/obj/machinery/light/L in world)
		lightsources++
