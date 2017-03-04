include <constants.scad>;
include <rails.scad>;

module y_car() {
    color("red") {
	difference() {
	        cube([inter_raildistance+bearingouterdiameter*1.5,bearinglength*2+15,bearingouterdiameter*1.5],center=true);
		union() {
			//Here go cutouts
			rotate([0,0,90]) cylinder(d=25,h=90,center=true); //Center hole
			translate([inter_raildistance/2,0,0]) rotate([90,0,0]) cylinder(d=bearingouterdiameter,h=bearinglength*2+15+1,center=true);//Axis holes
			translate([-inter_raildistance/2,0,0]) rotate([90,0,0]) cylinder(d=bearingouterdiameter,h=bearinglength*2+15+1,center=true);//Axis holes
			translate([0,bearinglength+15/2,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true);//Block hole
			translate([0,-bearinglength-15/2,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true);//Block hole
		}
	}
    }
}

module y_carriage() {
        translate([xrail_position,yrail_position,rail_height]) {
            y_car();
	    translate([inter_raildistance/2,bearinglength/2+15/2,0]) rotate([0,0,90]) railbearing();
	    translate([-inter_raildistance/2,bearinglength/2+15/2,0]) rotate([0,0,90]) railbearing();
	    translate([inter_raildistance/2,-bearinglength/2-15/2,0]) rotate([0,0,90]) railbearing();
	    translate([-inter_raildistance/2,-bearinglength/2-15/2,0]) rotate([0,0,90]) railbearing();
        }
};
