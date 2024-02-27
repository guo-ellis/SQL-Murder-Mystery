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