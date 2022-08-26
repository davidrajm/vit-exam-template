# VIT sample exam template

In this repository, I have made my source code open which I use it for my question paper typing of my university. 

## Features 

 1. Typeset the questions with the marks typed along the side of the questions `\question[marks]`. It prints the marks for the students in the margin.
 1. Commands to store the module, CO, BL, Hots, details in the source file itself. A switch has `\formoderation` is provided to show or hide these details in the pdf file.
 1. Automatic header for the question paper based on the details provided in the source file.
 1. Automatic generation of pre-audit file which is to be submitted the division chair/HOD.
 1. Automatic generation of labels to be affixed when submitting to COE office.
 1. Option to set the password for the pdf file


## Defining Exam Top Essestials

There are some special commands given to provide the details about the question papers such as `\exam` (for exam name), `\examshortname` (to use it audit form), `\semester` etc., to create the exam top. Providing the details in the respective commands fills the exam top in the question paper and in the audit form. These details are also used in the label creation in the later case.

![examtop](https://user-images.githubusercontent.com/15086149/186879356-e9e408ec-0a5b-4340-9b36-fdd119efe9d1.png)


## Typing instructions.

Instructions can be typed in the special environment called `instruction`

```
\begin{instructions}
Your instructions
\end{instructions}
```

## Marks for the parts

You might want to split the question paper in to multiple parts and the parts marks and the title of the parts can be typed as follows.

``` 
\partmarks{$10\times 10 = 100$}
\part{Answer any TEN  Questions}
```

__Output:__

![parts](https://user-images.githubusercontent.com/15086149/186879933-16d316be-1101-48b9-a69c-3a177048ebd8.png)



 
## How to show or hide the solutions.

 1. Type the solutions below the question as like the following:
   ```
   \question 
   
   \begin{solution}
      Your solution goes here...
   \end{solution}
   ```
 2. In the preamble, comment or uncomment `\printanswers` to show or hide the solutions.

## How to set a password for the pdf file?

  - In the second line of the `main.tex` , uncomment the line `\special{pdf:encrypt userpw (abc) ownerpw (xyz) length 128}`
  - Change your desired password instead of `abc` and `xyz` for the user password and the owner password. 

## How to print the labels for the covers.

You also might want to print the labels for the covers to be submitted to the CEO office. To generate the labels, in addition to the examtop details, you also might have to set the following.

```
\examdate{30/08/2022}
\examtime{9.00 AM to 10.30 AM}
\classrooms{DB--108,DB--203 ,DB--204}
\students{9,36,25}
```
__Note:__ Please notice that the classrooms must be separeated by commas and the corresponding number of students alloted should be also comma separated in the `\students` command. 

Then, you may get the labels as follows. (I have put only one labels screenshot here).

![label](https://user-images.githubusercontent.com/15086149/186880653-69ef4936-40b4-4e69-a97a-b0ebb6b641c3.png)






## Latest Changes:
 - Added command to print the labels on the covers while submitting the qp's to the exam cell.
 


 
