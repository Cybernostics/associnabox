CREATE TABLE `aib_invoice_status_codes` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `label` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `aib_invoice_status_codes` (`id`,`label`) VALUES
 (0,'Cancelled'),
 (1,'Created'),
 (2,'Issued'),
 (3,'Pending'),
 (4,'Paid');
 
CREATE TABLE `aib_invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(36) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `issue_date` datetime NOT NULL,
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1=created 2=issued 3=paid 0=cancelled',
  `currency_code_id` char(3) NOT NULL,
  `due_date` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS aib_invoice_items;

CREATE TABLE `aib_invoice_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `invoice_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL default '0.00',
  `item_reference` int(10) unsigned default NULL COMMENT 'refernce to a subscription number or voucher id',
  `quantity` int(10) unsigned NOT NULL default '1',
  `gst` decimal(10,2) NOT NULL default '0.00',
  `delivered` tinyint(1) NOT NULL default '0' COMMENT 'true if the item has been delivered to the user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY  (`id`),
  KEY `ParentInvoice` (`invoice_id`),
  CONSTRAINT `ParentInvoice_const` FOREIGN KEY (`invoice_id`) REFERENCES `aib_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `aib_payments`;
CREATE TABLE  `aib_payments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL,
  `user_amount` decimal(10,2) NOT NULL default '0.00' COMMENT 'This is the amount in the user''s currency .',
  `GST` decimal(10,2) default '0.00' COMMENT 'Amount of GST applied to this item.',
  `description` varchar(255) character set utf8 NOT NULL,
  `gateway_data` mediumblob NOT NULL COMMENT 'contains a JSON array of payment data from the gateway, like receipt number.',
  `payment_method_id` int(10) unsigned NOT NULL COMMENT 'The method used to make the payment.',
  `invoice_id` int(10) unsigned NOT NULL,
  `currency_code` char(3) character set utf8 NOT NULL,
  `banked_amount` decimal(10,2) NOT NULL COMMENT 'This is the amount in the home currency. ',
  `payment_status_id` int(10) unsigned NOT NULL default '1',
  `banked_on` datetime NOT NULL default '0000-00-00 00:00:00',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY  (`id`),
  INDEX(`payment_status_id`),
  INDEX(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8  ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `aib_products`;

CREATE TABLE  `aib_products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `product_code` varchar(8) NOT NULL COMMENT 'Unique alpha code to lookup products',
  `description` varchar(60) NOT NULL,
  `item_type` tinyint(3) unsigned NOT NULL default '1' COMMENT '1 - voucher 2- physical item 3- subscription 4-download',
  `title` varchar(40)  NOT NULL,
  `url` varchar(45) default NULL,
  `recurrence` int unsigned not null default 0 COMMENT '0 for single purchase items, >0 for billing frequency in  approx days 1-daily,7=weekly,14-fortnightly,30-monthly,90-quarterly, 180=half-yearly,365=yearly',
  `category_id` varchar(45) NOT NULL,
  `payment_event` varchar(45) NOT NULL COMMENT 'Name of the event raised when one of these is purchased',
  `event_args` varchar(200) NOT NULL COMMENT 'variable argument list to pass to the processor',
  `track_inventory` tinyint(1) NOT NULL default '0' COMMENT 'if true product has stock levels',
  `is_option` tinyint(1) NOT NULL default '0' COMMENT 'if true product may or may not be purchased when parent is purchased',
  `gst_applies` tinyint(1) NOT NULL default '0' COMMENT 'if true product amount includes GST in australia',
   parent_id int(10) DEFAULT NULL COMMENT 'for optional add ons this will point to the associated parent',
   lft int(10) DEFAULT NULL,
   rght int(10) DEFAULT NULL,
   created DATETIME,
   modified DATETIME,
  PRIMARY KEY  (`id`),
  KEY `ProdCode` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE  `Products` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(40)  NOT NULL,
  `sku` varchar(40)  NOT NULL,
  `description` varchar(60) NOT NULL,
  `parent_id` int(10) unsigned default '0' COMMENT 'for optional add ons this will point to the associated parent',
  `payment_event` varchar(45) NOT NULL COMMENT 'Name of the event raised when one of these is purchased if they don''t have their own event',
  `event_args` varchar(200) NOT NULL COMMENT 'variable argument list to pass to the processor',
  `gst_applies` tinyint(1) NOT NULL default '0' COMMENT 'if true product amount includes GST in australia',
    lft int(10) DEFAULT NULL,
    rght int(10) DEFAULT NULL,
    created DATETIME,
    modified DATETIME,
  PRIMARY KEY  (`id`),
  KEY `ProdCode` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

DROP TABLE IF EXISTS `aib_tickets``;

CREATE TABLE  `aib_event_tickets` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned,
  `payment_id` int(10) unsigned,
  `code` varchar(255) NOT NULL,
  redeemed DATETIME,
  created DATETIME,
  modified DATETIME,
  PRIMARY KEY  (`id`),
  KEY `ProdCode` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;


