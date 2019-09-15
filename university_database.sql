CREATE DATABASE university;

USE university;

CREATE TABLE classrooms
(
    classroom VARCHAR(10) NOT NULL,
    room_no INT NOT NULL,
    capacity INT DEFAULT 60,
    PRIMARY KEY(classroom,room_no)
);

CREATE TABLE departments
(
    dept_name VARCHAR(20) NOT NULL PRIMARY KEY,
    building VARCHAR(20),
    budget FLOAT NOT NULL
);

CREATE TABLE courses
(
    course_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE instructor
(
    id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    dept_name  VARCHAR(20) ,
    salary FLOAT
);

CREATE TABLE section
(
    course_id VARCHAR(10) NOT NULL,
    section_id INT NOT NULL,
    sem INT NOT NULL,
    year INT NOT NULL,
    building VARCHAR(20),
    room_no INT NOT NULL ,
    time_slot_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES  courses (course_id),
    PRIMARY KEY(course_id,section_id, sem, year)

);
--Was getting error:1822
CREATE TABLE teaches
(
    id INT NOT NULL ,
    course_id VARCHAR(10) NOT NULL,
    section_id INT NOT NULL,
    sem INT NOT NULL,
    year INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES  courses(course_id),
    FOREIGN KEY (section_id) REFERENCES  section(section_id),
    FOREIGN KEY (sem) REFERENCES  section(sem),
    FOREIGN KEY (year) REFERENCES  section(year)
);

CREATE TABLE students
(
    id INT NOT NULL,
    name VARCHAR(30),
    dept_name VARCHAR(20) ,
    total_credits INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE takes
(
    id INT NOT NULL,
    course_id VARCHAR(10) NOT NULL,
    section_id INT NOT NULL,
    sem INT NOT NULL,
    year INT NOT NULL,
    grade INT ,

    FOREIGN KEY (id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES  courses(course_id),
    FOREIGN KEY (section_id) REFERENCES  section(section_id),
    FOREIGN KEY (sem) REFERENCES  section(sem),
    FOREIGN KEY (year) REFERENCES  section(year),

    PRIMARY KEY (id, course_id, section_id, sem, year)

);

CREATE TABLE advisor
(
    section_id INT NOT NULL,
    id INT NOT NULL,

    FOREIGN KEY (section_id) REFERENCES courses(course_id),
    FOREIGN KEY (id) REFERENCES instructor(id),

    PRIMARY KEY(section_id,id)
);

CREATE TABLE time_slot
(
    time_slot_id INT NOT NULL,
    day DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

CREATE TABLE prerequisite
(
    course_id VARCHAR(10) NOT NULL,
    prerequisite_id INT NOT NULL,
    FOREIGN KEY course_id REFERENCES courses(course_id),
    PRIMARY KEY (course_id, prerequisite_id)
);






