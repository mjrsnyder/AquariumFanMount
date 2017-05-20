// Author: Charlie Snyder
// Twitter Handle: @mjrsnyder

$fn=30;

glass_thickness=5;

module screw_mount(screw_size, base_thickness, mount_width, mount_depth) {
    difference(){
        union(){
            cube([mount_depth,mount_width,base_thickness]);
            translate([mount_depth,mount_width/2,0]){
                cylinder(h=base_thickness, d=mount_width);
            }
        }
        translate([mount_depth,mount_width/2,0]){
            cylinder(h=base_thickness, d=screw_size);
        }
        
    }
}

module tank_clip(glass_thickness){
    back_thickness=5;
    height=20;
    width=20;
    screw_size=5;
    screw_base_thickness=5;
    screw_mount_width=(back_thickness*2)+glass_thickness;
    screw_mount_depth=15;
    linear_extrude(height=width){
        polygon(points=[
            [0,0],
            [back_thickness,0],
            [back_thickness,height],
            [back_thickness+glass_thickness,height],
            [back_thickness+glass_thickness,0],
            [(back_thickness*2)+glass_thickness,0],
            [(back_thickness*2)+glass_thickness,height+back_thickness],
            [0,height+back_thickness],
            [0,0]
        ]);
    }
    
    translate([screw_mount_width,screw_mount_width+(screw_size),0]){
        rotate(a=[0,0,90]){
            screw_mount(screw_size, screw_base_thickness, screw_mount_width, screw_mount_depth);
        }
    }
}




tank_clip(glass_thickness);