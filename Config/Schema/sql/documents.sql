
CREATE TABLE aib_document_links (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL ,
    group_id INT(11) NOT NULL ,
    folder_id INT(11) NOT NULL,
    fileuri VARCHAR(255) NOT NULL,
    revision INT(2),
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_folders (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    group_id INT(11) NOT NULL ,
    path VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_documents (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL ,
    group_id INT(11) NOT NULL ,
    folder_id INT(11) NOT NULL,
    content TEXT,
    revision INT(2),
    created DATETIME,
    modified DATETIME
);
