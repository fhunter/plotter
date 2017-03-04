include <constants.scad>;
include <rails.scad>;

module x_car() {
    color("red") {
	difference() {
		union() {
			minkowski() {
			        cube([inter_raildistance+2*raildiameter,bearingouterdiameter*1.5-3,bearingouterdiameter*1.5-3],center=true);
				rotate([0,90,0]) cylinder(r=3,h=1,center=true);//FIXME - may be just put a cylinder?
			}
		        translate([0,25/2+raildiameter,0]) cube([inter_raildistance+2*raildiameter,25,raildiameter*2],center=true);
		};
		union() {
			rotate([0,90,0]) cylinder(d=bearingouterdiameter,h=inter_raildistance+2*raildiameter+3,center=true); //Axis + bearings
			translate([0,30,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true); // Block hole //FIXME - translate vs diameter
			//FIXME - needs cutout for y-rails
		}
	}
    }
};

module x_car_ass() {
	x_car();
	translate([inter_raildistance/2+raildiameter-bearinglength/2,0,0]) railbearing();
	translate([-(inter_raildistance/2+raildiameter)+bearinglength/2,0,0]) railbearing();
}

module x_carriage() {
        translate([xrail_position,0,rail_height]) {
            x_car_ass();
            translate([0,xraillength,0]) mirror([0,1,0]) x_car_ass();
        }
}
