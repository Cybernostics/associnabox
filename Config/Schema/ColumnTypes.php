<?php


class Column implements ArrayAccess {
    private $container = array();
    
    public function &asArray(){
        return $this->container;
    }
    
    public static function with(){
        return new Column();
    }

    public function __construct($type) {
        $this->container = array(
            'null' => null, 
            'default' => null,
            'type'=>$type    
        );
    }
    
    public function get(){
        return $this->container;
    }

    public function offsetSet($offset, $value) {
        if (is_null($offset)) {
            $this->container[] = $value;
        } else {
            $this->container[$offset] = $value;
        }
    }

    public function offsetExists($offset) {
        return isset($this->container[$offset]);
    }

    public function offsetUnset($offset) {
        unset($this->container[$offset]);
    }

    public function offsetGet($offset) {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }
    
    public static function integer(){
        return new Column('integer');
    }

    public static function decimal(){
        return new Column('decimal');
    }

    public static function datetime(){
        return new Column('datetime');
    }

    public static function boolean(){
        return new Column('boolean');
    }

    public static function url(){
        return self::string();
    }

    public static function string(){
        return new Column('string');
    }

    public static function text(){
        return new Column('text');
    }

    public static function amount(){
        return self::decimal()->length('10.2')->withDefault('0.00');
    }

    public static function foreignKey(){
        return self::integer()->unsigned();
    }

    public static function primaryKey(){
        $col = self::integer()->unsigned();
        $col['key']='primary';
        return $col;
    }
    
    public function comment($value){
        $this->container['comment']=$value;
        return $this;
    }
    
    public function length($value){
        $this->container['length']=$value;
        return $this;
    }
    
    public function required(){
        return $this->optional(false);
    }


    public function unsigned(){
        $this->container['unsigned'] = 'true';
        return $this;
    }

    public function optional($isOptional=true){
        $this->container['null']=$isOptional;
        return $this;
            }

    public function withDefault($val=''){
        $this->container['default']=$val;
        return $this;
    }
    
}

class TableDef implements ArrayAccess{

    private $container = array();
    
    public function asArray(){
        
        foreach ($this->container as $key => $column){
            if ($column instanceof Column) {
                $this->container[$key]=$column->asArray();
            }
        }
        return $this->container;
    }

    public function offsetSet($offset, $value) {
        if (is_null($offset)) {
            $this->container[] = $value;
        } else {
            $this->container[$offset] = $value;
        }
    }
    
    public function offsetExists($offset) {
        return isset($this->container[$offset]);
    }
    
    public function offsetUnset($offset) {
        unset($this->container[$offset]);
    }
    
    public function offsetGet($offset) {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }
    
    public static function stdCakeTable($tableOptions=array(), $indexOptions=array()){
        $table = new TableDef();
        $table['id']=Column::primaryKey();
        $table['created'] = Column::dateTime();
        $table['modified'] = Column::dateTime();
        $table['tableParameters']= array_merge(array('charset' => 'utf8', 'engine' => 'InnoDB'), $tableOptions);
        $indexes = array();
        $indexes['PRIMARY'] = array('column' => 'id', 'unique' => 1);
        $table['indexes'] = array_merge($indexes,$indexOptions);
        
        return $table;
    }
    
    public function column($name,$definition){
        $this->container[$name]=$definition;
        return $this;
    }

    public function withColumns($columns){
        $this->container = array_merge($this->container,$columns);
//         print_r($this->container);
//         exit(0);
        return $this;
    }
}
