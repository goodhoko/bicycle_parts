module spacer(angle, bolt_diameter=5, render_text=true) {
    // Do not expose these as the design is not (yet) ready for different values.
    height = 20;
    thickness = 10;
    mount_diameter = 10;

    // Rotate the whole spacer half the angle to align the base with XY plane.
    rotate([angle / 2, 0, 0]) {
        difference(){
            union() {
                cylinder(d=mount_diameter, h=height + 1);
                translate([-5, 0, -1]) {
                    cube(size=[mount_diameter, thickness + 1, height + 1]);
                }
            }
            rotate([-angle, 0, 0]) {
                translate([0, thickness, -2.5]) {
                    cylinder(d=mount_diameter, h=height + 5);
                }
                translate([-6, thickness - 2, -1]) {
                    cube(size=[mount_diameter + 2, 10, height + 2]);
                }
                // Move the hole slightly higher to give bigger support for the shifter.
                // Shifters usually have the hole moved slightly upwards.
                translate([0, 0,  height / 2 + 1]) {
                    // Make the hole perpendicular to the shifter support.
                    // The bolt angle is meant to be evened out by conical washers under the bolt head.
                    rotate([90, 0, 0]) {
                        cylinder(d=bolt_diameter, h=thickness + 10, center=true);
                    }
                }
            }
            // Rotate top and bottom constrains for half the angle
            // to make oposing corners symetric.
            rotate([-angle / 2, 0, 0]) {
                if (render_text) {
                    translate([-1.5, 0, height - 0.5]) {
                        linear_extrude(1){
                            text(str(angle), 3);
                        }
                    }
                }
                translate([-(mount_diameter + 2) / 2, -(thickness + 8) / 2, height]) {
                    cube(size=[mount_diameter + 2, thickness + 10, 5]);
                }
                translate([-(mount_diameter + 2) / 2, -(thickness + 8) / 2, -5]) {
                    cube(size=[mount_diameter + 2, thickness + 10, 5]);
                }
            }
        }
    }
}