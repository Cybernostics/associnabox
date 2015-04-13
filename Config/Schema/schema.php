<?php
require_once __DIR__ . '/ColumnTypes.php';

class AppSchema extends CakeSchema
{


    public function __construct ($options = array())
    {
        $this->init();
        parent::__construct($options);
    }

    public function init ()
    {
        $this->aib_action_status_codes = TableDef::stdCakeTable()->withColumns(
                array(
                        'name' => Column::string(),
                        'description'=> Column::string()
                ))->asArray();
        
        $this->aib_actions = TableDef::stdCakeTable()->withColumns(
                array(
                        'name' => Column::string(),
                        'description' => Column::text(),
                        'assigned_user_id' => Column::foreignKey(),
                        'owner_user_id' => Column::foreignKey(),
                        'due' => Column::dateTime()
                ))->asArray();
        
        $this->aib_comments = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'post_id' => Column::foreignKey(),
                        'body' => Column::text()
                ))->asArray();
        
        $this->aib_committee_meetings = TableDef::stdCakeTable()->withColumns(
                array(
                        'committee_id' => Column::foreignKey(),
                        'name' => Column::string(),
                        'description' => Column::text(),
                        'user_id' => Column::foreignKey(),
                        'scheduled' => Column::dateTime()
                ))->asArray();
        
        $this->aib_committees = TableDef::stdCakeTable()->withColumns(
                array(
                        'name' => Column::string(),
                        'description' => Column::text()
                ))->asArray();
        
        $this->aib_committees_officeholders = TableDef::stdCakeTable()->withColumns(
                array(
                        'committee_id' => Column::foreignKey(),
                        'user_id' => Column::foreignKey(),
                        'role_id' => Column::foreignKey(),
                        'term_start' => Column::dateTime(),
                        'term_end' => Column::dateTime()
                ))->asArray();
        
        $this->aib_document_links = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'group_id' => Column::foreignKey(),
                        'name' => Column::string(),
                        'folder_id' => Column::foreignKey(),
                        'fileuri' => Column::string(),
                        'revision' => Column::integer()
                ))->asArray();
        
        $this->aib_documents = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'group_id' => Column::foreignKey(),
                        'folder_id' => Column::foreignKey(),
                        'name' => Column::string(),
                        'content' => Column::text(),
                        'revision' => Column::integer()
                ))->asArray();
        
        $this->aib_event_tickets = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'payment_id' => Column::foreignKey(),
                        'code' => Column::string(),
                        'redeemed' => Column::dateTime()
                ))->asArray();
        
        $this->aib_events = TableDef::stdCakeTable()->withColumns(
                array(
                        'dtstart' => Column::dateTime(),
                        'dtend' => Column::dateTime(),
                        'dtstamp' => Column::dateTime(),
                        'uid' => Column::string(),
                        'description' => Column::text(),
                        'location' => Column::string(),
                        'sequence' => Column::integer(),
                        'status' => Column::string(),
                        'summary' => Column::string(),
                        'transp' => Column::string(),
                        'action_id' => Column::foreignKey(),
                        'event_sequence_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_groups = TableDef::stdCakeTable()->withColumns(
                array(
                        'name' => Column::string(),
                        'parent_id' => Column::foreignKey(),
                        'lft' => Column::integer(),
                        'rght' => Column::integer()
                ))->asArray();
        
        $this->aib_invoice_items = TableDef::stdCakeTable()->withColumns(
                array(
                        'invoice_id' => Column::foreignKey(),
                        'product_id' => Column::foreignKey(),
                        'amount' => Column::decimal(),
                        'item_reference' => Column::integer(),
                        'quantity' => Column::integer(),
                        'gst' => Column::amount(),
                        'delivered' => Column::amount()->comment(
                                'true if the item has been delivered to the user')
                ))->asArray();
        
        $this->aib_invoice_status_codes = TableDef::stdCakeTable()->withColumns(
                array(
                        'label' => Column::string()
                ))->asArray();
        
        $this->aib_invoices = TableDef::stdCakeTable()->withColumns(
                array(
                        'number' => Column::string(),
                        'user_id' => Column::foreignKey(),
                        'issue_date' => Column::datetime(),
                        'status_id' => Column::foreignKey(),
                        'currency_code_id' => Column::foreignKey(),
                        'due_date' => Column::datetime()
                ))->asArray();
        
        $this->aib_meeting_attenders = TableDef::stdCakeTable()->withColumns(
                array(
                        'meeting_id' => Column::foreignKey(),
                        'user_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_payments = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'user_amount' => Column::amount(),
                        'GST' => Column::amount(),
                        'description' => Column::string(),
                        'gateway_data' => Column::string()->comment(
                                'contains a JSON array of payment data from the gateway, like receipt number.'),
                        'payment_method_id' => Column::foreignKey(),
                        'invoice_id' => Column::foreignKey(),
                        'currency_code' => Column::string(),
                        'banked_amount' => Column::amount(),
                        'payment_status_id' => Column::foreignKey(),
                        'banked_on' => Column::datetime()
                ))->asArray();
        
        $this->aib_posts = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'title' => Column::string(),
                        'body' => Column::text()
                ))->asArray();
        
        $this->aib_products = TableDef::stdCakeTable()->withColumns(
                array(
                        'product_code' => Column::string(),
                        'description' => Column::string(),
                        'item_type_id' => Column::foreignKey()->comment('1 - voucher,2- physical item 3- subscription 4-download'),
                        'name' => Column::string(),
                        'url' => Column::url(),
                        'recurrence' => Column::integer()->comment( '0 for single purchase items, >0 for billing frequency in approx days 180=half-yearly,365=yearly'), 
                        'category_id' => Column::foreignKey(),
                        'payment_event' => Column::string()->comment('Name of the event raised when one of these is purchased'), 
                        'event_args' => Column::string()->comment('variable argument list to pass to the processor'), 
                        'track_inventory' => Column::boolean()->comment(
                                'if true product has stock levels'),
                        'is_option' => Column::boolean()->comment(
                                'if true product may or may not be purchased when parent is purchased'),
                        'gst_applies' => Column::boolean()->comment(
                                'if true product amount includes GST in australia'),
                        'parent_id' => Column::foreignKey(),
                        'lft' => Column::integer(),
                        'rght' => Column::integer()
                ))->asArray();
        
        $this->aib_roles = TableDef::stdCakeTable()->withColumns(
                array(
                        'name' => Column::string()
                ))->asArray();
        
        $this->aib_tagged_items = TableDef::stdCakeTable()->withColumns(
                array(
                        'tag_id' => Column::foreignKey(),
                        'table_id' => Column::foreignKey(),
                        'item_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_tagged_tables = TableDef::stdCakeTable()->withColumns(
                array(
                        'tag_id' => Column::foreignKey(),
                        'table_id' => Column::foreignKey(),
                        'item_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_tags = TableDef::stdCakeTable()->withColumns(
                array(
                        'label' => Column::string()
                ))->asArray();
        
        $this->aib_upvotes = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'comment_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_users = TableDef::stdCakeTable()->withColumns(
                array(
                        'username' => Column::string(),
                        'password' => Column::string(),
                        'salt' => Column::string(),
                        'group_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_users_groups = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'group_id' => Column::foreignKey()
                ))->asArray();
        
        $this->aib_usr_appellation_codes = TableDef::stdCakeTable()->withColumns(
                array(
                        'label' => Column::string(),
                        'lang' => Column::string()
                ))->asArray();
        
        $this->aib_usr_avatar_urls = TableDef::stdCakeTable()->withColumns(
                array(
                        'profile_picture_url' => Column::string()
                ))->asArray();
        
        $this->aib_usr_password_reset_requests = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'reset_code' => Column::string()
                ))->asArray();
        
        $this->aib_usr_street_types = TableDef::stdCakeTable()->withColumns(
                array(
                        'label' => Column::string(),
                        'abbreviation' => Column::string()->comment(
                                'eg Rd, St etc')
                ))->asArray();
        
        $this->aib_usr_user_profiles = TableDef::stdCakeTable()->withColumns(
                array(
                        'user_id' => Column::foreignKey(),
                        'firstname' => Column::string(),
                        'lasstname' => Column::string(),
                        'appellation_code_id' => Column::foreignKey(),
                        'avatar_url_id' => Column::foreignKey(),
                        'email' => Column::string(),
                        'mobile' => Column::string(),
                        'receive_newsletter' => Column::boolean()
                ))->asArray();
    }

    public function before ($event = array())
    {
        return true;
    }

    public function after ($event = array())
    {}
}
