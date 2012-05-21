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

print "Do you want to include the British English synonyms file? (y/n)";
$brit_english = <>;
$brit_english = trim($brit_english);


print "Please enter a file name of your custom synonyms file, default is custom_synonyms.txt";
$custom_file = <>;
$custom_file = trim($custom_file);
if($custom_file eq '')
{
    $custom_file = 'custom_synonyms.txt';
}

$output_file = 'userSynonyms';

#################################################
#Merge the contents of the custom misspell file #
#################################################
if($brit_english =~ m/^y/)
{ 
	open (BRIT, "english_userSynonyms.txt");
	open (OUTPUT, '>',"$output_file");

	while (<BRIT>) {
		chomp;
		print OUTPUT "$_\n";
	}

	close(BRIT);
	close(OUTPUT);
}

#################################################
#Merge the contents of the custom misspell file #
#################################################
open (CUSTOM, "$custom_file");
open (OUTPUT_CUSTOM, '>>', "$output_file");

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
  if( $_ !~ /^\s*$/ ) 
    {
   	 print FILE "$_";
    }
  }
  
close(FILE);

print "\n ####### \n Your new synonyms file has been saved to $output_file \n #######\n"
