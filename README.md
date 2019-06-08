# fig-loans-code-challenge

Hi Zara,

Here's a quick explanation of the files you're looking at:

## rdbms_erd.txt

Contains my response to this part of the challenge: 

> Exercise: Come up with a basic RDBMS ERD for such a system. We only need to see entities, associations, and attributes (don’t go too overboard, just the necessities).

## check_eligibility_method.rb

My response to this part:

> BONUS: Based on your ERD, write a method that takes in a user as an argument and runs a SQL query to determine whether that user is eligible to keep using the computer at that moment (i.e. they haven’t reached any limits).

## five_safeguards.txt

My response to this part: 

> Exercise: What are five things you’d make sure the website included, did, or checked (and how) to ensure that each citizen has the best chance of submitting everything correctly the first time?

## validatePasswordMethod.js

My response to this part:

> BONUS: Write a Javascript validation (jQuery allowed) that takes in a password as an argument and will show a very clear error message if the password is not at least 8 characters and does not contain at least one letter, one number, and the % symbol.

It's not actually written to take the password as an argument. For testing purposes I set `password` up so as a separate variable. But it could easily be refactored to do so.

## password.html

Super-simple page that contains a form with a password input (well, actually a regular text input so you can see what you're typing) and a submit button. I used it to test the password validation method. If you'd like to do the same you can just `open password.html` in a browser.

## seed.rb

Contains a bit of Ruby and SQL to set up a SQLite database I used to test the method to check a citizen's eligibility. Running this file should set up a SQLite3 database if you have SQLite3 installed, but you might need to delete `first_database_ever.db` first. See below.

## first_database_ever.db

The SQLite3 database I mentioned above. Honestly I meant to check this out of version control. You might need to delete it first if you want to run `seed.rb` and create/populate a DB.

