include <carriage_x.scad>
include <carriage_y.scad>
include <rails.scad>
include <stands.scad>
include <motor_mount.scad>
include <misc.scad>

module plotter() {
    table();
    xrails();
    x_carriage();
    y_carriage();
    yrails();
    mount_x();
    mount_y();
    corner_holders();
}

$fn=100;

plotter();
