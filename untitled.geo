 	ls = 5;
 
	//Xi = 150; // um
	//Xo = 150; // um
	L = 100.0; // um
 
	//x0 = Xi + L/2.0;
	R = 60.0;   // height of the plane part
	h = 1.0;
	a = 30.0;

	//Z = 10; // extrusion height
	//ordre horaire, partant de bas gauche
 
	Point(1) = {-L, R, 0, ls};
	Point(2) = {-L, 0, 0, ls};

	Point(3) = {L, 0, 0, ls};
	Point(4) = {L, R, 0, ls};
	
	Line(1) = {1, 2};

	Line(2) = {3, 4};
	Line(3) = {4, 1};

 
	pList[0] = 2; // First point label
	nPoints = 41; // Number of discretization points (top-right point of the inlet region)
	For i In {1 : nPoints}
	  x =-L + 2*L*i/(nPoints + 1);
	  pList[i] = newp;
	  Point(pList[i]) = {x, 
	                (  h * (a * a * a)/(x*x + a*a) ) ,
	                0,
	                ls};
	EndFor
	pList[nPoints+1] = 3; // Last point label (top-left point of the outlet region)
 
	Spline(6) = pList[];
	Line Loop(7) = {1,6,2,3};
	Plane Surface(7) = {7};
	Physical Surface("surf") = {7};
 
	//Transfinite Line {9, 10} = Ceil(L/ls) Using Progression 1;
	//Transfinite Line {4, -2, 8, -6} = Ceil(R/ls) Using Progression 1.1;
	//Transfinite Line {1, 3} = Ceil(Xi/ls) Using Progression 1;
	//Transfinite Line {5, 7} = Ceil(Xo/ls) Using Progression 1;
 
	//Line Loop(11) = {4, 1, 2, 3};
	//Plane Surface(12) = {11};
	//Line Loop(13) = {2, 10, 8, -9};
	//Plane Surface(14) = {13};
	//Line Loop(15) = {8, 5, 6, 7};
	//Plane Surface(16) = {15};
	//Transfinite Surface {14,12,16};
	//Recombine Surface {14,12,16};
	
	/*
	Extrude {0,0,Z} {
	 Surface{14,12,16}; Layers{1}; Recombine;
	}
	Coherence;
	*/
	/*
	Physical Surface("symmetryLine") = {51, 37, 73};
	Physical Surface("frontAndBack") = {60, 38, 82, 16, 14, 12};
	Physical Surface("wall") = {59, 29, 81};
	Physical Surface("inlet") = {47};
	Physical Surface("outlet") = {77};
	Physical Volume("volume") = {2, 1, 3};
	*/
//+
//Extrude {0, 0, 1} {
//  Surface{7}; 
//}
//+
//Extrude {0, 0, 1} {
//  Surface{29}; 
//}
