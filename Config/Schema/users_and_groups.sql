-- users and groups
CREATE TABLE aib__users (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password CHAR(40) NOT NULL,
    group_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib__users_groups (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    group_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);

-- All Users
--     Registered Users
--         Financial Members
--         Committee members
--         Moderators
--     Administrators
CREATE TABLE aib__groups (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id int(10) DEFAULT NULL,
    lft int(10) DEFAULT NULL,
    rght int(10) DEFAULT NULL,
    created DATETIME,
    modified DATETIME
);

