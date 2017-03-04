raillength=500;
yraildistance=60;
xraildistance=550;

xcarriage_pos = 100;
ycarriage_pos = 150;

axis_d=8;
bearing_d=15;
bearing_l=24;

module railbearing() {
color("white") {
	rotate([0,90,0]) {
	 difference() {
		 cylinder(d=bearing_d, h=bearing_l);
		 cylinder(d=axis_d,h=bearing_l+1);
	}}
}}

module rail1(length) {
color("green") {
	rotate([0,90,0]) cylinder(d=axis_d, h=length);
}}
module rail2(length) {
color("green") {
	rotate([-90,0,0]) cylinder(d=axis_d, h=length);
}}

module ycarriage() {
color("red") {
	difference() {
		cube([80,80,25],center=true);
		union() {
			translate([yraildistance/2,0,0]) rotate([90,0,0]) cylinder(d=15,h=81,center=true);
			translate([-yraildistance/2,0,0]) rotate([90,0,0]) cylinder(d=15,h=81,center=true);
			rotate([0,0,90]) cylinder(d=25,h=90,center=true);//Center hole
			translate([0,80/2,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true);//Block hole
			translate([0,-80/2,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true);//Block hole
		}
	}
}
translate([yraildistance/2,-80/2,0]) rotate([0,0,90]) railbearing();
translate([-yraildistance/2,-80/2,0]) rotate([0,0,90]) railbearing();
translate([yraildistance/2,80/2-24,0]) rotate([0,0,90]) railbearing();
translate([-yraildistance/2,80/2-24,0]) rotate([0,0,90]) railbearing();
}

module xcarriage() {
color("red") {
minkowski()
{
  cube([10,10,1]);
  cylinder(r=2,h=1);
}
difference() {
	union() {
		minkowski() {
			cube([80,19,19],center=true); //axis interface
			rotate([0,90,0]) cylinder(r=3,h=1,center=true);
		}
		translate([0,25,0]) cube([80,50,25],center=true); // rail interface
	};
	union() {
		rotate([0,90,0]) cylinder(d=15,h=90,center=true); //Axis + bearings
		translate([0,50,0]) rotate([0,0,90]) cylinder(d=25,h=90,center=true); // Block hole
	};
};
}
translate([80/2-24,0,0]) railbearing();
translate([-80/2,0,0]) railbearing();
}

//FIXME the later
module rholder() {
color("red",0.4) {
translate([0,0,50]) cube([50,50,100],center=true);
}
}
module fholder() {
color("blue",0.4) {
translate([0,0,50]) cube([50,50,100],center=true);
}
}
module motormountx() {
color("red",0.4) {
translate([0,0,42/2]) cube([42,42,42],center=true);
}
}
module motormounty() {
color("red",0.4) {
translate([0,0,42/2]) cube([42,42,42],center=true);
}
}

module table() {
color("yellow") {
translate([-50,-50,-15]) cube([600,650,15]);
}
}


translate([0,0,50]) {
	translate([0,xraildistance,0]) rail1(raillength);
	rail1(raillength);

	translate([xcarriage_pos+ yraildistance/2,0,0]) {
		xcarriage();
		translate([0,xraildistance,0]) mirror([0,1,0]) xcarriage();
	}

	translate([xcarriage_pos,(xraildistance-raillength)/2,0]) {
		rail2(raillength);
		translate([yraildistance,0,0]) rail2(raillength);
		translate([yraildistance/2,ycarriage_pos,0]) ycarriage();
	}
}

// rail + block Holders - on 4 angles of the table
translate([raillength,xraildistance,0]) mirror([0,1,0]) rholder();
translate([0,xraildistance,0]) mirror([0,1,0]) fholder();
translate([raillength,0,0]) rholder();
fholder();
// motor mounts
translate([0,xraildistance/2,0]) motormountx();
translate([raillength,xraildistance/2,0]) motormounty();

table();
