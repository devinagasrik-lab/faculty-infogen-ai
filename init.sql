CREATE DATABASE IF NOT EXISTS faculty_db;
USE faculty_db;

CREATE TABLE faculty (
  faculty_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  department VARCHAR(100),
  designation VARCHAR(100),
  qualification VARCHAR(200),
  experience INT,
  email VARCHAR(150),
  phone VARCHAR(30),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE timetable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  faculty_id INT,
  subject VARCHAR(200),
  day VARCHAR(20),
  time_slot VARCHAR(50),
  room_no VARCHAR(50),
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE CASCADE
);

CREATE TABLE subjects (
  subject_code VARCHAR(50) PRIMARY KEY,
  subject_name VARCHAR(200),
  faculty_id INT,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL
);

CREATE TABLE marks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(50),
  subject_code VARCHAR(50),
  marks INT,
  faculty_id INT,
  FOREIGN KEY (subject_code) REFERENCES subjects(subject_code) ON DELETE SET NULL,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE SET NULL
);

CREATE TABLE research (
  id INT AUTO_INCREMENT PRIMARY KEY,
  faculty_id INT,
  paper_title TEXT,
  journal_name VARCHAR(255),
  year INT,
  citation_count INT DEFAULT 0,
  link VARCHAR(512),
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE CASCADE
);

CREATE TABLE fdp (
  id INT AUTO_INCREMENT PRIMARY KEY,
  faculty_id INT,
  fdp_title VARCHAR(255),
  conducted_by VARCHAR(255),
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE CASCADE
);

CREATE TABLE workshops (
  id INT AUTO_INCREMENT PRIMARY KEY,
  faculty_id INT,
  title VARCHAR(255),
  organizer VARCHAR(255),
  date DATE,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE CASCADE
);

CREATE TABLE seminars (
  id INT AUTO_INCREMENT PRIMARY KEY,
  faculty_id INT,
  title VARCHAR(255),
  venue VARCHAR(255),
  date DATE,
  FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id) ON DELETE CASCADE
);
