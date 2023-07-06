### Creating the "students" table with all the columns names

CREATE TABLE students 
(id INT AUTO_INCREMENT PRIMARY KEY, 
first_name VARCHAR(100), 
last_name VARCHAR(100));

### Creating the "papers" table with all the columns names

create table papers (
           title varchar(100), 
           grade int,
           student_id int,
           foreign key (student_id) references students (id)
           ); 

### View both the created table  

select* from students;
select* from papers;

### Insert all the input for the papers table 

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


###Pull up data that shows only student's name who have a completed their title,grade and order from high to low grades. No null results. ***

select s.first_name, p.student_id, p.title, p.grade
from students s 
join papers p on s.id = p.student_id
order by p.grade desc ;

###Pull up data that shows every student's name even if they have not completed their titles/grades.***

SELECT first_name, title, grade
    FROM students
    LEFT JOIN papers
	ON students.id = papers.student_id;
    
### Pull up data that shows every student's name even if they have not completed their titles/grades. 
###But make the null for title 'Missing' and the null for grades a 0.

select first_name,
       ifnull (title, 'Missing'),
       ifnull (grade, 0)
       from students left join papers on students.id=papers.student_id
       order by grade desc;
       
###Since certain students had mutiple titles so mutiple grades. Get the average grade for every student.***

select first_name,
       avg(grade) 
       from students inner join papers 
       on students.id=papers.student_id
       group by first_name;



    

