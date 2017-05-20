// Author: Charlie Snyder
// Twitter Handle: @mjrsnyder

$fn=30;
depth=25;


module bracket_side(wall_width, base_thickness, bracket_length, bracket_height) {
    screw_size=5; 
    rotate(a=[90,0,0]){
        difference(){
            linear_extrude(height=wall_width) {
                polygon(points=[[0,0],[bracket_length-wall_width,0],[0,bracket_height-base_thickness]]);
            }
            translate([7.5,7.5]){
                cylinder(h=wall_width, d=screw_size);
            }
        }
    }
    
}


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


module fan_bracket(depth) {

    wall_width=4;
    base_thickness=5;
    bracket_length=30;
    bracket_height=30;
    screw_mount_width=15;
    screw_mount_depth=10;
    screw_size=5;
    
    //base
    cube([bracket_length,depth+(wall_width*2),base_thickness]);
   
    // back
    cube([wall_width,depth+(wall_width*2),bracket_height]);

    
    // sides
    translate([wall_width,wall_width,base_thickness]){
        bracket_side(wall_width, base_thickness, bracket_length, bracket_height);
    }

    translate([wall_width,depth+(wall_width*2),base_thickness]){
        bracket_side(wall_width, base_thickness, bracket_length, bracket_height);
    }
    
    // screw mounts
    rotate(a=[0,90,0]){
        translate([0,(depth+(wall_width*2))/2-(screw_mount_width)/2,0]){
            screw_mount(screw_size, wall_width, screw_mount_width, screw_mount_depth);
        }
    }
}


fan_bracket(depth);
