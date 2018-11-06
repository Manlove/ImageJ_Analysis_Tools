// Analyze_Alveoli
// Logan Manlove
// 3-17-2014
//
// ImageJ macro built to help analyze airway alveoli count and average size


makeLine(996, 840, 1600, 840);
run("Set Scale...", "distance=604 known=11.4 pixel=1 unit=uM");
run("8-bit");
setAutoThreshold("Default");
//run("Threshold...");
setThreshold(0, 254);
setOption("BlackBackground", false);
run("Convert to Mask");
setThreshold(0, 0);
run("Convert to Mask");
run("Analyze Particles...", "size=2500-Infinity pixel circularity=0.05-1.00 show=Masks exclude summarize");
