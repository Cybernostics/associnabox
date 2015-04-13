-- should have all the requisite fields for swallowing google ics event

CREATE TABLE aib_events (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	  `dtstart` DATETIME,
	  `dtend` DATETIME,
	  `dtstamp` DATETIME,
	  `uid` VARCHAR(255) NOT NULL,
	  `description` VARCHAR(255) NOT NULL,
	  `location` VARCHAR(255) NOT NULL,
	  `sequence` INT(11) DEFAULT 0,
	  `status` VARCHAR(255) NOT NULL,
	  `summary` VARCHAR(255) NOT NULL,
	  `transp` VARCHAR(255) NOT NULL,
    `action_id` INT(11) NOT NULL,
    `event_sequence_id` INT(11) DEFAULT 0,
    `created` DATETIME,
	  `modified` DATETIME
);

CREATE TABLE aib_event_sequences (
    `id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `initial_dtstart` DATETIME,
    `dtend` DATETIME,
    `dtstamp` DATETIME,
    `uid` VARCHAR(255) NOT NULL,
    `recurrence_unit` INT(11) COMMENT '1d, 7d 14d 30d 180d 365d',   
    `recurrence_count` INT(11) COMMENT 'how many on which to repeat',   
    `description` VARCHAR(255) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `sequence` INT(11) NOT NULL,
    `status` VARCHAR(255) NOT NULL,
    `summary` VARCHAR(255) NOT NULL,
    `transp` VARCHAR(255) NOT NULL,
    `action_id` INT(11) NOT NULL,
    `created` DATETIME,
    `modified` DATETIME
);
