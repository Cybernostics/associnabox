
CREATE TABLE aib_usr_password_reset_requests (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    reset_code VARCHAR(255) NOT NULL,
    created DATETIME,
    modified DATETIME
);

