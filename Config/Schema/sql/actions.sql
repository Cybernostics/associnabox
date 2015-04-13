CREATE TABLE aib_actions (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    assigned_user_id INT(11),
    owner_user_id INT(11) NOT NULL,
    due DATETIME,
    created DATETIME,
    mnodified DATETIME
);

CREATE TABLE aib_action_status_codes (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_action_update (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    action_update VARCHAR(255) NOT NULL,
    update_user_id INT(11),
    updated_action_status_code INT(11),
    created DATETIME,
    modified DATETIME
);



