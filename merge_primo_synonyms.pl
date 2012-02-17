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

###############################################################
#Reformat and merge the contents of the course_codes.txt file #
###############################################################
if($course_codes =~ m/^y/)
{ 

	open (OUTPUT_APPEND, '>>',"$primo_version/$output_file");

	$LOGFILE = $course_codes_file;

	open(LOGFILE) or die("Could not open the course code '$course_codes_file' file.");
	foreach $line (<LOGFILE>) {
	    $line = trim($line);

	    #if 2 letter, 1 numbers, 1 letter +
	    #ie. CH2A101 becomes CH2A 101
	    if( $line  =~ m/^[A-Z]{2}[0-9][A-Z]/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 5; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 5; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 2 letter, 3 numbers +
	    #ie. CH101 becomes CH 101
	    elsif( $line  =~ m/^[A-Z]{2}[0-9]{3}/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 2; 	
			print  OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 2; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 3 letters, then 1 number +
	    #ie. SCI101 becomes SCI 101
	    elsif( $line  =~ m/^[A-Z]{3}[0-9]/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 3; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 3; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 4 letters, then 1 number +
	    #ie. CHEM101 becomes CHEM 101
	    elsif( $line  =~ m/^[A-Z]{4}[0-9]/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 4; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 4; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 1 letters, 4 numbers, then letters +
	    #ie. C1201ABC becomes C1201 ABC
	    elsif( $line  =~ m/^[A-Z][0-9]{4}[A-Z]/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 5; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 5; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 5 letters, 3 numbers +
	    #ie. CHEMA101 becomes CHEMA 101
	    elsif( $line  =~ m/^[A-Z]{5}[0-9]{3}/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 5; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 5; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 6 letters, 3 numbers +
	    #ie. CHEMBC101 becomes CHEMBC 101
	    elsif( $line  =~ m/^[A-Z]{6}[0-9]{3}/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 6; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 6; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    #if 7 letters, 3 numbers +
	    #ie. CHEMSCI101 becomes CHEMSCI 101
	    elsif( $line  =~ m/^[A-Z]{7}[0-9]{3}/)  
		{
			print OUTPUT_APPEND substr $line ,0 , 7; 	
			print OUTPUT_APPEND " "; 	
			print OUTPUT_APPEND substr $line , 7; 	
			print OUTPUT_APPEND "  =  $line (high)\n";
		}
	    else {
		#print "\n No Match for :: $line \n";
		}
	}
	close(LOGFILE);
	close(OUTPUT_APPEND);
}


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
