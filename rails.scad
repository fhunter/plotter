include <constants.scad>;

module table() {
    color("cyan")
        translate([xraillength/2,yraillength/2,6])
            cube([xraillength,yraillength,12], center=true);
}

module xrail() {
    color("blue")
        rotate([0,90,0])
            cylinder(r=raildiameter/2,h=xraillength,center=false);
}

module yrail() {
    color("blue")
        translate([0,yraillength,0])
           rotate([90,0,0])
                cylinder(r=raildiameter/2,h=yraillength,center=false);
}

module xrails() {
    translate([0,0,rail_height]) xrail();
    translate([0,yraillength,rail_height]) xrail();
}

module yrails() {
    translate([xrail_position-inter_raildistance/2,0,rail_height]) yrail();
    translate([xrail_position+inter_raildistance/2,0,rail_height]) yrail();
}
