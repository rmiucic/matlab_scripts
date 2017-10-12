function ret = readCSV1(filename)
% reads CSV file and returns array of numeric values
% input is "date-time, latitude, longitude" such as 
% 2015-03-29T17:15:58Z,-83.119639,42.476276
% output is nx5 array [hour minute second long lat]
  fid = fopen(filename,'r');
  tline = fgetl(fid);         %2015-03-29T17:15:58Z,-83.119639,42.476276
  TMP1 = strsplit(tline,','); %2015-03-29T17:15:58Z
                              %-83.119639
                              %42.476276
  long = str2double(TMP1(2)); %-83.119639
  lat  = str2double(TMP1(3)); %42.476276
  TMP2= strsplit(char(TMP1),'T');  %2015-03-29
                                   %17:15:58Z
  TMP2a=strsplit(char(TMP2(1)),'-');
  year  =str2double(TMP2a(1));
  month =str2double(TMP2a(2));
  day   =str2double(TMP2a(3));
  TMP3= strsplit(char(TMP2(2)),'Z');%17:15:58
  TMP3a=strsplit(char(TMP3(1)),':');%17
                                    %15
                                    %58
  hour   =str2double(TMP3a(1));
  minute =str2double(TMP3a(2));
  second =str2double(TMP3a(3));
  tline = fgetl(fid);         %2015-03-29T17:15:58Z,-83.119639,42.476276
  while ischar(tline)
    TMP1 = strsplit(tline,','); %2015-03-29T17:15:58Z
                                %-83.119639
                                %42.476276
    long = [long; str2double(TMP1(2))]; %-83.119639
    lat  = [lat; str2double(TMP1(3))]; %42.476276
    TMP2 = strsplit(char(TMP1),'T');  %2015-03-29
                                     %17:15:58Z
    TMP2a = strsplit(char(TMP2(1)),'-');
    year  = [year; str2double(TMP2a(1))];
    month = [month; str2double(TMP2a(2))];
    day   = [day; str2double(TMP2a(3))];
    TMP3= strsplit(char(TMP2(2)),'Z');%17:15:58
    TMP3a=strsplit(char(TMP3(1)),':');%17
                                      %15
                                      %58
    hour   = [hour; str2double(TMP3a(1))];
    minute = [minute; str2double(TMP3a(2))];
    second = [second; str2double(TMP3a(3))];
    tline = fgetl(fid);         %2015-03-29T17:15:58Z,-83.119639,42.476276
  end
  fclose(fid);
  ret = [hour minute second long lat];
end