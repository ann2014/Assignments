/* 
  Project: Building a Relational Database Management System 
*/

DROP TABLE IF EXISTS depts;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS room_groups;
 
CREATE TABLE depts
(
 dept_id int PRIMARY KEY,    
 dept_name varchar(50) NOT NULL 
);

CREATE TABLE users
(
 user_id INT PRIMARY KEY,    
 user_name VARCHAR(50) NOT NULL,
 dept_id INT NULL REFERENCES depts
);
 
CREATE TABLE rooms
(
 room_id INT PRIMARY KEY,    
 room_name VARCHAR(50) NOT NULL 
);
 
CREATE TABLE room_groups
(
 room_id int NOT NULL REFERENCES rooms,    
 dept_id int NOT NULL REFERENCES depts,
 PRIMARY KEY(room_id, dept_id)
);
 
INSERT INTO depts
  (dept_id, dept_name)
 VALUES
  ('1', 'I.T.'),
  ('2', 'Sales'),
  ('3', 'Administration'),
  ('4', 'Operations')
;
 
INSERT INTO users
  (user_id, user_name, dept_id)
 VALUES
  ('1', 'Modesto', 1),
  ('2', 'Ayine', 1),
  ('3', 'Christoper', 2),
  ('4', 'Cheong Woo', 2),
  ('5', 'Saulat', 3),
  ('6', 'Heidy', NULL)
;

INSERT INTO rooms
  (room_id, room_name)
 VALUES
  ('1', '101'),
  ('2', '102'),
  ('3', 'Auditorium A'),
  ('4', 'Auditorium B')
;

INSERT INTO room_groups 
  (room_id, dept_id)
 VALUES 
  (1, 1),
  (2, 1),
  (2, 2),
  (3, 2)
;

SELECT * FROM users;
SELECT * FROM depts;
SELECT * FROM rooms;
SELECT * FROM room_groups;

/*
• All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
*/

SELECT dept_name, user_name  
FROM dept a
 LEFT JOIN users b
 ON a.dept_id = b.dept_id
;
/*
• All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
assigned to them.
*/

SELECT room_name, dept_name
FROM rooms a
 LEFT JOIN access b
 ON a.room_id = b.room_id
 LEFT JOIN dept c
 ON b.dept_id = c.dept_id
; 
 
 /*
• A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
alphabetically by user, then by group, then by room.
*/

SELECT user_name, dept_name, room_name
FROM users a
 INNER JOIN dept b
 ON a.dept_id = b.dept_id
 INNER JOIN access c
 ON b.dept_id = c.dept_id
 INNER JOIN rooms d
 ON c.room_id = d.room_id
ORDER BY 
 user_name,
 dept_name,
 room_name
;
 