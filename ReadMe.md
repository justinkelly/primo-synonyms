Extended synonymn files for ExLibris Primo
=========
### What

  * Extend the default Primo synonym files to cover British English (en_GB, en_AU, en_NZ, en_CA, etc..)
  * Currently primo only 2 way synonym search for very common US/UK English words like 'color' and 'colour'
  * Meaning if you search for either colour or color you will see the same results
  * But
      * if you search for 'behaviour' it will NOT show resutls for 'behavior'
      * if you search for 'behavior' it will show resutls for 'behaviour'
  * This repository of UK/US synonymns means that your primo can now do 2 way sysnonym search for ish and specific purpose files)
  * So
      * if you search for 'behaviour' it WILL show resutls for 'behavior'
      * if you search for 'behavior' it WILL show resutls for 'behaviour'
 
### Why 

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
