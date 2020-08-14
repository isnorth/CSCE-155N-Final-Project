# CSCE-155N-Final-Project
This repository was created as part of the final project for UNL's Summer 2020 section of CSCE 155N. 

The function containted in plotVehicleStats.m produces one figure with two plots.
The first plot shows the efficiency over the range between an upper and lower bound of input power for a given set of constants C_0, C_1, and C_2. The second plot shows the endurance of the range between an upper and lower bound of fuel capacity for a given thermal efficiency (T_E), gasoline energy (E_g), and engine power (P). 



When calling the function--

    plotVehicleStats(powerBounds,C_0,C_1,C_2, ...
	fuelBounds,T_E,E_g,P)
        
These variables must be entered in the above listed order. The bounds for both plots are established, with the lower bound being entered first. Then the input constants are entered. First C_0, C_1, and C_2 for the first plot are entered, and then the thermal efficiency, gasoline energy, and engine power used to produce the second plot are entered. 



To produce those plots submitted with the final project, the command is:

    plotVehicleStats([0,125],0.6,0.02,0.0015,[25,100],0.25,8.8,298)
    
This command establishes an input power range of 0 to 125 kW and a fuel capacity range of 25 to 100 l. The constants for the first plot are C_0 = 0.6, C_1 = 0.02, and C_2 = 0.0015. Thermal efficiency(T_E) = 0.25, gasoline energy(E_g) = 8.8 kWh/l, and the engine power(P) = 298. 
