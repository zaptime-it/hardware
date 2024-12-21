frontWidth = 223.7;    // mm
frontHeight = 85.3;    // mm
regularScrewSize = 3; // mm -> M3

thickness = 1.5; // mm
cornerRadius = 2; // mm
screenradius = 3; // mm  

// Visible screen size
screenHeight = 23.71; // mm
screenWidth = 48.55;  // mm

module __Customizer_Limit__ () {}  

screwOpeningWidthHeight = regularScrewSize + 0.1; // mm

leftScrewX = 6.44;
rightScrewX = 217.3;
topScrewY = 6.44;
bottomScrewY = 78.844;

$fn = 50;

difference()
{
    translate([ cornerRadius, cornerRadius, 0 ])
    minkowski() {
        cube([frontWidth - cornerRadius*2, frontHeight - cornerRadius*2, thickness], center = false);  // Subtract 2*radius from both width and height
        cylinder(r = cornerRadius, h = thickness);  // 2mm radius, 1mm height
    }

    // Outer screws
    for (xcoords = [leftScrewX, rightScrewX])
    {
        for (ycoords = [topScrewY, bottomScrewY])
        {
            color("white") translate([ xcoords, ycoords, -0.1 ]) cylinder(r = screwOpeningWidthHeight / 2, h = thickness+1.7);
        }
    }

    // Screens
    for (i = [0:6])
    {
        translate([ 
            i * (screenHeight + 7.21625) + 7.21625 + screenradius,  // First gap as margin, then screen+gap for each iteration
            (frontHeight - screenWidth) / 2 + screenradius,  // Center vertically
            -0.1 
        ]) 
        minkowski() {
            cube([ screenHeight - screenradius*2, screenWidth - screenradius*2, thickness+1.6 ], center = false);
            cylinder(r = screenradius, h = thickness+1.6);
        }
    }
}