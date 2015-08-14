# Survey Results Parser

A web application that allows a user to upload a file, parse survey data from CSV files, and present a summary of the results.

## Data Format

Included in the folder example_data are three sample data files containing survey results:

* example-1.csv
* example-2.csv
* example-3.csv

Format of these files matches the following criteria:

* The first row indicates the 'type' of question:
** Blank means it's user data, not a question.
* Answers to Rating Questions are always an integer between (and including) 1 and 5. Blank answers represent not answered. Answers to Single Select Questions can be any string.
* The second row indicates the name of the Theme that a question is associated with (question grouping). The third row is the description of the user data type or the question.
* Each row from the fourth row onwards represents one user completing the survey.

The columns are always in the following order:
* Email
* Employee Id
* Submitted At Timestamp (if there is no submitted at timestamp, you can assume the user did not submit a survey) Each column from the fourth onwards are survey questions.

## Design

CSVFile -> CSVParser -> Structured Data -> Loader -> Persistent Store -> Presentation
