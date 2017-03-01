include <constants.scad>;

module y_car() {
    color("red") {
        cube([inter_raildistance+raildiameter*2,bearinglength*2+15,raildiameter*2],center=true);
    }
};

module y_carriage() {
        translate([xrail_position,yrail_position,rail_height]) {
            y_car();
        }
};
