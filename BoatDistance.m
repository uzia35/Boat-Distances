%8935                              HW10A                        UsmanAhmed
function[Time,Distance] = BoatDistance(time,lat1, long1, lat2, long2)
R = 6.371*10^6; % Earth's radius in meters
changeLat = lat2 - lat1;
changeLong = long2 - long1;
a = sind(changeLat/2).^2 + cosd(lat1) .* cosd(lat2).*sind(changeLong/2).^2;
c = 2 .* atan2(sqrt(a),sqrt(1-a));
Distance = R*c;
Time = time;





