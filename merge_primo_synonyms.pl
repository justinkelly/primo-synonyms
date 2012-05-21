#!/usr/bin/perl -w

###############################################################################
# Reformat your list of course codes into Primo Synonym format                #
# ie. HAH101 gets split to be HAH 101                                         #
# This tries to format the course codes as students may enter them into Primo #
###############################################################################

# Declare the subroutines
sub trim($);

sub trim($)
{
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

print "What version of Primo are you using? :: ";
$primo_version = <>;
$primo_version = trim($primo_version);

print "Do you want to include course codes? (y/n) :: ";
$course_codes = <>;
$course_codes = trim($course_codes);


if($course_codes =~ m/^y/)
{ 
	print "What is the name of your course codes file ie. course_codes.txt? :: ";
	$course_codes_file = <>;
	$course_codes_file = trim($course_codes_file);
}


print "Please enter a file name for the new synonyms file, default is userSynonyms :: ";
$output_file = <>;
$output_file = trim($output_file);
if($output_file eq '')
{
    $output_file = 'userSynonyms';
}

#################################################
#Merge the contents of the custom misspell file #
#################################################
open (CUSTOM, "custom_synonyms.txt");
open (OUTPUT_CUSTOM, '>',"$primo_version/$output_file");

while (<CUSTOM>) {
	chomp;
	print OUTPUT_CUSTOM "$_\n";
}

close(CUSTOM);
close(OUTPUT_CUSTOM);


##############################
# Sort the new misspell file #
##############################

open (NAMES_FILE, '<', "$primo_version/$output_file")  or  die "Failed to read file : $! ";
my @not_sorted = <NAMES_FILE>;  # read entire file in the array
close (NAMES_FILE);
@sorted = sort { lc($a) cmp lc($b) } @not_sorted ;


open(FILE, '>',"$primo_version/$output_file" ) || die "unable to open file write <$!>";
  
  foreach(@sorted) {
    print FILE "$_";
  }
  
close(FILE);

print "Your new synonyms file has been saved to $primo_version/$output_file"
