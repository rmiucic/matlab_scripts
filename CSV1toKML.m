function ret = CSV12KML(filename)
% reads in CSV1 file and saves and converts it to KML
% input is "date-time, latitude, longitude" such as 
% 2015-03-29T17:15:58Z,-83.119639,42.476276
  [DIR, NAME, EXT] = fileparts (filename);
  fid_out = fopen(strcat(DIR,'/',NAME,'_.kml'),'w');
  fid_in = fopen(filename,'r');

  fprintf(fid_out,'<?xml version="1.0" encoding="UTF-8"?><kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">\n');
  fprintf(fid_out,'<Document>\n');
  fprintf(fid_out,'<name>kml file</name>\n');
  fprintf(fid_out,'<Placemark>\n');
  fprintf(fid_out,'<gx:Track>\n');

  tline = fgetl(fid_in);      %2015-03-29T17:15:58Z,-83.119639,42.476276
  TMP1 = strsplit(tline,','); %2015-03-29T17:15:58Z
                              %-83.119639
                              %42.476276
  fprintf(fid_out,'<when>%s</when>\n',char(TMP1(1)));
  fprintf(fid_out,'<gx:coord>%s %s 152.0</gx:coord>\n',char(TMP1(2)),char(TMP1(3)));
  
  while ischar(tline)
    TMP1 = strsplit(tline,','); %2015-03-29T17:15:58Z
                                %-83.119639
                                %42.476276
    fprintf(fid_out,'<when>%s</when>\n',char(TMP1(1)));
    fprintf(fid_out,'<gx:coord>%s %s 152.0</gx:coord>\n',char(TMP1(2)),char(TMP1(3)));
    tline = fgetl(fid_in);         %2015-03-29T17:15:58Z,-83.119639,42.476276
  end

  fprintf(fid_out,'</gx:Track>\n');
  fprintf(fid_out,'</Placemark></Document></kml>\n');

  fclose(fid_in);
  fclose(fid_out);
end