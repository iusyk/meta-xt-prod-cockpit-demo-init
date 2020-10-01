## Description for the launching Kingfisher Starterkit H3 board with prod-devel-agl Firmware.

1. PowerOn board and load prod-devel-agl firmware from sd-card or from internal board memory.

2. Check running XEN with required Domains(Dom0, DomD, DomA)
	2.a. Check running Domains
	xl list

	Dom0 and DomD should be running, the startup of DomA might take a while.

3. Check Weston config /etc/xdg/weston/weston.ini. Both HDMI display shall be turned on(remove "mode: off" for HDMI-A-1 and HDMI-A-2 if such parameter exists).
	Also, "transform=0" shall be set, to avoid the inverted image output.

4. Go to DomD console to check the startup and internet
	xl console DomD
	Check systemd services statuses:
	systemctl list-units

	
	4.b.[optionally, the internet connection does not affect DomA startup] In case if there is no internet assign a valid Ip address and a default route to enable traffic.
	
		Example: Switch(Router) IP 192.168.0.1
		// set IP inside of the domd
		ifconfig eth0 192.168.0.105 netmask 255.255.255.0 up

		//add default route
		route add default gw 192.168.0.1 eth0

		//verify internet connection
		ping 8.8.8.8

5. Manual start of DomA if by some reason does not starting:

	xl create /xt/dom.cfg/doma.cfg -c
	for debugging or checking possible issues with Android startup:
	// go to DomA console and open logcat for checking Android logs	
	xl console DomA
	logcat

