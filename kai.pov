#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "consts.inc"
#include "woods.inc"
#include "stones.inc"
#include "glass.inc"

camera {
        location <0,-10,-40>
        look_at <0,-10,-50>
        right<(1920/1080),0,0>
        angle 90
}

light_source {<0,-7,-60> color White parallel}

// Surface of the sea
plane {<0,1,0>, 0 
	//finish = reflection and refraction
        finish {reflection{0,1 fresnel} // Reflection of light
               specular .3 //Highlight
               roughness .001 // Size of highlight
               phong 1 // Highlight
               phong_size 500000 
               ambient 0.1 // Environmental light
        }
        // normal = ripple and unevenness
        normal {average
               normal_map{[1 granite -.8 scale 30 poly_wave .2]
                          [1 granite -.6 scale 10 poly_wave .2]
                          [1 granite -.4 scale 3 poly_wave .2]
               }
        }
        pigment {color Blue}
        interior{ior 1.33}
}

// Sky
sky_sphere {
	pigment {
		gradient y
		color_map {
			[0.0 White]
			[0.1 SkyBlue]
			[1.0 Blue]
		}
	}
	pigment {
		wrinkles
		color_map {
			[0.0 rgbft<1,1,1,0,1>]
			[0.5 rgbft<1,1,1,0,1>]
			[0.8 White]
			[1.0 Gray75]
		}
		scale 0.5
	}
}

// Window part
union {
	// Window sash
	difference {
		object {Disk_Z scale <2.5,2.5,0.1>}
		object {Disk_Z scale <2.1,2.1,1>}
		texture {finish {Metal} pigment {Black}}
	}
	// Window sash
	difference {
		object {Disk_Z scale <2.5,2.5,0.1>}
		object {Disk_Z scale <2.1,2.1,1>}
		#declare K=0;
		#while (K<360)
			object {Sphere scale 0.08 pigment {color Black}  translate <0,2.05,0> rotate <0,0,K>}
			#declare K=K+20;
		#end
		texture {finish {Metal} pigment {Black}}
		translate <0,0,-0.25>
	}
	// Window sash
	difference {
		object {Disk_Z scale <2.5,2.5,0.1>}
		object {Disk_Z scale <2.1,2.1,1>}
		texture {finish {Metal} pigment {Black}}
		translate <0,0,-0.5>
	}
	// Window 
	object {Disk_Z scale <2.5,2.5,0.01> material {texture {pigment {color Clear} finish {F_Glass1}} interior {I_Glass1 fade_color Col_Emerald_03}} translate <0,0,-0.128>}
	// Wall of submarine
	difference {
		object {Disk_Z scale <10,10,0.1>}
		object {Disk_Z scale <2.5,2.5,1>}
		texture {pigment {Black}}
		translate <0,0,-0.5>
	}
		translate <0,-10,-47>
}

//Gem
sphere {
	<0,0,0>, 5
	texture {Mirror}
	translate <0,-5,0>
}
//Black wall
plane {
	<0,0,1>, -70
	pigment {color Black}
}







