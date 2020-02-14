%% Encoding

ISI=(sum(design_struct.eventlist(:, 4))*2);
Enc_ya=13*180;
Enc_oa=13*140;

totaltime_YA_enc=(ISI+Enc_ya)/60;
totaltime_OA_enc=(ISI+Enc_oa)/60;
clear design_struct
%% Retrieval

ISI=sum(design_struct.eventlist(:, 4));
Retr_ya=10.5*90;
Retr_oa=12.5*70;

totaltime_YA_retr=(ISI+Retr_ya)/60;
totaltime_OA_retr=(ISI+Retr_oa)/60;
clear design_struct.eventlist

