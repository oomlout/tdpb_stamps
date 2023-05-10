//an openscad script to make a stamp with linear extruded text

//stamp dimensions
border = 3;
width = 30;
height = 20;
depth = 5;


//which style you want to do "text" for text and "pattern" for pattern
//style = "text";
//style = "text_stepped";
//style = "pattern";
//style = "pattern_stepped";
style = "pattern_stepped";

depth_stamp = 3;
text = "test1";
font = "Arial";
//text="N";
//font = "Webdings";

//pattern variables
//svg worked better than dxf for me
//put the file in the same directory
pattern = "heart.svg";

//patterned stamp variables
//steps = 1000;
steps = 100;
offset_amount_total = 1;

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

if(style == "text_stepped"){    
    step_height = depth_stamp / steps;    
    offset_amount = offset_amount_total / steps;
    for( i = [0:steps-1]){
        translate([0,0,step_height*i]){
            translate([0,0,depth]){
                linear_extrude(step_height){
                    //offset(r=offset_amount*(steps-i)){
                    offset(delta=offset_amount*(steps-i)){
                        text(text, font=font, size=10);
                    }
                }
            }
        }
    }
}

if(style == "pattern_stepped"){
    step_height = depth_stamp / steps;
    offset_amount = offset_amount_total / steps;
    for( i = [0:steps-1]){
        translate([0,0,step_height*i]){
            translate([0,0,depth]){
                linear_extrude(step_height){
                    //offset(r=offset_amount*(steps-i)){
                    offset(delta=offset_amount*(steps-i)){
                        import(pattern);
                    }
                }
            }
        }
    }
}