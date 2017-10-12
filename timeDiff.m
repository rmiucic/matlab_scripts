function time_sec = timeDiff(hh1, mm1, ss1, hh2, mm2, ss2)
% Given hour miunte and sec of two times return differnce in seconds between them
time1_sec=hh1*60*60 + mm1*60 + ss1;
time2_sec=hh2*60*60 + mm2*60 + ss2;
time_sec = time1_sec -  time2_sec;
end