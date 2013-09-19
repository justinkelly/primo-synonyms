Extended synonymn files for ExLibris Primo
=========

_Note: these synonymns are additional ones, seperate from the eng_Synonynms file that comes with Primo_
### What

  * Extend the default Primo synonym files to cover British English (en_GB, en_AU, en_NZ, en_CA, etc..)
  * Currently primo only 2 way synonym search for very common US/UK English words like 'color' and 'colour'
  * Meaning if you search for either colour or color you will see the same results
  * But it you search for other normal US/UK works it *wont* work
      * if you search for 'behaviour' it will *NOT* show results for 'behavior'
      * if you search for 'behavior' it will show results for 'behaviour'
  * This repository of UK/US synonyms means that your primo can now do 2 way synonym search for hundreds of other synonymns
  * So
      * if you search for 'behaviour' it *WILL* show results for 'behavior'
      * if you search for 'behavior' it *WILL* show results for 'behaviour'
 
### Why 

  * I needed to boost/add/modify to the standard synonyms

### How to implement in Primo

Copy the `english_userSynonyms.txt` to the Primo synonyms directory at `/exlibris/primo/p4_1/ng/jaguar/home/profile/analysis/synonyms/userSynonyms` and then execute a Deploy All in the Primo Back Office

## Custom synonyms

You can add new synonyms into the custom_synonyms.txt file in the Primo format - such as

    connection = connexion (very high)
    connexion = connection (very high)

Refer the Primo Technical Guide for more info on ranking synonyms etc..

### How to run

Run
    ./merge_primo_synonyms.pl

You will then be asked 

    Do you want to include the British English synonyms file? (y/n)

If you enter 'y' to this question, it will use the english_userSynonyms.txt file included

Then it will ask if you for your custom synonyms file

    Please enter a file name of your custom synonyms file, default is custom_synonyms.txt
    
If you leave this blank it will use the custom_synonyms.txt file

The script will now merge the `english_userSynonyms.txt` with the `custom_synonyms.txt` file and save it as `userSynonyms`

To immplement this in Primo - copy the userSynonyms file to `/exlibris/primo/p4_1/ng/jaguar/home/profile/analysis/synonyms/`
and to a Deploy All in primo 
