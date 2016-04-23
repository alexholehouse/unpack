unpack
=============

A simple tool to make unpacking your compressed files simpler! 

NOTE - This is a tool for *nix (tested on Ubuntu but should work fine in most Linux distros as well as OSX) for
users who ruddy love the command line. If you don't understand most/all of this markdown file then
it's probably not for you :-)

Overview
--------
Super simple script which unifies your unpacking needs into a single command. Don't you
hate having to look up the combination of flags and inputs to unpack that file? Never fear,
simply input a compressed file into unpack, and an unpacked copy is created. The original
file isn't altered, so if it goes wrong your data is still safe.

Installation
-----------
There are a couple of ways you can make this work in a system-wide manner.

Quick guide - 

    ./install
   
And you're done!

NOTE: As of OSX El Capitan (10.11) no one (not even root!) can write to `/usr`. As a result, the default installation script will no longer work. However, to get around this just use the custom folder method, as detailed below.


### 1) Default installer

You could just run 
    ./install

What this does is it copies unpack in a runnable format into your /usr/bin directory. If an "unpack"
file already exists you'll be asked if you want to overwrite it. The /usr/bin directory is where your shell
will typically look for executable files. If this doesn't work (i.e. you get a `command not found: unpack` error 
then you may need to check your `$PATH` variable, which is discussed below).

### 2) Custom folder 
Alternatively, if you're like me you might have a folder somewhere where you keep all your custom
system-wide executables. To make a folder work like this, you need to add it's location to
the `$PATH` variable. The $PATH variable is a system wide variable which tells your shell where to look for executables.
To see it's current content you can type

    echo $PATH

Cool ah? You'll see `/usr/bin` is in there, which is why the default installer works.

With BASH, to add your own folder to this variable you need to do

    export PATH=$PATH:/full/location/of/custom/folder
   
If you run this in the terminal that's great, BUT it's only valid for that terminal, and for that session.
This isn't so helpul, so instead you can add the above line to your `.bashrc`. This means every time the BASH 
shell is invoked it will add this location to `$PATH`, meaning all the executables in your custom location 
will be good to go!

### 3) As a script

Of course, you can always just use it as a local script 

    unpack.pl [filename]

but that's less fun!

Removal
-------

If you used the default installer then run ./remove_unpack to remove it.

It's perl, so there's no compilation or anything like that. It's one file. "Removal" is literally a case of 
deleting that one file. As mentioned, the default installer copies the file to `usr/bin`.

Usage
-----

    unpack [file]


File types supported
--------------------

Never alters the original, compressed file, creating the standard copy depending on
how the file was originally compressed.

Currently supports

* .zip
* .tar.gz
* .tar.bz2
* .gz
* .bz2
* .7z
* .rar
* .Z
* .tgz

Contact
--------------------
Drop me a line at alex@holehouse.org if you want to shout at me, or request additional file format support. Adding support
is just another ifelse in the code!
