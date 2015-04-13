CREATE TABLE aib_committees (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE aib_committees_officeholders (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    committee_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    role_id INT(11) NOT NULL,
    term_start DATETIME,
    term_end DATETIME,
    created DATETIME,
    modified DATETIME)
;

CREATE TABLE aib_roles (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME)
;

CREATE TABLE aib_committee_meetings (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    committee_id INT(11) NOT NULL,
    title VARCHAR(255) NOT NULL,
    user_id INT(11) NOT NULL,
    scheduled DATETIME,
    created DATETIME,
    modified DATETIME
);

--CREATE TABLE aib_agenda_items (
--    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--    title VARCHAR(255) NOT NULL,
--    user_id INT(11) NOT NULL,
--    scheduled DATETIME,
--    created DATETIME,
--    modified DATETIME
--);

CREATE TABLE aib_meeting_attenders (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    meeting_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);
