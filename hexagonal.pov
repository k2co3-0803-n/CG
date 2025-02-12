#include "colors.inc"
#include "Shapes.inc"

camera {
	location <20, 25, -20>
	look_at <0, 10, 0>
}

light_source {<10, 5, -10> color White}
light_source {<0, 10, 0> color White}
light_source {<0, 10, 10> color White}
light_source {<-10, 10, 0> color White}

background {Black}

plane {
	<0,1,0>, 0
	pigment {color Gray}
}

#macro HSVtoRGB (i, C, V)
		#declare H = i;
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
#end

#declare h = 0;
#while (h <= 10)
	union {
		HSVtoRGB(0, 0, h/10)
		sphere {
			<0,0,0>, 0.1
			pigment {color rgb <R,G,B>}
			translate <0,h,0>
		}
		#declare h = h + 0.01;
	}
#end
	
#macro BusLine (theta)
	union {
		#declare i = 0;
		#while (i <= 10)
			HSVtoRGB(theta, i/10, i/10)
			sphere {
				<0,0,0>, 0.1
				pigment {color rgb <R,G,B>}
				translate <i,i,0>
			}
			#declare i = i + 0.01;
		#end
		rotate <0,-theta,0>
	}
#end

BusLine(0)
BusLine(60)
BusLine(120)
BusLine(180)
BusLine(240)
BusLine(300)

#macro Adjacent (theta)
	union {
		#declare i = 0;
		#while (i <= 60)
			HSVtoRGB(theta+i, 1, 1)
			sphere {
				<10,10,0>, 0.1
				pigment {color rgb <R,G,B>}
				translate <-i/12,0,1.732*i/12>
			}
			#declare i = i + 0.01;
		#end
		rotate <0,-theta, 0>
	}
#end

Adjacent (0)
Adjacent (60)
Adjacent (120)
Adjacent (180)
Adjacent (240)
Adjacent (300)

#macro Adjacent2 (theta)
	union {
		#declare i = 0;
		#while (i <= 1.0)
			HSVtoRGB(theta, i, 1)
			sphere {
				<0,10,0>, 0.1
				pigment {color rgb <R,G,B>}
				translate <10*i,0,0>
			}
			#declare i = i + 0.001;
		#end
		rotate <0,-theta,0>
	}
#end

Adjacent2 (0)
Adjacent2 (60)
Adjacent2 (120)
Adjacent2 (180)
Adjacent2 (240)
Adjacent2 (300)