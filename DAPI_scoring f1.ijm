// DAPI_scoring
// Logan Manlove
// 4-21-2017
//
// Takes an input file with three channels and allows user to analyze dapi numbers along with multichannel colocalization


macro "DAPI_scoring [f1]" {

	a = File.directory
	b = File.name
	c = replace(b, "c1", "c3")
	rename("c1")

	run("8-bit");
	run("Threshold...");
	waitForUser("Set Threshold then press 'OK'.");
	run("Convert to Mask");
	run("Watershed");
	waitForUser("Remove Noise and Press 'OK'.");
	run("Analyze Particles...", "size=100-Infinity clear summarize");

	open(a+c)
	rename("c2")

	run("Threshold...");
	waitForUser("Set Threshold then press 'OK'.");
	run("Convert to Mask");

	open(a+c)
	rename("c3")

	selectWindow("Threshold");
	run("Close");

	run("Merge Channels...", "c1=c2 c3=c1 c4=c3 create");

}

