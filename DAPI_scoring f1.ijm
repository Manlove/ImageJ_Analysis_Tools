// DAPI_scoring
// Logan Manlove
// 4-21-2017
//
// Takes an input file with three channels and allows user to analyze dapi numbers along with multichannel co-localization


macro "DAPI_scoring [f1]" {

	// Retrieves the file directory and name. Replaces c1 with c3 in the name.
	a = File.directory
	b = File.name
	c = replace(b, "c1", "c3")
	rename("c1")

	// Thresholds and analyzes the dapi objects.
	run("8-bit");
	run("Threshold...");
	waitForUser("Set Threshold then press 'OK'.");
	run("Convert to Mask");
	run("Watershed");
	waitForUser("Remove Noise and Press 'OK'.");
	run("Analyze Particles...", "size=100-Infinity clear summarize");

	// Opens up the second image with channel c3 and allows the user to threshold
	open(a+c)
	rename("c2")
	run("Threshold...");
	waitForUser("Set Threshold then press 'OK'.");
	run("Convert to Mask");

	// Reopens the c3 image
	open(a+c)
	rename("c3")
	selectWindow("Threshold");
	run("Close");

	// Merges the dapi image, the thresholded c3 image and the raw c3 image
	run("Merge Channels...", "c1=c2 c3=c1 c4=c3 create");

}
