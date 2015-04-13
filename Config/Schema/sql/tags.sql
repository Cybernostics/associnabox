
CREATE TABLE aib_tags (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(20) NOT NULL UNIQUE,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_tagged_items (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag_id INT(11) NOT NULL,
    table_id INT(11) NOT NULL,
    item_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_taggable_tables (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag_id INT(11) NOT NULL,
    table_name INT(11) NOT NULL,
    item_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_tagged_tables (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tag_id INT(11) NOT NULL,
    table_id INT(11) NOT NULL,
    item_id INT(11) NOT NULL,
    created DATETIME,
    modified DATETIME
);