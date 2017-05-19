%8935                              HW10A                        UsmanAhmed
%Reads HW10A_data
clc;
clear;
Matrix  = load('HW10A_data.csv');
within27 = 0;
timeStart = 0;
Time = Matrix(:,1); %setting up the matrix for time
Lat1 = Matrix(:,2); %setting up the matrix for lat1
Long1 = Matrix(:,3);%setting up the matrix for long1
Lat2 = Matrix(:,4); %setting up the matrix for lat2
Long2 = Matrix(:,5); %setting up the matrix for long2
Matrixlength = length(Matrix); %length of the matrix is the same for every data point
fid = fopen('Output.txt', 'w'); % opens file to input data to
fprintf(fid,'Distance between Race Boats');
fprintf(fid,'\nTime(s)          Distance(m)');
Distance = zeros(Matrixlength,1);
for i = 1: Matrixlength
    [T,D] = BoatDistance(Time(i),Lat1(i),Long1(i),Lat2(i),Long2(i)); % calculates data using function BoatDistance
    Distance(i)= D;
    if( Distance(i) < 27) %if distance is within 27 increment counter
        timeStart = i;    %marks the spot where the counter was incremented
        fprintf(fid,'\n%1.1f                 %1.003f',T,D);
        within27 = within27 + 1;
    end
    
end
fprintf(fid,'\nThe %1.0f boats are within 27m of each other at %1.0f timesteps', within27, timeStart);
fclose(fid);

