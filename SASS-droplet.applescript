(*
 * SASS Droplet
 * Version: 1.0
 
 * https://github.com/nickrichter/sass-droplet
 *
 * Copyright 2012 Nick Richter
 * Released under the MIT license
 *
 * Date: 2014-04-13
 *)

on run
	-- Ask for a file
	set get_sass to choose file with prompt "Choose which file you want to watch with SASS. You can choose either a CSS or SCSS file."
	open {result}
end run

on open get_sass
	tell application "Finder"
		-- Get the name of the file
		set sass_file to (name of (info for get_sass))
		-- Get the file extension
		set sass_ext to (name extension of (info for get_sass))
		-- This line sets a length to be used later.
		-- It takes filename.ext and counts the total length
		-- It then subtracts the length of the extension (ex: "ext") and the period immediately prior
		set _length to (count of sass_file) - (count of sass_ext) - 1
		-- Rename the filename variable to strip off the extension
		set filename to text 1 thru _length of sass_file
		-- Change the path format from path:to:parent:directory to /path/to/parent/directory
		set sass_path to POSIX path of get_sass
		-- Strip the dropped file off the end of the file path
		set sass_path to text 1 thru ((count of sass_path) - (count of sass_file)) of sass_path
		
		if exists sass_path & filename & ".scss" as POSIX file then
			-- The .scss file exists so we are okay.
		else
			-- Check if there is an existing .css file. We don't want to overwrite that!
			if exists sass_path & filename & ".css" as POSIX file then
				-- Make a copy of the dropped file and rename it
				do shell script "cp " & sass_path & filename & ".css " & sass_path & filename & ".scss"
			else
				-- The .scss file does not exist, nor does a .css file, so go ahead and make one
				-- The source of the newly created .scss file will be the file that was dropped
				-- We don't have to worry about making the .css file since that will be taken care of when SASS runs
				do shell script "cp " & sass_path & filename & "." & sass_ext & " " & sass_path & filename & ".scss"
			end if
			
		end if
	end tell
	
	-- Open Terminal and run a couple commands
	tell application "Terminal"
		-- First, we want to change to the parent directory of the file we chose
		do script "cd " & sass_path in front window
		-- Next, we run SASS for the file provided
		do script "sass --watch --style compressed " & sass_path & filename & ".scss:" & sass_path & filename & ".css"
	end tell
end open