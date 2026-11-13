/*
Heavy-Duty Ergonomic Textbook Stand, prototype v0.1
Units: millimeters. Source: MIT license; see LICENSE.
Developed for a 260 x 260 x 260 mm build plate (Creality K2).

Export individual parts:
  openscad -o stl/side_frame.stl -D 'part="side"' cad/textbook_stand.scad
  openscad -o stl/shelf.stl -D 'part="shelf"' cad/textbook_stand.scad
  openscad -o stl/front_rail.stl -D 'part="front_rail"' cad/textbook_stand.scad
  openscad -o stl/rear_rail.stl -D 'part="rear_rail"' cad/textbook_stand.scad
  openscad -o stl/upper_rail.stl -D 'part="upper_rail"' cad/textbook_stand.scad
  openscad -o stl/page_arm_left.stl -D 'part="arm_left"' cad/textbook_stand.scad
  openscad -o stl/page_arm_right.stl -D 'part="arm_right"' cad/textbook_stand.scad

NOTE: This prototype is UNTESTED. The 8 lb loading is a test target,
not a certified capacity. Inspect prints and use safely during testing.
*/

part = "assembly";   // assembly, side, shelf, front_rail, rear_rail, upper_rail, arm_left, arm_right
$fn = 48;

// Frame geometry, all in the assembly's world coordinate system.
side_t = 12;
side_inner_gap = 198;
side_center_spacing = side_inner_gap + side_t; // center-to-center = 210
side_left_x = -side_center_spacing/2 - side_t/2; // -111, left outer face
side_right_x = side_center_spacing/2 - side_t/2; // +99, right inner face
frame_outer_width = side_inner_gap + 2*side_t; // 222

rail_length = 246; // projects 12 mm beyond outer frame on each side, still within K2
rail_end_pin_x = 117; // each end pin is outboard of the side plates
rail_pin_d = 4.6;
bolt_d = 4.5;  // nominal M4 clearance, tune for your printer
nut_af = 8.5; // M4 hex nut recess; prints vary
shelf_z = 30;

// Two-dimensional profile drawn in (depth y, height z), built lying flat.
module profile_outline() {
    union() {
        translate([6,0]) square([232,30]);
        // Upright, tilted ~19 degrees back from vertical.
        hull() {
            translate([102,39]) circle(r=13);
            translate([166,225]) circle(r=12);
        }
        // Rear kickstand forms the A-frame triangulation.
        hull() {
            translate([166,225]) circle(r=12);
            translate([215,27]) circle(r=12);
        }
        // Mid-height gusset to make the frame less flexible.
        hull() {
            translate([102,40]) circle(r=10);
            translate([213,26]) circle(r=10);
        }
        // Upper connecting boss with room for the cross-rail mortise.
        translate([161,184]) circle(r=25);
    }
}
module profile_with_mortises() {
    difference() {
        profile_outline();
        translate([79.7,9.7]) square([21.6,14.6]); // front lower rail
        translate([202.7,9.7]) square([22.6,14.6]); // rear lower rail
        translate([149.7,176.7]) square([22.6,14.6]); // upper rail
    }
}
// Single printable side. Local XY = YZ of assembled stand, local Z is thickness.
module side_frame_print() {
    difference() {
        linear_extrude(height=side_t) profile_with_mortises();
        // The print is in local XY. Mounting holes are drilled in assembled vertical z,
        // which is local Y. They are therefore lateral cylinders here.
        for (yy = [35,116]) {
            translate([yy, -0.1, side_t/2])
                rotate([-90,0,0]) cylinder(h=32, d=bolt_d);
            // recessed hex nut at the underside of assembled frame (local Y=0)
            translate([yy, -0.1, side_t/2])
                rotate([-90,0,0]) cylinder(h=4.2, d=nut_af, $fn=6);
        }
    }
}
// Place a printed side piece so local (u,v,w) maps to (x,y,z)=(w,u,v).
module side_assembled(xpos) {
    translate([xpos,0,0])
        multmatrix(m=[[0,0,1,0],[1,0,0,0],[0,1,0,0],[0,0,0,1]])
            side_frame_print();
}

// Shelf: lower page lip; mount from the top with M4 screws through the side frames.
// This is a continuous shelf to support the book's full bottom edge.
module shelf_print() {
    difference() {
        union() {
            translate([-frame_outer_width/2,6,0]) cube([frame_outer_width,120,9]);
            // Vertical front lip to prevent the spine or covers sliding forward.
            translate([-frame_outer_width/2,6,0]) cube([frame_outer_width,10,35]);
            // Reinforcement ribs. Printed from flat base, no supports.
            for (xx = [-95,0,95])
                translate([xx-4,17,9]) cube([8,106,5]);
            // Reinforced bosses for swiveling page-retainer arms.
            for (xx = [-86,86])
                translate([xx,11,0]) cylinder(h=35, r=10);
        }
        // Four shelf-to-frame bolt holes, drilled vertically.
        for (xx = [-side_center_spacing/2,side_center_spacing/2])
            for (yy=[35,116])
                translate([xx,yy,-0.1]) cylinder(d=bolt_d,h=16);
        // Pivot holes for page retainer arms (M4 bolts, friction adjustment).
        for (xx = [-86,86])
            translate([xx,11,-0.1]) cylinder(d=bolt_d,h=36);
    }
}

module rail_print(y_width, z_height) {
    difference() {
        // All rails print on the bed with length along X, no supports.
        translate([-rail_length/2,0,0]) cube([rail_length,y_width,z_height]);
        // M4 end-pins prevent the side panels from sliding off the rails.
        for (xx = [-rail_end_pin_x,rail_end_pin_x])
            translate([xx,y_width/2,-0.1]) cylinder(d=rail_pin_d,h=z_height+0.2);
    }
}

// Symmetrical but handed page retainers: rotate outward to turn pages.
// M4 pivot screws are adjustable, not spring-loaded.
module arm_print(left=true) {
    dir = left ? 1 : -1;
    difference() {
        union() {
            cylinder(h=6,r=10);
            // Page contact arm reaches inward, very low on page at z = 65..71.
            hull() {
                cylinder(h=6,r=8);
                translate([dir*54,14,0]) cylinder(h=6,r=7);
            }
            // Rounded thicker fingertip to catch the page's lower edge.
            translate([dir*54,14,0]) cylinder(h=8,r=7);
        }
        translate([0,0,-0.1]) cylinder(d=bolt_d,h=8.3);
    }
}

module assembly(show_mock_book=false) {
    color("#343F4A") {
        side_assembled(side_left_x);
        side_assembled(side_right_x);
    }
    color("#E6A949") {
        translate([0,0,shelf_z]) shelf_print();
        translate([0,80,10]) rail_print(21,14);
        translate([0,203,10]) rail_print(22,14);
        translate([0,150,177]) rail_print(22,14);
    }
    color("#347D91") {
        translate([-86,11,shelf_z+35]) arm_print(true);
        translate([86,11,shelf_z+35]) arm_print(false);
    }
    // Illustration-only approximate textbook, NOT exported with the printable parts.
    if(show_mock_book)
        color([0.25,0.30,0.62,0.25])
            translate([-105,48,39])
                rotate([-19,0,0]) cube([210,42,245]);
}

if(part=="assembly") assembly();
else if(part=="mockup") assembly(true);
else if(part=="side") side_frame_print();
else if(part=="shelf") shelf_print();
else if(part=="front_rail") rail_print(21,14);
else if(part=="rear_rail") rail_print(22,14);
else if(part=="upper_rail") rail_print(22,14);
else if(part=="arm_left") arm_print(true);
else if(part=="arm_right") arm_print(false);
else echo("Unknown part. Use assembly, side, shelf, front_rail, rear_rail, upper_rail, arm_left, or arm_right");
