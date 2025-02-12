#include "colors.inc"

camera {
	location <0.0, 0.0, -5>
	look_at <0.0, 0.0, 0.0>
}

light_source {<0.0, 0.0, -10> color White}

background {White}

#declare C = 1; //Saturation
#declare V = 1; //Value

#declare N = 256;
#declare i = 0;

#while (i < N)
	#declare H = (360 * i) / N;
	#declare H1 = H / 60;
	#declare X = C * (1 - abs(mod(H1, 2) - 1));

	#switch (H1)
		#range (0,1)
			#declare R = V;
			#declare G = V - C + X;
			#declare B = V - C;
		#break;

		#range (1,2)
			#declare R = V - C + X;
			#declare G = V;
			#declare B = V - C;
		#break;

		#range (2,3)
			#declare R = V - C;
			#declare G = V;
			#declare B = V - C + X;
		#break;

		#range (3,4)
			#declare R = V - C;
			#declare G = V - C + X;
			#declare B = V ;
		#break;

		#range (4,5)
			#declare R = V - C + X;
			#declare G = V - C;
			#declare B = V;
		#break;

		#range (5,6)
			#declare R = V;
			#declare G = V - C;
			#declare B = V - C + X;
		#break;
	#end
	
	polygon {
		4,
		<-0.0185, 1.5, 0>, <0.0185, 1.5, 0>, <0.0185, 1, 0>, <-0.0185, 1, 0>
		pigment {color rgb<R, G, B>}
		rotate <0,0,-i/256 * 360>
	}
	#declare i = i + 1;
#end