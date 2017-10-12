function [tm_sec long_deg lat_deg x1_m y1_m x_m y_m dist_m spd_mps hd_deg] = tm_gps_xy_dst_spd_hd(filename)
% Given filename reads CSV file and returns array of numeric values
% input is "date-time, latitude, longitude" such as 
% "2015-03-29T17:15:58Z,-83.119639,42.476276"
% output is n x 10 array [tm_sec long_deg lat_deg x_m y_m dist_m spd_mps hd_deg]
% tm_sec - first value is zero and consecutive value is an ofset of the first value of the input time 
  %hour_ix = 1;
  %minute_ix = 2;
  second_ix = 1;
  long_ix = 3;
  lat_ix = 2;
  o=csvread(filename);
	%o = readCSV1(filename); % [hour minute second long lat]
	o_p1 = o(1,:);
	o_p1 = [o_p1; o(1:length(o)-1,:)];
	%[x_m, y_m, hd_deg] = XYfromGPS(o(:,lat_ix),o(:,long_ix),o_p1(:,lat_ix),o_p1(:,long_ix));
	%[x1_m, y1_m, hd_deg1] = XYfromGPS(o(1,lat_ix),o(1,long_ix),o_p1(:,lat_ix),o_p1(:,long_ix));
	[x_m, y_m, hd_deg] = XYfromGPS(o_p1(:,lat_ix),o_p1(:,long_ix),o(:,lat_ix),o(:,long_ix));
	[x1_m, y1_m, hd_deg1] = XYfromGPS(o(1,lat_ix),o(1,long_ix),o_p1(:,lat_ix),o_p1(:,long_ix));
	
  %tm_sec = timeDiff(o(:,hour_ix),o(:,minute_ix),o(:,second_ix),o_p1(:,hour_ix),o_p1(:,minute_ix),o_p1(:,second_ix));
	tm_sec =o(:,second_ix)-o_p1(:,second_ix);
  [bla dist_m spd_mps] = HeadDistSpeed(o(:,lat_ix),o(:,long_ix),o_p1(:,lat_ix),o_p1(:,long_ix), tm_sec);
  long_deg = o(:,lat_ix);
  lat_deg  = o(:,long_ix);
	%ret = [tm_sec long_deg lat_deg x_m y_m dist_m spd_mps hd_deg];
end