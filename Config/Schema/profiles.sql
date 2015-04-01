
CREATE TABLE aib_usr_avatar_urls (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    profile_picture_url  VARCHAR(255) NULL,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE `aib_usr_street_types` (
  id INT(11) unsigned NOT NULL auto_increment,
  text varchar(45) character set latin1 NOT NULL COMMENT 'The text of the type eg "street" "road"',
  abbreviation varchar(5) character set latin1 NOT NULL COMMENT 'eg Rd, St etc',
  created DATETIME,
  modified DATETIME,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `aib_usr_street_types`
--

/*!40000 ALTER TABLE `aib_usr_street_types` DISABLE KEYS */;
INSERT INTO `aib_usr_street_types` (`id`,`text`,`abbreviation`,created,modified) VALUES
 (1,'Street','St',now(),now()),
 (2,'Road','Rd',now(),now()),
 (3,'Avenue','Ave',now(),now()),
 (4,'Place','Pl',now(),now()),
 (5,'Circuit','Cct',now(),now()),
 (6,'Close','Cl',now(),now()),
 (7,'Way','Way',now(),now()),
 (8,'Lane','Ln',now(),now()),
 (9,'Drive','Dr',now(),now());
/*!40000 ALTER TABLE `aib_usr_street_types` ENABLE KEYS */;

CREATE TABLE  aib_usr_appellation_codes (
  id int(10) unsigned NOT NULL auto_increment,
  label varchar(45) NOT NULL,
  lang varchar(4) NOT NULL default 'en',
  created DATETIME,
  modified DATETIME,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aib_usr_appellation_codes`
--

/*!40000 ALTER TABLE `aib_usr_appellation_codes` DISABLE KEYS */;
INSERT INTO `aib_usr_appellation_codes` (`id`,`label`,`lang`,created,modified) VALUES
 (1,'Mr','en',now(),now()),
 (2,'Mrs','en',now(),now()),
 (3,'Ms','en',now(),now()),
 (4,'Prof','en',now(),now()),
 (5,'Dr','en',now(),now()),
 (6,'Rev','en',now(),now());
/*!40000 ALTER TABLE `aib_usr_appellation_codes` ENABLE KEYS */;


CREATE TABLE aib_usr_user_profiles (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT(11) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lasstname VARCHAR(255) NOT NULL,
    appellation_code_id int(10) unsigned NOT NULL DEFAULT '1',
    avatar_url_id INT(11) NULL,
    email VARCHAR(255) NOT NULL,
    mobile VARCHAR(255) NOT NULL,
    receive_newsletter INT(1)  NULL default 1,
    created DATETIME,
    modified DATETIME
);

CREATE TABLE aib_usr_user_profile_addresses (
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  phone varchar(20) DEFAULT NULL,
  country_code varchar(2) NOT NULL,
  state varchar(2) NOT NULL DEFAULT '',
  city varchar(45) NOT NULL DEFAULT '',
  street_name varchar(100) NOT NULL,
  postcode varchar(8) NOT NULL,
  number varchar(8) NOT NULL,
  street_type_id tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'street, road etc',
  town varchar(60) NOT NULL,
  created DATETIME,
  modified DATETIME,
  KEY `street_type` (`street_type_id`)
);
