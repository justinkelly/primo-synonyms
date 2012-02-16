Extended synonymn files for ExLibris Primo
=========
### What

  * Extend the default Primo synonym files
  * Adds the ability to include reformatted course codes
  * Provides a way to add your own custom synonyms
  * Create a community repository of synonym files (non-English and specific purpose files)
 
Given that ExLibris produces pretty good English, German, Korean and Chinese synonym files we don't intend to create 1 big extra file for these languages
but rather create a community repository where you can see what other institutes have done, modify them and upload your own specific files and to enable you to create your own institution specific files

And also create synonym files for languages that ExLibris currently don't cater for.

### Why 

  * I needed a way to get thousands of our course code ie. HAH219 into Primo in the way that people search for them 'HAH 219'
  * I needed to boost/add/modify to the standard synonyms

### How to run
    ./merge_primo_synonyms.pl

You will then be asked 

    Which version of Primo you are using?

Choose one that corresponds to an available sub-folder ie. 3.1.2

Then it will ask if you want to reformat your course codes - if you have any

    Do you want to include course codes? (y/n)

If you enter 'y' to this question, you'll be asked for the file name

    What is the name of your course codes file ie. course_codes.txt?
    
Then you'll be prompted for a output file name

    Please enter a file name for the new synonyms file, default is userSynonyms

This will now convert the contents of the $course_codes_file into Primo synonyms file formatting and reformat the codes to hwo students search for them ie. HAH101 becomes HAH 101

Copy the newly producted $version/$output_file_name to the Primo misspelling directory at ng/jaguar/home/profile/analysis/sysnonyms/userSynonyms

### Course codes

Our course codes look similar to the below example - We have about 10 different formats and it you review the primo search logs you will see how the students search for cource material using different formats
ie. for course EXT003 they will search EXT 003

This script reformats the non-spaces codes into the spacing format that students search on and adds them to the userSynonyms file

    EXT003
    EXT004
    EXT005
    EXT006
    EXT007
    EXT008
    G0046CE01
    G0046CE02
    G0046CE03
    G0046CE04
    G0046TD019
    G0046TD020
    G0046TD021
    G0046TD022
    G0046TD22P
    HAA101N
    HAA102N
    HAA103N
    HAA119
    HAA184T
    HAA185T
    HAA201N

### Adding new synonyms

You can add new misspellings into the custom_synonyms.txt file in the Primo format - such as

    counselor = counsellor (very high)

Where the incorrect spelling is the first word followed by a space then the correct spelling
Followed by the ranking brackets
- Refer the Primo Techinlca Guide for more info on ranking synonyms etc..

### Adding your course codes

You can your course codes into the course_codes.txt file in a non-spaced format - such as

    G0046TD022
    G0046TD22P
    HAA101N


### Extending to other versions of Primo

If you want to create a synonyms file for a version of Primo not listed just create a subfolder with the version number ie 3.1.0

Add/Edit the custom_synonymns.txt file if you wish

Then run the ./merge_primo_synonymms.pl and upload the new file
