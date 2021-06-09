DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Hello' , 'Kitty'),  --1
    ('Homer' , 'Simpson'), --2 
    ('Bob' , 'Burger');     --3

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, body, user_id)
VALUES
    ('Question 1' , 'What color is your fur coat?' , (SELECT id FROM users WHERE fname= 'Hello' AND lname= "Kitty")),
    ('Question 2' , 'What is your favorite donut?' , (SELECT id FROM users WHERE fname= 'Homer' AND lname= "Simpson")),
    ('Question 3' , 'Do you sell vegan burgers?' , (SELECT id FROM users WHERE fname= 'Bob' AND lname= "Burger"));

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname= 'Hello' AND lname= "Kitty"), (SELECT id FROM questions WHERE title='Question 1')),
    ((SELECT id FROM users WHERE fname= 'Homer' AND lname= "Simpson"), (SELECT id FROM questions WHERE title='Question 2')),
    ((SELECT id FROM users WHERE fname= 'Bob' AND lname= "Burger"), (SELECT id FROM questions WHERE title='Question 3'));

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    replies (question_id, parent_id, author_id, body)
VALUES
    ((SELECT id FROM questions WHERE title='Question 1'), NULL, (SELECT id FROM users WHERE fname= 'Hello' AND lname= "Kitty"), 'White. '),
    ((SELECT id FROM questions WHERE title='Question 2'), NULL, (SELECT id FROM users WHERE fname= 'Homer' AND lname= "Simpson"), 'Pink Sprinkles. '),
    ((SELECT id FROM questions WHERE title='Question 3'), NULL, (SELECT id FROM users WHERE fname= 'Bob' AND lname= "Burger"), 'Yes with vegan cheese. ');

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    user_likes INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes (user_id, question_id, user_likes)
VALUES
    ((SELECT id FROM users WHERE fname= 'Hello' AND lname= "Kitty"), (SELECT id FROM questions WHERE title='Question 1'), 10),
    ((SELECT id FROM users WHERE fname= 'Homer' AND lname= "Simpson"), (SELECT id FROM questions WHERE title='Question 2'), 20),
    ((SELECT id FROM users WHERE fname= 'Bob' AND lname= "Burger"), (SELECT id FROM questions WHERE title='Question 3'), 30);

    

