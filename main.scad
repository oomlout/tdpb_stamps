//an openscad script to make a stamp with linear extruded text

//stamp dimensions
border = 3;
width = 20;
height = 15;
depth = 10;


//style = "text";
//style = "dxf";
style = "text";

depth_stamp = 3;
text = "test";
font = "Arial";
text="N";
font = "Webdings";

//draw stamp
translate([-border,-border,0]){
    cube([width,height,depth]);
}

if(style == "text"){
    //add the text
    translate([0,0,depth]){
        linear_extrude(depth_stamp){
            text(text, font=font, size=10);
        }
    }
}

if(style == "dxf"){
    //add the text
    translate([0,0,depth]){
        linear_extrude(depth_stamp){
            import("heart.svg");
        }
    }
}