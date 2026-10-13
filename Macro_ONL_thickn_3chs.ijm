//preliminary settings: 
//1) put all .oir files in one folder (dir)
//2) create a result folder (TotResults)
//warning!!!all files and folders should have 3 channels acquisition and NO spaces in their name, you must use ONLY underscores. 
//warning!!!all images should be acquire consistenltly with the same number of channels, pixels density and stack. 
dir=getDirectory("Choose a Directory"); 
TotResults=getDirectory("Choose the folder of Results"); 
list = getFileList(dir);
list = Array.sort(list);

	for (i = 0; i < list.length; i++) {
			run("Bio-Formats", "open=" + dir + list[i] + " autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT use_virtual_stack");
			imageTitle=getTitle();
			//run("Set Scale...", "distance=172.16 known=180 unit=micron"); it is not working-scale for 40x Confocal images
			run("Split Channels");
			//selectWindow("C4-"+ imageTitle);
			//run("Close");			
			selectWindow("C3-"+ imageTitle);
			run("Close");
			selectWindow("C2-"+ imageTitle);
			run("Close");
			//selectWindow("C1-"+ imageTitle);
			imageTitle3=getTitle();
			selectWindow(imageTitle3);
			run("Z Project...", "start=5 stop=15 projection=[Max Intensity]");
			imageTitle4=getTitle();
			selectWindow(imageTitle3);
			run("Close");
			selectWindow(imageTitle4);
			run("Maximize");
			makePoint(200, 414, "small yellow hybrid");
			run("To Selection");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			//run("In [+]");
			//run("In [+]");
			setTool("line");
			run("Set Scale...", "distance=172.16 known=180 unit=micron");//scale for 40x Confocal images
			waitForUser("measure the ONL in correspondance to the point");
			run("Measure");
			run("Flatten");
			imageTitle5=getTitle();
			selectWindow(imageTitle4);
			run("Close");
			selectWindow(imageTitle5);
			rename(imageTitle4);
			makePoint(400, 414, "small yellow hybrid");
			run("To Selection");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Set Scale...", "distance=172.16 known=180 unit=micron");//scale for 40x Confocal images
			waitForUser("measure the ONL in correspondance to the point");
			run("Measure");
			run("Flatten");
			imageTitle5=getTitle();
			selectWindow(imageTitle4);
			run("Close");
			selectWindow(imageTitle5);
			rename(imageTitle4);
			makePoint(600, 414, "small yellow hybrid");
			run("To Selection");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Set Scale...", "distance=172.16 known=180 unit=micron");//scale for 40x Confocal images
			waitForUser("measure the ONL in correspondance to the point");
			run("Measure");
			run("Flatten");
			imageTitle5=getTitle();
			selectWindow(imageTitle4);
			run("Close");
			selectWindow(imageTitle5);
			rename(imageTitle4);
			makePoint(800, 414, "small yellow hybrid");
			run("To Selection");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Out [-]");
			run("Set Scale...", "distance=172.16 known=180 unit=micron");//scale for 40x Confocal images
			waitForUser("measure the ONL in correspondance to the point");
			run("Measure");
			run("Flatten");
			imageTitle5=getTitle();
			selectWindow(imageTitle4);
			run("Close");
			selectWindow(imageTitle5);
			rename(imageTitle4);
			Title = substring(imageTitle4, 0, lastIndexOf(imageTitle4, "."));
			selectWindow(imageTitle4);
			saveAs("tiff", TotResults + "measured_retina "+ Title + ".tif");
			run("Close"); 
			selectWindow( "Results");
			saveAs("Results", TotResults + Title + "tot_meas.csv");
			D=getBoolean("Do you want to measure another area?");
			if (D == false) {
       				setKeyDown("none");
					//selectWindow("Results");       			
					//saveAs("Results", TotResults + Title + ".csv");
					//run("Close");
       				listc= getList("window.titles"); 
    				for (g=0; g<listc.length; g++){ // it's the only way to close those bloody Metadata!!!!
     					winame = listc[g]; 
     					selectWindow(winame); 
     					run("Close"); 
     					run("Close All"); 
     				} 
				break;
   		 	}
  		  	if (D == true){
  		   	}
		}
