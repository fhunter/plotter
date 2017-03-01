include <constants.scad>;

module x_car() {
    color("red") {
//        cube([bearinglength*2+15,raildiameter*2,raildiameter*2],center=true);
        cube([inter_raildistance+2*raildiameter,raildiameter*2,raildiameter*2],center=true);
        //translate([0,25/2+raildiameter,0]) cube([bearinglength*2+15,25,raildiameter*2],center=true);
        translate([0,25/2+raildiameter,0]) cube([inter_raildistance+2*raildiameter,25,raildiameter*2],center=true);
    }
};

module x_carriage() {
        translate([xrail_position,0,rail_height]) {
            x_car();
            translate([0,xraillength,0]) mirror([0,1,0]) x_car();
        }
};
