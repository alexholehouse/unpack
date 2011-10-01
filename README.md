unpack
=============

A simple tool to make unpacking your compressed files simpler!

Overview
--------
Super simple script which unifies your unpacking needs into a single command. Don't you
hate having to look up the combination of flags and inputs to unpack that file? Never fear,
simply input a compressed file into unpack, and an unpacked copy is created. The original
file isn't altered, so if it goes wrong your data is still safe.

To make it work from commandline anywhere, download, then add it's location to your 
$PATH variable, or add an alias to the script in .*rc. This [link](http://stackoverflow.com/questions/6637622/how-can-i-run-perl-script-from-anywhere-in-unix-environment) might help.
You will also need to 

    chmod +x unpack.pl
    mv unpack.pl unpack

To have an executable called unpack. You can, of course simply run it as 

    perl unpack.pl

It's a free country, after all.

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

Contact
--------------------
Drop me a line at alex@holehouse.org if you want to shout at me!
