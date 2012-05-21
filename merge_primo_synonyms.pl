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

print "Do you want to include course codes? (y/n) :: ";
$course_codes = <>;
$course_codes = trim($course_codes);


print "Please enter a file name of your custom synonyms file, default is english_userSynonyms.txt";
$custom_file = <>;
$custom_file = trim($custom_file);
if($customer_file eq '')
{
    $custom_file = 'english_userSynonyms.txt';
}

$output_file = 'userSynonyms';


#################################################
#Merge the contents of the custom misspell file #
#################################################
open (CUSTOM, "$custom_file");
open (OUTPUT_CUSTOM, '>',"$output_file");

while (<CUSTOM>) {
	chomp;
	print OUTPUT_CUSTOM "$_\n";
}

close(CUSTOM);
close(OUTPUT_CUSTOM);


##############################
# Sort the new misspell file #
##############################

open (NAMES_FILE, '<', "$output_file")  or  die "Failed to read file : $! ";
my @not_sorted = <NAMES_FILE>;  # read entire file in the array
close (NAMES_FILE);
@sorted = sort { lc($a) cmp lc($b) } @not_sorted ;


open(FILE, '>',"$output_file" ) || die "unable to open file write <$!>";
  
  foreach(@sorted) {
    print FILE "$_";
  }
  
close(FILE);

print "Your new synonyms file has been saved to $output_file"
