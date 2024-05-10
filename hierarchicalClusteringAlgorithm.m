data = [4   53;
    5     63;
    10    59;
    9      77;
    13     49;
    13     69;
    12     88;
    15     75;
    18     61;
    19     65;
    22     74;
    27     72;
    28     76;
    24     58;
    27     55;
    28     60;
    30     52;
    72     31;
    64     30;
    31     60;
    32     61;
    36     72;
    28     147;
    32     149;
    35      153;
    33     154;
    38      151;
    41       150;
    38       145;
    38       143;
    32       143;
    34        141;
    44        156;
    44        149;
    44         143;
    46         142;
    61         25;
    76         27;
    47         149;
    49          152;
    50         142;
    53         144;
    52         152;
    55         155;
    54         124;
    60         136;
    63          139;
    86         132;
    85         115;
    85         96;
    78         94;
    74         96;
    97        122;
    98         116;
    98         124;
    64         20;
    69         21;
    99         119;
    99         128;
    101        115;
    108        111;
    110        111;
    108        116;
    111        126;
    115        117;
    117        115;
    70          4;
    77          12;
    83          21;
    61          15;
    69          15;
    78          16;
    66          18;
    58          13;
    66          23];


% treefigure1=linkage(data);
dendrogram(linkage(data));
% treefigure2=linkage(data,   'complete');
% treefigure3=linkage(data,   'average');
% treefigure4=linkage(data,   'ward');
% treefigure5=linkage(data,   'centroid');

% subplot(3,2,1)
% dendrogram(treefigure1);
% title('single');
% 
% subplot(3,2,2)
% dendrogram(treefigure2);
% title('complete');
% 
% subplot(3,2,3)
% dendrogram(treefigure3);
% title('average');
% 
% subplot(3,2,4)
% dendrogram(treefigure4);
% title('ward');
% 
% subplot(3,2,5)
% dendrogram(treefigure5);
% title('centroid');
