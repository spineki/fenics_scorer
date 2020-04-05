
ls = 5;
nombre_points_courbe = 1000;
ratio = 1000.0; // pour convertir les mètres en kilomètres

L = 10000; // um
R = 10000.0;   // hauteur du bord supérieur du domaine
a = 1000;
h = 2.0;
Point(1) = {-L, R, 0, ls};
Point(2) = {-L, 0, 0, ls};
Point(3) = {L, 0, 0, ls};
Point(4) = {L, R, 0, ls};

Line(1) = {1, 2};
Line(2) = {3, 4};
Line(3) = {4, 1};

pList[0] = 2; // First point label
nPoints = nombre_points_courbe; // Nombre de points de discretisation pour la sorcière
For i In {1 : nPoints}
	x =-L + 2*L*i/(nPoints + 1);
	pList[i] = newp;
	Point(pList[i]) = {x, (  h * (a * a * a)/(x*x + a*a) ) , 0, ls};
EndFor
pList[nPoints+1] = 3; // Last point label (top-left point of the outlet region)

Spline(6) = pList[];
Line Loop(7) = {1,6,2,3};
Plane Surface(7) = {7};
Physical Surface("surf") = {7};
Transfinite Line {6, 1, 3, 2} = 50 Using Progression 1;

