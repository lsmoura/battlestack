/*
Battlestack - Backplate
Licence: CC-BY-NC-SA
Author: Sergio Moura
Original work by: Twogz
*/

backplate_width = 205.08;
backplate_depth = 67;
backplate_height = 13.8;

border_radius = 9.69;
m3_insert_radius = 4.5/2;
m3_insert_cone_radius = 3.5/2;
m3_insert_cone_height = 1;
m3_insert_height = 9;

m3_insert_distance_y = 3.4;

magnet_width = 10.2;
magnet_height = 3.2;
magnet_depth = 60.2;
magnet_spacing = 27;

$fn = 60;

m3_insert_border_distance = border_radius / 2;

difference() {
    union() {
        // round corners
        for (x = [-1:2:1]) {
            for (y = [-1:2:1]) {
                translate([
                    x * (backplate_width/2 - border_radius),
                    y * (backplate_depth/2 - border_radius),
                    0
                ])
                cylinder(
                    h = backplate_height,
                    r = border_radius,
                    center = true
                );    
            }
        }
        
        // middle body
        cube(
            [
                backplate_width - border_radius*2,
                backplate_depth - border_radius*2,
                backplate_height
            ], 
            center = true
        );
        
        // edges
        for (y = [-1:2:1]) {            
            translate([
                y * (backplate_width - border_radius)/2,
                0,
                0
            ])
            cube(
                [
                    border_radius,
                    backplate_depth - border_radius*2,
                    backplate_height
                ], 
                center = true
            );
            
            translate([0, y * (backplate_depth - border_radius)/2, 0])
            cube(
                [
                    backplate_width - border_radius*2,
                    border_radius,
                    backplate_height
                ], 
                center = true
            );
        }
    }
    // m3 insert holes
    for (x = [-1:2:1]) {
        for (y = [-1:2:1]) {
            translate([
                x * (backplate_width/2 - border_radius),
                y * (backplate_depth/2 - m3_insert_radius - m3_insert_distance_y),
                -backplate_height/2 + m3_insert_height/2 - 0.05
            ])
            union() {
                translate([
                    0,
                    0, 
                    (m3_insert_height + m3_insert_cone_height)/2
                ])
                cylinder(
                    h = m3_insert_cone_height,
                    r1 = m3_insert_radius,
                    r2 = m3_insert_cone_radius,
                    center = true
                );
                cylinder(
                    h = m3_insert_height,
                    r = m3_insert_radius,
                    center = true
                );
            }
        }
    }
    // magnet spaces
    for (x = [-4:1:3]) {
        #translate([
            magnet_spacing/2 + x * magnet_spacing, 
            0, 
            backplate_height/2-magnet_height/2-0.2*3
        ])
        cube([magnet_width, magnet_depth, magnet_height], center = true);
    }
}
