#!/usr/bin/perl

#
# Author: Alex Holehouse (alex@holehouse.org)
# 
# Description: This fairly simple perl script takes any of the commonly
#	       used compression formats and uncompresses them in a standard
#              way, without needing to faff around with options for the various
#              programs available.

# Usage: unpack [FILE]

# uncomment for debugging purposes
# use warnings;

# Initializing some key variables
$full_extension = "";
$out = 1;
$twofinal = "";
$pos = 0;

# (1) quit unless we have a single argumnet
$num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "ERROR! Usage: unpack [compressed_file]\nTry --help for more info\n";
    exit;
}

$input = $ARGV[0];

# if --help or -h requested
if (lc($input) eq "--help" || lc($input) eq "-h"){
    print "usage: unpack [FILE]\n";
    print "Automatically unpack and decompress common filetypes in one easy command\n\n";
    print "Currently supports the following filetypes:\n.zip\n.tar.gz\ntar.bz2\n.gz\n.bz2\n.7z\n.rar\n.Z\n.tgz\n\n";
    print "Report bugs and future requests to alex\@holehouse.org\n";
    exit;
}

print "\nUnpacking $input...\n\n";

# check if there's a "." in the input filename
$_ = $input;
# Loop which splits the extenions into an array for later use if need be
while (/\./){

    # get final .<something> from default input
    $extension = (m/([^.]+)$/)[0];
        
    $extensions_array[$pos] = $extension;
    $pos = $pos + 1;

    $_ = substr($_, 0, ((length() - length($extension))-1));
    $full_extension = ($full_extension . '.' . $extension);
}

# uncomment for debugging purposes
# print "full extension is $full_extension\n";

# two-terminal extension

# get the two terminal file extensions if present


if ($pos > 1){
	  $twofinal = $extensions_array[1] . "." . $extensions_array[0];
}


# ====================================================================
# ====================================================================
#               Supported file type in if elsif statements below
#     
# For future upgrades, just add another elsif clause with appropriate
# syntax.
# 
# ====================================================================
# ====================================================================

# zip file 
# ---------------------------------------------------------------------
# .zip will always be the last thing
if (lc($extensions_array[0]) eq "zip"){
    $out = system "unzip \"$input\"";
}

# tar.gz file
# ---------------------------------------------------------------------
elsif (lc($twofinal) eq "tar.gz"){
    $out = system "tar -xvzf \"$input\"";
}

# tar.bz2 file
# ---------------------------------------------------------------------
elsif (lc($twofinal) eq "tar.bz2"){
    $out = system "tar -jxvf \"$input\"";
}

# .gz alone file
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "gz"){
    $output = substr($input, 0, (length($input)-3));
    $out = system "gzip -c -d \"$input\" > $output";
}

# .bz2 alone file
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "bz2"){
    $output = substr($input, 0, (length($input)-4));
    $out = system "bunzip2 -c -d \"$input\" > $output";
}

# .7z file needs [p7zip]
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "7z"){
    $out = system "7za e \"$input\"";
}

# .rar file [needs unrar]
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "rar"){
    print "--------------------------------------------------\n";
    print "             .rar unpacking message\n";
    print "--------------------------------------------------\n";
    print "This unpacks to the current directory.\nIf this is a problem, please CTRL-C, create a new\ndirectory, move the archive into it and unpack in\nthere. You have been warned :-)\n";
    print "--------------------------------------------------\n";
    pressEnter();
    $out = system "unrar e \"$input\"";
}

# .Z
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "z"){
    $output = substr($input, 0, (length($input)-2));
    $out = system "uncompress -c -d \"$input\" > $output";
}

# .tgz
# ---------------------------------------------------------------------
elsif (lc($extensions_array[0]) eq "tgz"){
  
    $out = system "gunzip -c \"$input\"| tar -xvf - ";
}


else {
    print "\nError - Unknown file extension...\n"
} 

if ($out != 0){
    print "ERROR - something went wrong during the decompression....\n";
}
else{
    print "File succesfully unpacked!\n"; 
    
}
    
    
# minor subroutine to trigger "enter" from the user
sub pressEnter
{
	print "Press Enter to Continue...\n";
	$ignore = <STDIN>;
}




