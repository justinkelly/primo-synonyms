Extended synonmyn files for ExLibris Primo
=========
### What

This extendes the default Primo synonym files, adds the ability to include reformatted course codes and provides a way to add your own custom synonym

### Why 

I needed a way to get our thousands our course code ie HAH219 into Primo in the way that people search for them 'HAH 219' and to add and modify other synonyms 

### How to run
    ./merge_primo_synonyms.pl

You will then be asked 
    Which version of Primo you are using?

Choose one that corresponds to an available sub-folder ie. 3.1.2

Then
    Do you want to include course codes? (y/n)

If you enter 'y' to this question

    What is the name of your course codes file ie. course_codes.txt?

This will now convert the contents of the $course_codes_file into Primo synonyms file formatting and reformatting the codes for possible ie. HAH101 becomes HAH 101

Copy the newly prioducted $version/userSysnonyms to the Primo misspelling directory at ng/jaguar/home/profile/analysis/sysnonyms/


### Adding new synonyms

You can add new misspellings into the custom_misspell.txt file in the Primo format - such as

    acheive achieve 
    adress address 
    alot a lot or allot 
    alterior ulterior 
    athiest atheist 

Where the incorrect spelling is the first word followed by a space then the corret spelling
Note the or in the alot statement, this allows you to define to spelling results

I've added a sample into the custom_misspell.txt for a common misspelling of our Instituion name

    swineburne swinburne


### Extending to other versions of Primo

If you want to create a misspellings file for a version of Primo not listed just create a subfolder with the version number ie 3.1.0,
copy the current primo misspelling file (located at: ng/jaguar/home/profile/analysis/misspelling/misspell_eng.txt) to the version folder

Add/Edit the wikipedia_misspell.txt file if you wish

Then run the ./merge_primo_misspell.pl and upload the new file
