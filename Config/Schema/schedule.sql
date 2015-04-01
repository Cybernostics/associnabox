CREATE TABLE IF NOT EXISTS `schedules` (
  `id`              int(11)     NOT NULL auto_increment,
  `date_start`      date        NOT NULL,
  `time_start`      time        NOT NULL,
  `time_end`        time        NOT NULL,
  `recur_until`     date        default NULL COMMENT 'end date when recurrence stops',
  `recur_freq`      varchar(30) default NULL COMMENT 'null, "secondly", "minutely", "hourly", "daily", "weekly", "monthly", "yearly"',
  `recur_interval`  smallint(5) unsigned default NULL COMMENT 'e.g. 1 for each day/week, 2 for every other day/week',
  `recur_byday`     smallint(5) unsigned default NULL COMMENT 'BITWISE; monday = 1, sunday = 64',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;