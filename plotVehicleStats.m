function [] = plotVehicleStats(powerBounds,C_0,C_1,C_2,fuelBounds,T_E,E_g,P)
    %This function produces two graphs, the first shows the effect
    %of input power on efficiency, the second shows the effect of 
    %fuel capacity on endurance. This function was created to fulfill
    %the requirements of UNL's CSCE 155N Summer 2020's final project. 
    %To produce the graphs used in the final project:
        %powerBounds = [0,125]; %input power (kW)
        %C_0 = 0.6; C_1 = 0.02; C_2 = 0.0015;
        %fuelBounds = [25,100]; %fuel capacity (l)
        %T_E = 0.25; %thermal efficiency
        %E_g = 8.8; %gasoline energy (kWh/l)
        %P = 298; %engine power (kW)
    
    %start figure, turn off number title, name figure
    figure('numbertitle','off','name','Vehicle Stats');
    
    %Equations for FIRST plot (efficiency vs. P_in)
    subplot(2,1,1); 
    
    %set range of values for P_in
    P_in = powerBounds(1):0.1:powerBounds(2);
    
    %calculate power loss
    P_loss = C_0 + C_1.*P_in + C_2.*(P_in.^2);
    
    %caluclate power out
    P_out = P_in - P_loss;
    
    %calculate efficiency (symbol is lambda)
    lambda = P_out./P_in;
    
    plot(P_in,lambda); %plot fuel capacity (C_f) on the x-axis w/ endurance(X) on the y-axis
    title('The Effect of Power In on Efficiency'); %title plot same as figure
    xlabel('Power In (kW)'); %label x-axis
    ylabel('Efficiency'); %label y-axis
    axis([powerBounds(1),powerBounds(2),0,1]); %ensure entire graph fits on graph
    
    
    %Equations for SECOND plot
    subplot(2,1,2);
    
    %set range for fuel capacity (l) as a matrix
    C_f = fuelBounds(1):0.1:fuelBounds(2); 
    
    %calculate fuel flow (R_f) as a constant
    R_f = P/(E_g*T_E);
    
    %calculate endurance (X) as a matrix
    X = C_f./R_f;
    
    
    plot(C_f,X); %plot fuel capacity (C_f) on the x-axis w/ endurance(X) on the y-axis
    title('The Effect of Fuel Capacity on Endurance'); %title plot same as figure
    xlabel('Fuel Capacity (l)'); %label x-axis
    ylabel('Endurance'); %label y-axis
    axis([fuelBounds(1),fuelBounds(2),0,1]); %ensure entire graph fits on graph
    
end