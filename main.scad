//an openscad script to make a stamp with linear extruded text

//stamp dimensions
border = 3;
width = 20;
height = 20;
depth = 5;


//which style you want to do "text" for text and "pattern" for pattern
//style = "text";
//style = "pattern";
style = "pattern";

depth_stamp = 3;
text = "test1";
font = "Arial";
//text="N";
//font = "Webdings";

//pattern variables
//svg worked better than dxf for me
//put the file in the same directory
pattern = "heart.svg";


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

if(style == "pattern"){
    //add the text
    translate([0,0,depth]){
        linear_extrude(depth_stamp){
            import(pattern);
        }
    }
}