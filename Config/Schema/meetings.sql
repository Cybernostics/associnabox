CREATE TABLE committees (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE committees_officeholders (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    committee_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    name VARCHAR(255) NOT NULL,
    term_start DATETIME,
    term_end DATETIME,
    created DATETIME,
    modified DATETIME)
;

CREATE TABLE committee_meetings (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    committee_id INT(11) NOT NULL,
    title VARCHAR(255) NOT NULL,
    user_id INT(11) NOT NULL,
    scheduled DATETIME,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE agenda_items (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    user_id INT(11) NOT NULL,
    scheduled DATETIME,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE meeting_attenders (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    meeting_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);
