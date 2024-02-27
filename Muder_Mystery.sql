CREATE DATABASE Murder_Mystery;
USE Murder_Mystery;

CREATE TABLE forensic_evidence(
    item VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE people(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    height INT NOT NULL,
    hair_colour VARCHAR(50) NOT NULL,
    relationship_to_victim VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE witness_reports(
    person_id INT NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE alibis(
    person_id INT NOT NULL,
    description VARCHAR(500) NOT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE financial_report(
    id INT NOT NULL AUTO_INCREMENT,
    person_id INT NOT NULL,
    savings FLOAT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE transactions(
    financial_report_id INT NOT NULL,
    transaction_time DATE NOT NULL,
    transaction_amount FLOAT NOT NULL,
    FOREIGN KEY (financial_report_id) REFERENCES financial_report(id)
);

CREATE TABLE events(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(150),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE event_attendance(
    person_id INT NOT NULL,
    event_id INT NOT NULL,
    time_arrived TIME NOT NULL,
    time_departed TIME NOT NULL,
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE TABLE email_chain(
    id INT NOT NULL AUTO_INCREMENT,
    subject_line VARCHAR(100) NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE emails(
    chain_id INT NOT NULL,
    sender VARCHAR(255) NOT NULL,
    recipient VARCHAR(255) NOT NULL,
    time TIME NOT NULL,
    description VARCHAR(500) NOT NULL,
    FOREIGN KEY (chain_id) REFERENCES email_chain(id)
);

INSERT INTO people(name, height, hair_color, relationship_to_victim)
VALUES ('Amelia Harper', 165, 'red', 'wife'),
('Daniel Montgomery', 187, 'black', 'coworker (partner)'),
('Natalie Chen', 162, 'black', 'secretary'), 
('Michael Roberts', 197, 'brown', 'ex-client'), 
('Linda Sanchez', 175, 'brown', 'coworker (IT guy)'),  
('Richard Harper', 167, 'blonde', 'victim'),
('Murray Cruz', 178, 'brown', 'witness (IT)'),
('Kai Camacho', 182, 'black', 'witness (caretaking)'), 
('Emily Michael', 170, 'blonde', 'witness (coworker)'),
('Ben Meyers', 184, 'brown', 'no relationship'), 
('Emma Johnson', 165, 'brown', 'no relationship'), 
('Michael Chang', 180, 'black', 'no relationship'), 
('Sophie Miller', 170, 'blonde', 'no relationship'), 
('David Lee', 175, 'brown', 'no relationship'),
('Maria Rodriguez', 160, 'red', 'no relationship'), 
('Alex Wong', 172, 'black', 'no relationship'), 
('Claude Patel', 168, 'brown', 'no relationship'), 
('Daniel Garcia', 178, 'brown', 'no relationship'), 
('Olivia Smith', 163, 'blonde', 'no relationship'),
('Joshua Smith', 185, 'black', 'no relationship');

INSERT INTO alibis(person_id, description)
VALUES (1, 'I have no motive to kill my husband, we were happily married. I was on the 3rd floor, reviewing my court case from earlier that day.'),
(2, 'Dick–I mean Richard–left me to run a client meeting on the 3rd floor from 3:30pm to 6pm. He was supposed to be supervising, but he left at around 4pm.'),
(3, 'Mr. Harper let me leave early that day. I was at home cooking at 5pm and spent the rest of my night watching TV.'),
(4, 'I don’t have anything to do with Harper. My wife’s father was sick. I spent all week at my in-law’s place, taking care of him.'),
(5, 'Servers went down several times that day. I went down to the 12th floor to fix the problem myself. I had Cruz hold down the fort instead.');

INSERT INTO witness_report(person_id, description)
VALUES (7, 'I was only really up on the 20th floor to tell Mr. Harper about our server issue. Linda had gone down a few hours ago to fix it, but nothing happened. I was starting to wonder if she was fixing it at all… Anyway, Mr. Harper didn’t answer me when I knocked so when I walked in and found his body like that– (witness pauses). There was no one else in the room. Just the gun and his body.'),
(8, 'It was probably just around 5pm when I heard a loud bang coming from the office. I didn’t want to intrude or anything, so I waited until I saw Murray Cruz run out to see what was happening. (Interviewer asks a question) I mean, the banging isn’t very uncommon coming from Mr. Harper’s office. There was a lot of (witness clears his throat) noise earlier that day too.'),
(9, 'I’m pretty sure everyone on the 20th floor knows that Harper was not exactly the most faithful man. He and Chen weren’t very subtle. (witness pauses) Although, it’s not all hearts for them either. I overheard them arguing a few days earlier, and not about work either. I couldn’t hear everything, but I can assume that Harper was planning to go straight and that Chen was not very happy about that.');

INSERT INTO forensic_evidence(item, description)
VALUES ('gun', 'dna and fingerprints belonging to Richard'),
('phone', 'fingerprints belonging to Richard and Amelia'),
('security camera footage', 'Hooded person between 160-170 entered the office at 16:12 and security camera footage was cut before they left'), 
('security camera footage', 'security camera footage by Richard’s office was cut between 16:30-17:30');

INSERT INTO financial_report(person_id, savings)
VALUES (1, 9876345),
(2, 143268),
(3, 16239),
(4, -247531),
(5, 11383),
(6, 28314),

(7, 14567,
(8, 10892),
(9, 9375),
(10, 13876),
(11, 9724),
(12, 17568),
(13, 6437),
(14, 9865),
(15, 8274),
(16, 13987),
(17, 7654),
(18, 10987),
(19, 8765),
(20, 12456);

INSERT INTO transactions(financial_report_id, transaction_time, transaction_amount)
VALUES (1, 2023-07-23, 1554267),
(1, 2023-08-27, 1359874),
(1, 2023-09-30, 1412053),
(1, 2023-11-01, 1498632),
(1, 2023-12-04, 1305789),
(2, 2023-11-17, 92),
(2, 2023-11-19, 31),
(2, 2023-12-13, -2480),
(2, 2023-12-14, 69),
(3, 2023-07-19, 3000),
(3, 2023-08-17, 3000),
(3, 2023-10-01, 3000),
(3, 2023-11-04, 3000),


(6, 2023-07-19, -3000),
(6, 2023-08-17, -3000),
(6, 2023-10-01, -3000),
(6, 2023-11-04, -3000)

(10, 2023-07-15, 271),
(10, 2023-07-27, 482),
(10, 2023-08-10, 347),
(11, 2023-08-22, 514),
(11, 2023-09-02, 196),
(12, 2023-09-14, 3829),
(12, 2023-09-26, 591),
(12, 2023-10-08, 283),
(13, 2023-10-20, 47),
(13, 2023-11-01, 562),
(13, 2023-11-13, 389),
(14, 2023-11-25, 521),
(14, 2023-12-07, 274),
(14, 2023-12-19, 416),
(15, 2023-12-31, 512),
(15, 2024-01-12, 32),
(16, 2024-01-24, 451),
(17, 2024-02-05, 5789),
(17, 2024-02-17, 294),
(17, 2024-02-29, 406),
(18, 2023-07-15, 421),
(18, 2023-08-27, 5843),
(18, 2023-09-10, 294),
(18, 2023-10-03, 1076),
(19, 2023-10-15, 209),
(19, 2023-11-27, 372),
(19, 2023-12-09, 5219),
(20, 2024-01-21, 162),
(20, 2024-02-02, 895),
(20, 2024-02-14, 4307);

INSERT INTO email_chain(id, subject_line, creator_person_id) 
VALUES(10, 'Promotion Soon', 1),

(1, 'Project Update Meeting', 10),
(2, 'Client Presentation Prep', 11),
(3, 'Marketing Strategy Discussion', 11),
(4, 'Weekly Status Meeting', 12),
(5, 'Product Development Review', 12),
(6, 'Training Session: New Software', 13),
(7, 'Company Picnic Details', 14),
(8, 'Employee Recognition Ceremony', 14),
(9, 'Product Demo for Clients', 15),

(11, 'No events scheduled', 15),
(12, 'Holiday Schedule Reminder', 17),
(13, 'No events scheduled', 19),
(14, 'Quarterly Review Meeting', 19),
(15, 'Team Building Workshop', 19),
(16, 'CEO Office Hours', 20),
(17, 'Town Hall Q&A Session', 20);
