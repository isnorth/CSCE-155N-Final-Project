function [] = plotVehicleStats(powerLowerBound,powerUpperBound,fuelLowerBound,fuelUpperBound)
%[] = plotVehicleStats(powerLowerBound,powerUpperBound,fuelLowerBound,fuelUpperBound)
    %ADD FUNCTION DESCRIPTION
    
    %start figure, turn off number title, name figure
    figure('numbertitle','off','name','Vehicle Stats');
    
    %Equations for FIRST plot (efficiency vs. P_in)
    subplot(2,1,1);

    %set values for constants
    C_0 = 0.6; C_1 = 0.02; C_2 = 0.0015; 
    
    %set range of values for P_in
    P_in = powerLowerBound:powerUpperBound;
    
    %calculate power loss
    P_loss = C_0 + C_1.*P_in + C_2*(P_in.^2);
    
    %caluclate power out
    P_out = P_in - P_loss;
    
    %calculate efficiency (symbol is lambda)
    lambda = P_out./P_in;
    
    plot(P_in,lambda); %plot fuel capacity (C_f) on the x-axis w/ endurance(X) on the y-axis
    title('Vehicle Efficiency'); %title plot same as figure
    xlabel('Power In (kW)'); %label x-axis
    ylabel('Efficiency'); %label y-axis
    axis([powerLowerBound,powerUpperBound,0,1]); %ensure entire graph fits on graph
    
    
    %Equations for SECOND plot
    subplot(2,1,2);
    %Set given constants for 
    T_E = 0.25; %thermal efficiency
    E_g = 8.8; %gasoline energy (kWh/l)
    P = 298; %engine power (kW)
    
    %set range for fuel capacity (l) as a matrix
    C_f = fuelLowerBound:5:fuelUpperBound;
    
    %calculate fuel flow (R_f) as a constant
    R_f = P/(E_g*T_E);
    
    %calculate endurance (X) as a matrix
    X = C_f/R_f;
    
    
    plot(C_f,X); %plot fuel capacity (C_f) on the x-axis w/ endurance(X) on the y-axis
    title('Vehicle Endurance'); %title plot same as figure
    xlabel('Fuel Capacity (l)'); %label x-axis
    ylabel('Endurance'); %label y-axis
    axis([fuelLowerBound,fuelUpperBound,0,1]); %ensure entire graph fits on graph
    
end