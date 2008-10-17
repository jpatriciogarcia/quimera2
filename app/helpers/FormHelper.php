<?php
/**
 * Objeto IndexController.
 *
 * En este archivo se define la clase controladora para el Index.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

class FormHelper extends AppHelper {



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $autocompleter
	 * @param unknown_type $params
	 */
    public function inputText( $name='', $value='', $autocompleter=false, $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<input type='text' name='{$name}' id='{$name}' value='{$value}' {$p}/>";
        if ($autocompleter) {
            echo "<div id='results-{$name}' class='results' style='display: none'>";
        }
    }



    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $autocompleter
	 * @param unknown_type $params
	 */
    public function inputTextDate( $name='', $value='', $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        return "<input type='text' name='{$name}' id='{$name}' value='{$value}' {$p}/>";
    }



    /**
     * Enter description here...
     *
     * @param String $name
     * @param String $value
     * @param array $params
     */
    public function inputHidden( $name='', $value='', $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<input type='hidden' name='{$name}' id='{$name}' value='{$value}' {$p}/>";
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $params
	 */
    public function inputDateTime( $name='', $value='', $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<input type='text' name='{$name}' id='{$name}' readonly value='{$value}' {$p}/>";
        echo "
		<script>
    	function disableDateP( date, y, m, d ) {
    	   var isWeekEnd = (date.getDay() == 0 || date.getDay() == 6) ? true : false;
    	   var isPast = (d < " . date("d") . " && date.getMonth() <= " . (date("n")-1) . ") ? true : false;
    		return ( isWeekEnd || isPast ) ? true : false;
    		//false para habilitar todas las demas fechas y true para los domingos y festivos
    	}

	    Calendar.setup({
        inputField	: '{$name}',
        ifFormat	: '%d/%m/%Y %H:%M',
        showsTime	: true,
        weekNumbers	: false,
        date		: '".date('Y-m-d')."',
        range: [" . date('Y').", ".date('Y') . "],
        //dateStatusFunc: disableDateP
    	});
		</script>
		";
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $params
	 */
    public function inputDate( $name='', $value='', $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<input type='text' name='{$name}' id='{$name}' readonly value='{$value}' {$p}/>";
        echo "
		<script>
    	function disableDateP( date, y, m, d ) {
    	   var isWeekEnd = (date.getDay() == 0 || date.getDay() == 6) ? true : false;
    	   var isPast = (d < " . date("d") . " && date.getMonth() <= " . (date("n")-1) . ") ? true : false;
    		return ( isWeekEnd || isPast ) ? true : false;
    		//false para habilitar todas las demas fechas y true para los domingos y festivos
    	}

	    Calendar.setup({
        inputField	: '{$name}',
        ifFormat	: '%d/%m/%Y',
        showsTime	: true,
        weekNumbers	: false,
        date		: '".date('Y-m-d')."',
        range: [" . date('Y').", ".date('Y') . "],
        //dateStatusFunc: disableDateP
    	});
		</script>
		";
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $autocompleter
	 * @param unknown_type $params
	 */
    public function inputPassword( $name='', $value='', $autocompleter=false, $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<input type='password' name='{$name}' id='{$name}' value='{$value}' {$p}/>";
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $params
	 */
    public function inputCheckbox( $name='', $label='', $checked='', $params=array() ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        return "<input type='checkbox' name='{$name}' id='{$name}' {$checked} {$p}/><label for='{$name}'>{$label}</label>";
    }


    /**
	 * Enter description here...
	 *
	 * @param unknown_type $name
	 * @param unknown_type $value
	 * @param unknown_type $params
	 */
    public function textArea( $name='', $value='', $params=array('value'=>null) ) {
        array_walk($params, 'trim');

        $p = "" ;
        foreach ($params as $k => $v) {
            $p .= "$k='$v' ";
        }

        echo "<textarea name='{$name}' id='{$name}' {$p}>{$value}</textarea>";
    }


    /**
	 * Enter description here...
	 *
	 * @param String $name
	 * @param String $selected
	 * @param ADODB::ActiveRecord $Obj
	 * @param String $key
	 * @param String $value
	 * @param Array $params
	 * @return String
	 */
    public function selectBox( $name='', $selected='', $Obj, $key, $value, $firstBlank=true, $params=array() ) {

        $p = "" ;

        if (is_array($params)) {
            array_walk($params, 'trim');
            foreach ($params as $k => $v) {
                $p .= "$k='$v' ";
            }
        }


        $return = "<select name='{$name}' id='{$name}' {$p}>";
        if ($firstBlank) {
            $return .= "\n <option></option>";
        }
        foreach ($Obj as $Obj) {
            $return .= "\n <option value='{$Obj->$key}'"
            .($Obj->$value==$selected?" selected":"").">{$Obj->$value}</option>";
        }
        $return .= "\n</select>";

        return $return;
    }


    /**
	 * Enter description here...
	 *
	 * @param String $name
	 * @param String $selected
	 * @param ADODB::ActiveRecord $Obj
	 * @param String $key
	 * @param String $value
	 * @param Array $params
	 * @return String
	 */
    public function selectBoxMultiple( $name='', $selected=array(), $Obj, $key, $value, $firstBlank=true, $params=array() ) {

        $p = "" ;

        if (is_array($params)) {
            array_walk($params, 'trim');
            foreach ($params as $k => $v) {
                $p .= "$k='$v' ";
            }
        }


        $return = "<select multiple='multiple' name='{$name}[]' id='{$name}' {$p} class='textarea'>";
        if ($firstBlank) {
            $return .= "\n <option></option>";
        }
        foreach ($Obj as $Obj) {
            $return .= "\n <option value='{$Obj->$key}'"
            .( in_array($Obj->$value, $selected)?" selected":"").">{$Obj->$value}</option>";
        }
        $return .= "\n</select>";

        return $return;
    }


}

?>