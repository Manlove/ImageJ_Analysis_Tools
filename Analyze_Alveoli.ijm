// Analyze_Alveoli
// Logan Manlove
// 3-17-2014
//
// ImageJ macro built to help analyze airway alveoli count and average size

macro "Analyze_Alveoli" {
	run("8-bit");
	run("Threshold...");

  setThreshold(0,254); //Sets a reasonable initial number for the threshold
	waitForUser("Threshold to Select for Alveoli Walls, then press 'Ok'");
  run("Convert to Mask"); //This line is here to catch mistakes where the user forgets to complete the thresholding
	selectWindow("Threshold");
	run("Close");

	// Image is inverted to allow the empty alveoli space to be measured.
	run("Invert");

	// User is asked to erode or dilate to correct connected alveoli.
  while (getBoolean("Erode?")) {;
		run("Erode");
	}
	while (getBoolean("Dilate?")) {
		run("Dilate");
	}

	// User is prompted to remove any additional noise such as airways for vessels.
	waitForUser("Remove any noise, then press 'Ok'");
	run("Analyze Particles...", "size=250-30000 pixel circularity=0.05-1.00 show=Masks exclude summarize");
}
