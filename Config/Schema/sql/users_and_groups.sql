-- users and groups
CREATE TABLE aib_users (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    salt VARCHAR(255) NOT NULL,
    group_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_users_groups (
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
CREATE TABLE aib_groups (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    parent_id int(10) DEFAULT NULL,
    lft int(10) DEFAULT NULL,
    rght int(10) DEFAULT NULL,
    created DATETIME,
    modified DATETIME
);

