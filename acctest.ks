//AccTest.ks v0.1
//Acceleration Test Version 0.1 
//Holds any vessel at a given Aacceleration in m/s^s

//Startup
clearscreen. 
SET ves TO SHIP.
SAS ON.
RCS ON.
SET throt TO 1.
SET ac TO 30.

SET RUNMODE TO 0.
STAGE.
//Main loop.
UNTIL RUNMODE = -1 {
	LOCK THROTTLE TO throt.

	SET m TO ves:MASS.
	SET maxThrust TO ves:MAXTHRUST.
	SET desiredThrust TO ac*m.
	SET currentThurst TO throt * maxThrust. 
	SET a TO currentThurst/m.
	
	IF currentThurst> desiredThrust{
		SET throt TO throt-.001.
		//PRINT "R>D" AT (1,18).
	}
	IF currentThurst < desiredThrust{
		SET throt TO throt+.001.
		//PRINT "R<D" AT (1,20).
	}
	//Prints information to the terminal.
		PRINT "======Running: AccTest.ks v0.1======" AT (1,2).
		PRINT "Thrust: " + ROUND(currentThurst,2) + " kN" AT (1,4).
		PRINT "Acceleration: " + ROUND(a,2) +" m/s^2" AT (1,6).
		PRINT "Total Mass: " + ROUND(m*1000, 2) AT (1,8).
		PRINT "Max Thrust: " + ROUND(maxThrust,2) AT (1,10).
		PRINT "Current Thurst: " + ROUND(currentThurst,2) AT (1,12).
		PRINT "Thrust Needed: " + ROUND(desiredThrust,2) AT (1,14).
		PRINT "Throttle Percent: " + ROUND(throt*100,2) + "%" AT (1,16).
		PRINT "***Gauges are inaccurate when " AT (1,20).
		PRINT "the throttle is above 100% " AT (1,22).
}
