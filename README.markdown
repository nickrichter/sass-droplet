SASS Droplet
============

_This is an AppleScript droplet that you can use to automate your SASS workflow._



### Dependencies
**[Ruby](http://www.ruby-lang.org/)** - Ruby ships with Mac OS so that should not be a problem. Make sure it is up to date and functioning correctly. Installation of Ruby is beyond the scope of this document, but you can probably find some resources on the Ruby website. [Installing RubyGems](http://docs.rubygems.org/read/chapter/3) can make installing additional modules very simple. Give that a try.

[SASS](http://sass-lang.com/tutorial.html) - Sass is a meta-language on top of CSS that's used to describe the style of a document cleanly and structurally. It's a Ruby module so you'll need to make sure it's installed. The aforementioned RubyGems makes quick work of getting SASS running.



### Usage

There are two ways to "activate" this utility. One way is to simply double-click to launch, as you would do with any application. When starting in this way, the user will be presented with a file selection dialog box. Pick the CSS *or* SCSS file you wish to monitor and click select.

The other is to simply drag the file onto the droplet. Both will work, both will yield the same results



### How it works

First off, you don't actually *need* to pick a CSS or SCSS file. You can pick any file you want, it doesn't care. However, you'll want to be careful to pick only plain text files. Selecting binary data such as images or another application might cause things to freak out. I have no idea what the results will be, so play around with that at your own risk.

When you pick the file you want to monitor, the app grabs some info about the file to be used later (the path to the file, the name of the file, the file extension). First, it goes about setting up some initial variables, the boring stuff. Next it checks to see if there is an existing SCSS file. If no SCSS file exists, it checks to see if there is an existing CSS file. If yes, a new SCSS file is made based on the existing CSS file. If neither exists, a blank SCSS file is created.

Finally, a terminal window is open and the sass command is run.

So, about the whole "you don't actually *need* to pick a CSS or SCSS file" thing. That is true. Here's how it works:

Say you have a file /Users/youraccount/Documents/sample.txt, the app breaks that up into three pieces

* /Users/youraccount/Documents/
* sample
* .txt

Using those three pieces of information we can do a number of different things and remain consistent with locations and filenames. That's why the extension doesn't matter and you will always end up with correctly named sample.css and sample.scss. Nifty.

Keep in mind that running SASS is a __destructive__ process. That is to say, if both files exist, whatever is in sample.css will be wiped out and replaced by a version based off of sample.scss. Make sure you are careful which file you are making changes to.



### Installation

There is no installation per se, but this is just a plain text file of the source code, and not executable. Since AppleScript's .scpt files are compiled, binary, files they are difficult to perform diffs on, and keep track of with version control. There are a couple options to get a compiled version of the script. The first is to simply open AppleScript Editor and paste the source code into a new file. Another is to open Terminal and do the following:

1. `cd` to the directory where you want the compiled script to live
2. type `osacompile -o myscript.scpt /path/to/my/SASS-droplet.applescript` and hit return

The `-o` flag is the filename you want for the output. If the output is not specified, the default a.scpt will be used. It's also worthwhile to note, that *the output will be placed where the osacompile command is run from*. For example, if your present working directory is your user home directory, a.scpt will be put in your home directory even if SASS-droplet.applescript is on your desktop. That is why the `cd` in step 1 is important.



### Notes

__April 2014:__ Okay, I will concede that this script has pretty much been rendered obsolete by task runners like Grunt. I wrote this as an exercise back in 2012 before Grunt had really taken off so it was not yet on my radar. If you are trying to do some serious heavy-lifting, or complex processing, a task runner is a much better way to go. Plus, those things have been written by developers far more talented than me. However, if you just want to do one thing, compile a SASS file, and do it in a fairly dead-simple way, you may still find this useful.