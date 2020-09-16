module spacer(angle) {
    rotate([angle / 2, 0, 0]) {
        difference(){
            union() {
                cylinder(d=10, h=21);
                translate([-5, 0, -1]) {
                    cube(size=[10, 11, 22]);
                }
            }
            rotate([-angle, 0, 0]) {
                translate([0, 10, -1]) {
                    cylinder(d=10, h=22);
                }
                translate([-6, 8, -1]) {
                    cube(size=[12, 5, 22]);
                }
                translate([0, 0,  11]) {
                    rotate([90, 0, 0]) {
                        cylinder(d=5, h=20, center=true);
                    }
                }
            }
            rotate([-angle / 2, 0, 0]) {
                translate([-1.5, 0, 20 - 0.4]) {
                    linear_extrude(0.5){
                        text(str(angle), 3);
                    }
                }
                translate([-6, -10, 20]) {
                    cube(size=[12, 22, 5]);
                }
                translate([-6, -10, -5]) {
                    cube(size=[12, 22, 5]);
                }
            }
        }
    }
}
