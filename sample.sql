CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
 
 
CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
        REFERENCES students(id)
        ON DELETE CASCADE
        
SELECT first_name, title, grade
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id;
    
/* Left JOIN + IFNULL */
    
SELECT  first_name, 
        IFNULL(title,'Missing'),
        IFNULL(grade,0)
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id;  
   /* IF NULL, LEFT JOIN, AVG */
    
SELECT 
        first_name, 
        IFNULL(AVG(grade),0) AS average,
        CASE 
            WHEN AVG(grade) >=75 THEN 'Passing'
            ELSE 'Failing'
        END AS passing_status
FROM students
    LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;
    
