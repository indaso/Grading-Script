Team Members: Isobeye Daso, Emre Tanirgan

Adding a student:
In the top directory of the project, run this command:
sh add_a_student.sh [pennkey] [last name] [first name]
where [pennkey] is replaced by pennkey of student who you wish to add, [last
name] and [first name] is replaced by the respective last name and first name
of student.

Removing a student:
In the top directory of the project, run this command:
sh remove_student.sh [pennkey]
where [pennkey] is replaced by pennkey of the student who you wish to remove.
The command will ask for confirmation before deletion.


Adding an assignment:
In the top directory of the project, run this command:
sh add_assignment.sh [assignment label]
where [assignment label] is replaced by name of assignment user wishes to add.
This command also prompts the user to input the max score for the assignment.

Add student grade:
In the top directory of the project, run this command:
sh add_grade.sh [pennkey] [assignment label]
where [pennkey] will be replaced by the pennkey of the student whose grades you
wish to add and [assignment label] will be replaced by the name of the
assignment you wish to add a grade for.

Getting a grade: 
In the top directory of the project, run this command:
sh getgrade.sh [pennkey]
where [pennkey] will be replaced by the pennkey of the student whose grades you wish to see.

Getting all grades:
In the top directory of the project, run this command:
sh getallgrades.sh [path]
where [path] is the path to the CSV file which contains the list of students and their grades.

Generate a grade file:
In the top directory of the project, run this command:
sh creategradeone.sh [pennkey] [assignmentlabel]
where [pennkey] is the pennkey of the student and [assignmentlabel] is the assignment you wish to see the grades of. 

Generate all grade files:
In the top directory of the project, run this command:
sh createallgrades.sh [assignmentlabel]
where [assignmentlabel] is the assignment you wish to see the grades of. A directory will be created with the same assignment label name in the project folder.

Send grade via email to 1 student:
In the top directory of the project, run this command:
sh sendmailone.sh [pennkey] [assignmentlabel]
This will send an email to the student with the pennkey [pennkey] containing his grade for the assignment [assignmentlabel]. The grade will be sent as an attachment file called "Grade".

Send grade via email to all students:
In the top directory of the project, run this command:
sh sendallmails.sh [assignmentlabel]
This will send emails to all students with their respective grade for the assignment [assignmentlabel]. The grade will be sent as an attachment file called "Grade".

Note for both email scripts: The emails also have a random inspirational/weird quote after the grade. The quote is grabbed from a CSV file Quotes.txt. (This was for extra credit)

Archiver:
In the top directory of the project, run this command:
sh archiver.sh [semester] [YYYY]
where [semester] is either spring, fall or summer and [YYY] represents the year. After running this you should see a tar.gz file called YYYY_semester_backup.tar.gz that contains all of the grades in grade directories.
