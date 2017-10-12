function  [hdg dst spd] = HeadDistSpeed(lat1, long1, lat2, long2, time_sec)
% Given latitude, longitude of two points and time difference between them 
% returns Heading, Distance and Spped between them.
  [x, y, hdg] = XYfromGPS(lat1,long1,lat2,long2);
  dst=sqrt(x.*x + y.*y);
  %dst2=GPSDistance(lat1, long1, lat2, long2);
  spd = dst./time_sec;
  
end