backWidth = 223.7;    // mm
backHeight = 85.3;    // mm

regularScrewSize = 3; // mm -> M3
buttonCapSize = 12; // mm

isRevB = true;

thickness = 1.5;


cornerRadius = 2;
usbOpeningCornerRadius = 2;

module __Customizer_Limit__ () {}  

usbOpeningWidth = 20;  // mm
usbOpeningHeight = 10; // mm

usbOpeningX = 136.116;
usbOpeningY = 45.542;

buttonOpeningWidthHeight = buttonCapSize + 0.9; // mm
screwOpeningWidthHeight = regularScrewSize + 0.1; // mm

bootBtnX = 76.29;
bootBtnY = 36.3;

resetBtnX = 57.875;
resetBtnY = 36.3;

actionBtnX = 211.481;
actionBtn1Y = 18.77;
actionBtn2Y = 32.105;
actionBtn3Y = 45.441;
actionBtn4Y = 58.776;

leftScrewX = 6.44;
rightScrewX = 217.3;
topScrewY = 6.44;
bottomScrewY = 78.844;

// Rev. A
midScrewLeftX = 99.696;
midScrewRightX = 123.870;

// Rev. B
midTopScrewLeftX = 92.8;
midTopScrewRightX = 130.9;
midTopScrewsY = topScrewY;
midBottomScrewsY = 72.495;

$fn = 50;

translate([ 0, backHeight, 0 ])
mirror([ 0, 1, 0 ])
difference()
{
    translate([ cornerRadius, cornerRadius, 0 ])
    minkowski() {
        cube([backWidth - cornerRadius*2, backHeight - cornerRadius*2, thickness], center = false);  // Subtract 2*radius from both width and height
        cylinder(r = cornerRadius, h = thickness);  // 2mm radius, 1mm height
    }

    // reset/boot button
    color("white") translate([ resetBtnX, resetBtnY, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);

    if (isRevB) {
        color("white") translate([ bootBtnX, bootBtnY, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);
    }

    // action buttons
    color("white") translate([ actionBtnX, actionBtn1Y, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);

    color("white") translate([ actionBtnX, actionBtn2Y, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);

    color("white") translate([ actionBtnX, actionBtn3Y, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);

    color("white") translate([ actionBtnX, actionBtn4Y, 0 ]) cylinder(r = buttonOpeningWidthHeight / 2, h = thickness+1.6);

    // Outer screws
    for (xcoords = [leftScrewX, rightScrewX])
    {
        for (ycoords = [topScrewY, bottomScrewY])
        {
            color("white") translate([ xcoords, ycoords, 0 ]) cylinder(r = screwOpeningWidthHeight / 2, h = thickness+1.6);
        }
    }

    // Middle screws
    if (isRevB) {
    for (xcoords = [midTopScrewLeftX, midTopScrewRightX])
    {
        for (ycoords = [midTopScrewsY, midBottomScrewsY])
        {
                color("white") translate([ xcoords, ycoords, 0 ]) cylinder(r = screwOpeningWidthHeight / 2, h = thickness+1.6);
            }
        }
    } else {
        for (xcoords = [midScrewLeftX, midScrewRightX])
        {
            for (ycoords = [topScrewY, bottomScrewY])
            {
                color("white") translate([ xcoords, ycoords, 0 ]) cylinder(r = screwOpeningWidthHeight / 2, h = thickness+1.6);
            }
        }
    }

    // USB opening
    translate([ usbOpeningX, usbOpeningY, 0 ])
    minkowski() {
        color("white")  cube([usbOpeningWidth-usbOpeningCornerRadius*2, usbOpeningHeight-usbOpeningCornerRadius*2, thickness+1.6], center = true);
        cylinder(r = usbOpeningCornerRadius, h = thickness+1.6);
    }
}


