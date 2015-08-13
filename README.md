# Culture Amp's Developer Coding Test

Your task is to build out this skeleton Rails application to upload and parse survey data from CSV files, and display the results.

## Data Format

Included in the folder example_data are three sample data files containing survey results:
* example-1.csv
* example-2.csv
* example-3.csv


You'll notice that the format of these files matches the following criteria:
* The first row indicates the 'type' of question:
** Blank means it's user data, not a question.
* Answers to Rating Questions are always an integer between (and including) 1 and 5. Blank answers represent not answered. Answers to Single Select Questions can be any string.
* The second row indicates the name of the Theme that a question is associated with (question grouping). The third row is the description of the user data type or the question.
* Each row from the fourth row onwards represents one user completing the survey.

The columns are always in the following order:
* Email
* Employee Id
* Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey) Each column from the fourth onwards are survey questions.

## The Rails Application

Your coding challenge is to build a web application that allows a user to upload a file, and presents a summary of the survey results. We have created a skeleton application for you to extend, using Ruby 2.2.2 and Rails 4.2.1.

We have included Haml templates containing a simple UI to upload CSV files, and a page to display survey results. The results page includes:

1. The participation percentage and total participant counts of the survey.
2. The average for each rating question

You can ignore the select questions.

We have also included simple RSpec integration tests. Please include additional tests as you see fit.

You are free to change any of the application including the UI, but this is not required.

## Other information

Please update this Readme with any additional information you would like to include. You may wish to use it to explain any design decisions.

Successful candidates will be asked to extend their implementation in a pair programming session as a component of the interview, so consider extensibility and ensure you have appropriate tests in place.

## Sharing your solution

Please set up a private Bitbucket Repository (Free for up to 5 user - https://bitbucket.org/) and share it with denglish (Doug English, Head of Engineering), tmoore (Tim Moore, Lead Developer), jocranford (Jo Cranford, Lead Developer) and kevinyank (Kevin Yank, Lead Developer).

￼￼￼￼￼￼￼￼￼￼￼￼￼￼We're looking forward to your innovative solutions!
