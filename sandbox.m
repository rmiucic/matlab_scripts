clear;
close all;
%P1 = [-83.15838318923854 42.48958508974084]
%P2 = [-83.15981160803905 42.49051641138864]
%P3 = [-83.15903089048497 42.48912384903382]
%P4 = [-83.1573825819996 42.48959131289671]
%d=GPSDistance(P1(2),P1(1),P2(2),P2(1))
%R=6.371*10^6;
%x=R*(P2(2)-P1(2))*pi/180;
%y=R*(P2(1)-P1(1))*pi/180*cos(P1(2)*pi/180);
%[x2 y2 b2]=XYfromGPS(P1(2),P1(1),P2(2),P2(1));
%[x3 y3 b3]=XYfromGPS(P1(2),P1(1),P3(2),P3(1));
%[x4 y4 b4]=XYfromGPS(P1(2),P1(1),P4(2),P4(1));
%[x5 y5 b5]=XYfromGPS(P1(2),P1(1),P1(2),P4(1))
%filename='c:\Users\Radovan\Dropbox\private\V2V-class\homework\project1\test.csv';
%M = csvread(filename);
%plot(10,10);

%t = 0:pi/20:2*pi;
%hline1 = plot(t,sin(t),'k');
%ax = gca;
%hline2 = line(t+.06,sin(t),...
%   'LineWidth',4,...
%   'Color',[.8 .8 .8],...
%   'Parent',ax);
%set(gca,'Children',[hline1 hline2])

%x=[2 4 4 2 2];
%y=[2 2 5 5 2];
%figure;
%hline3 =line(x,y,'Color','red');
%xlim([1 6]);
%ylim([1 6]);
%axis([0 10 0 10])
%rectangle('Position',[1.5 1.5 2 4],'Curvature',0.2)

%% origin lower left corner 
%RECTANGLE('Position', [x y w h])
%w=3; %width
%h=2; %height
%x=0.2;y=1; %corner position
%xv=[x x+w x+w x x];yv=[y y y+h y+h y];
%figure(1), plot(xv,yv);axis equal;
%  axis([-2 4 -5 5]);
%for angle=1:1:360
%  %rotate angle alpha
%  R(1,:)=xv;R(2,:)=yv;
%  alpha=angle*2*pi/360;
%  XY=[cos(alpha) -sin(alpha);sin(alpha) cos(alpha)]*R;
%  hold on;plot(XY(1,:),XY(2,:),'r');
%  pause(0.1);
%end

%% rectangle origin center
%cx=3; %center of rectangle
%cy=3;
%c=[cx;cy];
%w=3; %width
%h=2; %height
%x=[-w/2 w/2 w/2 -w/2 -w/2];
%y=[-h/2 -h/2 h/2 h/2 -h/2];
%R=[x;y];
%R_c=R+c;
%figure(1), 
%plot(R_c(1,:),R_c(2,:),'r');
%axis([0 6 0 6]);
%for angle=1:10:360
%%rotate angle heading
%  %head=angle*pi/180;
%  %ROT_A =[cos(head) sin(head); -sin(head) cos(head)]; 
%  %R_r=ROT_A*R;
%  %R_c=R_r+c;
%  R_c=rect(w,h,cx,cy,angle);
%  hold on; plot(R_c(1,:),R_c(2,:),'b');
%  pause(0.1);
%end
%hour_ix = 1;
%minute_ix = 2;
%second_ix = 3;
%long_ix = 4;
%lat_ix = 5;
%
%[tm_sec long_deg lat_deg x_m y_m dist_m spd_mps hd_deg] = tm_gps_xy_dst_spd_hd(filename);

%filename='c:\Users\Radovan\Dropbox\private\V2V-class\homework\project1\test.csv';
%[tm_sec long_deg lat_deg x1_m y1_m x_m y_m dist_m spd_mps hd_deg] = tm_gps_xy_dst_spd_hd(filename);
filename='c:\Users\Radovan\Dropbox\private\V2V-class\homework\projectExtraCredit\ph_input.csv';
[tm_sec long_deg lat_deg x1_m y1_m x_m y_m dist_m spd_mps hd_deg]=tm_gps_xy_dst_spd_hd2(filename);


%o=csvread(filename);

%figure;
%plot(tm_sec,'.r');
%figure;
%plot(lat_deg,long_deg,'.b');
mx=max((max(y1_m)-min(y1_m)),(max(x1_m)-min(x1_m)))
figure;
plot(x1_m,y1_m,'.dr');
xlabel('x-axis');
ylabel('y-axis');
%axis([ min(x1_m) min(x1_m)+mx min(y1_m) min(y1_m)+mx]);
title("plot(x1\_m,y1\_m)");

%figure;
%plot(y1_m,x1_m,'.b');
%title("plot(y1\_m,x1\_m)");
%axis([min(y1_m) min(y1_m)+mx min(x1_m) min(x1_m)+mx]);
%xlabel('x-axis');
%ylabel('y-axis');

%figure;
%plot(x_m,y_m,'.m');
%figure;
%plot(dist_m,'.k');
%figure;
%plot(spd_mps,'.r');
figure;
plot(hd_deg,'.r');
legend('head');

%figure;
%for i=1:5
%  R_c = rect(2,5,x1_m(i),y1_m(i),hd_deg(i));
%  hold on; plot(R_c(1,:),R_c(2,:),'b');
%end

%figure;
%for i=1:length(tm_sec)
%  R_c = rect(2,5,x1_m(i),y1_m(i),hd_deg(i));
%  hold on; plot(R_c(1,:),R_c(2,:),'b');
%end
%hold on; plot(x1_m,y1_m,'.dg');
%axis([min(x1_m) min(x1_m)+mx min(y1_m) min(y1_m)+mx]);
%o=readCSV1(filename);
%h=zeros(length(o),1);
%for ix=2:length(o)
%  [~, ~, h1] = XYfromGPS(o(ix-1,lat_ix),o(ix-1,long_ix),o(ix,lat_ix),o(ix,long_ix));
%  h(ix-1)=h1;
%end
%[~, ~, h] = XYfromGPS(o(1,lat_ix),o(1,long_ix),o(2,lat_ix),o(2,long_ix));
%[h, d, s] = HeadDistSpeed(o(1,lat_ix),o(1,long_ix),o(2,lat_ix),o(2,long_ix),0.5);

%o_p1=o(1,:);
%o_p1=[o_p1; o(1:length(o)-1,:)];

%[x, y, h] = XYfromGPS(o(:,lat_ix),o(:,long_ix),o_p1(:,lat_ix),o_p1(:,long_ix));

%plot(h,'.r');
%plot(tm_sec,'.r');
%figure;
%plot(lat_deg,long_deg,'.r');
%plot(dist_m,'.r');
%figure;
%plot(spd_mps,'.r');
%plot(x1_m,y1_m,'.r');

%CSV1toKML(filename);
%formatSpec = '%C%{yyyy-MM-ddTHH:mm:ssZ}D%f%f';
%T = readtable(filename,'Delimiter',',','Format',formatSpec);
%delimiterIn = ',';
%headerlinesIn = 1;
%fid = fopen(filename,'r');
%A = importdata(filename,delimiterIn,headerlinesIn);
%tline = fgets(fid)
%while ischar(tline)
%    %disp(tline)
%    tline
%    tline = fgets(fid);
%end
%tline = fgetl(fid);         %2015-03-29T17:15:58Z,-83.119639,42.476276
%
%TMP1 = strsplit(tline,','); %2015-03-29T17:15:58Z
%                            %-83.119639
%                            %42.476276
%                            
%long = str2double(TMP1(2)); %-83.119639
%lat  = str2double(TMP1(3)); %42.476276
%
%TMP2= strsplit(char(TMP1),'T');  %2015-03-29
%                                 %17:15:58Z
%TMP2a=strsplit(char(TMP2(1)),'-');
%year  =str2double(TMP2a(1));
%month =str2double(TMP2a(2));
%day   =str2double(TMP2a(3));
%
%TMP3= strsplit(char(TMP2(2)),'Z');%17:15:58
%TMP3a=strsplit(char(TMP3(1)),':');%17
%                                  %15
%                                  %58
%hour   =str2double(TMP3a(1));
%minute =str2double(TMP3a(2));
%second =str2double(TMP3a(3));
%disp(tline);
%disp([year month day hour minute second]);
%tline = fgetl(fid);
%[veh tm lat long]= sscanf(tline,'%s,%s,%f,%f');
%disp(tm);
%CCC=textscan(fid, '%s,%s,%f,%f')
%while ischar(tline)
%  tline = fgetl(fid);
%  [time lat long]= sscanf(tline,'%s,%f,%f');
%  disp(time);
%  disp(lat);
%  disp(long);
%  %disp(tline);
%end
%fclose(fid);
