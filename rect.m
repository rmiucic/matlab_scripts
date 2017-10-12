function R_c = rect(w,h,cx,cy,head_deg)
% returns points of a rectange R_c [x1 x2 x3 x4 x1; y1 y2 y3 y4 y1]
% given the with, height, center of the rectangle and orientation/heading angle 
% orientation angle zero to the north positive towards east.
  x=[-w/2 w/2 w/2 -w/2 -w/2];
  y=[-h/2 -h/2 h/2 h/2 -h/2];
  R=[x;y];
  head_rad=head_deg*pi/180;
  ROT_A =[cos(head_rad) sin(head_rad); -sin(head_rad) cos(head_rad)]; 
  R_r=ROT_A*R;
  R_c=R_r+[cx;cy];

end