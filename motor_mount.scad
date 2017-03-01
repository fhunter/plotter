include <constants.scad>;

module mount1() {
    color("brown") {
        cube([50,50,80],center=true);
    };
};

module mount2() {
    color("yellow") {
        cube([50,50,80],center=true);
    };
};

module mount_y() {
    translate([0,yraillength/2,rail_height]) mount1();
};

module mount_x() {
    translate([xraillength,yraillength/2,rail_height]) mount2();
};

module corner_holders() {
    translate([0,0,rail_height]) mirror([0,0,0]) corner_holder();
    translate([xraillength,0,rail_height]) mirror([0,0,0]) corner_holder();
    translate([0,yraillength,rail_height]) mirror([0,1,0]) corner_holder();
    translate([xraillength,yraillength,rail_height]) mirror([0,1,0]) corner_holder();
}

module corner_holder() {
    color("green") {
        cube([50,50,80],center=true);
    };
};
