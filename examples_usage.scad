$fs = 0.1;
$fa = 0.1;

use <front_shifter_spacer.scad>

for (i=[0:4]) {
    translate([13 * i, 0, 0]) {
        spacer(i * 2);
    }
}
