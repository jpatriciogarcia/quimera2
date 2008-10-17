<?php
/**
 * Objeto FamiliarView.
 *
 * En este archivo se define la clase para la presentacion del programa.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

error_reporting(0);

class ReporteCalendarioView {

    /**
     * Lista todos los programas a partir de un objeto
     * ActiveRecord::CentroFamiliar
     *
     * @param Actividad $Actividad
     */
    public function index( $definitions ) {

        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        // THIS IS THE BEGINNING OF YOUR CHART SETTINGS
        //global definitions to graphic
        // change to you project data/needs
        $definitions['title_string'] = "Proyecto Asociatividad y Participacion"; //project title
        $definitions['locale'] = "es_CL";//change to language you need -> en = english, pt_BR = Brazilian Portuguese etc
        //define the scale of the chart
        $definitions['limit']['detail'] = 'd'; //w week, m month , d day

        //define data information about the graphic. this limits will be adjusted in month and week scales to fit to
        //start of month of start date and end of month in end date, when the scale is month
        // and to start of week of start date and end of week in the end date, when the scale is week
        $definitions['limit']['start'] = mktime(0,0,0,9,10,2008); //these settings will define the size of
        $definitions['limit']['end'] = mktime(0,0,0,9,25,2008); //graphic and time limits

        // define the data to draw a line as "today"
        $definitions['today']['data']= mktime(0,0,0,9,15,2008); //time();//draw a line in this date

        // define the data to draw a line as "last status report"
        $definitions['status_report']['data']= mktime(0,0,0,9,20,2008); //time();//draw a line in this date
        //
        //////////////////////////////////////////////////////////////////////////////////////////////////////

        ///////////////////////////////////////////////////////////////////////////////////////////////////////
        // use loops to define these variables with database data

        // you need to set groups to graphic be created
        $definitions['groups']['group'][0]['name'] = "Programa Infancia";
        //$definitions['groups']['group'][0]['start'] = mktime(0,0,0,3,1,2008);
        //$definitions['groups']['group'][0]['end'] = mktime(0,0,0,7,31,2008);

        // increase the number to add another group
        /*
        $definitions['groups']['group'][1]['name'] = "Group Two";
        $definitions['groups']['group'][1]['start'] = mktime(0,0,0,12,28,2008);
        $definitions['groups']['group'][1]['end'] = mktime(0,0,0,2,27,2008);
        */

        // you need to set a group to every phase(=phase) to show it rigth
        // 'group'][0] -> 0 is the number of the group to associate phases
        // ['phase'][0] = 0; 0 and 0 > the same value -> is the number of the phase to associate to group
        $definitions['groups']['group'][0]['phase'][0] = 0;
        //$definitions['groups']['group'][1]['phase'][1] = 1;

        //you have to set planned phase name even when show only planned adjusted
        $definitions['planned']['phase'][0]['name'] = 'Actividad Demo Quimera';

        //define the start and end of each phase. Set only what you want/need to show. Not defined values will not draws bars
        $definitions['planned']['phase'][0]['start'] = mktime(0,0,0,9,15,2008);
        $definitions['planned']['phase'][0]['end'] = mktime(0,0,0,19,9,2008);
        $definitions['planned_adjusted']['phase'][0]['start'] = mktime(0,0,0,9,15,2008);
        $definitions['planned_adjusted']['phase'][0]['end'] = mktime(0,0,0,9,20,2008);
        $definitions['real']['phase'][0]['start'] = mktime(0,0,0,9,15,2008);
        $definitions['real']['phase'][0]['end'] = mktime(0,0,0,9,20,2008);

        //define a percentage/progress to phase. Set only if you want.
        //$definitions['progress']['phase'][0]['progress']=70;

        //Example of a second phase.
        //$definitions['planned']['phase'][1]['name'] = 'task xyz';
        //$definitions['planned']['phase'][1]['start'] = mktime(0,0,0,1,14,2008);
        //$definitions['planned']['phase'][1]['end'] = mktime(0,0,0,2,23,2008);
        //$definitions['planned_adjusted']['phase'][1]['start'] = mktime(0,0,0,1,1,2008);
        //$definitions['planned_adjusted']['phase'][1]['end'] = mktime(0,0,0,1,12,2008);
        //$definitions['real']['phase'][1]['start'] = mktime(0,0,0,1,23,2008);
        //$definitions['real']['phase'][1]['end'] = mktime(0,0,0,2,27,2008);
        //$definitions['progress']['phase'][1]['progress']=30;

        //////////////////////////////////////////////////////////////////////////
        //dependencies to planned array -> type can be END_TO_START, START_TO_START, END_TO_END and START_TO_END

        //$definitions['dependency_planned'][0]['type']= END_TO_START;
        //$definitions['dependency_planned'][0]['phase_from']=0;
        //$definitions['dependency_planned'][0]['phase_to']=1;

        //Examples of another types of dependencies
        /*
        $definitions['dependency_planned'][1]['type']= START_TO_START;
        $definitions['dependency_planned'][1]['phase_from']=0;
        $definitions['dependency_planned'][1]['phase_to']=1;

        $definitions['dependency_planned'][2]['type']= END_TO_END;
        $definitions['dependency_planned'][2]['phase_from']=0;
        $definitions['dependency_planned'][2]['phase_to']=1;

        $definitions['dependency_planned'][3]['type']= START_TO_END;
        $definitions['dependency_planned'][3]['phase_from']=0;
        $definitions['dependency_planned'][3]['phase_to']=1;
        */

        //////////////////////////////////////////////////////////////////////////
        //dependencies to adjusted planned array -> type can be END_TO_START, START_TO_START, END_TO_END and START_TO_END

        /*
        $definitions['dependency'][0]['type']= END_TO_START;
        $definitions['dependency'][0]['phase_from']=0;
        $definitions['dependency'][0]['phase_to']=1;
        // another examples of dependencies
        /*
        $definitions['dependency'][1]['type']= START_TO_START;
        $definitions['dependency'][1]['phase_from']=0;
        $definitions['dependency'][1]['phase_to']=1;
        */
        //$definitions['dependency'][2]['type']= END_TO_END;
        //$definitions['dependency'][2]['phase_from']=0;
        //$definitions['dependency'][2]['phase_to']=1;
        /*
        $definitions['dependency'][3]['type']= START_TO_END;
        $definitions['dependency'][3]['phase_from']=0;
        $definitions['dependency'][3]['phase_to']=1;
        */

        ///////////////////////////////////////////////////////////////////////////
        // milestones are products or objectives of project. Set if you want. In this case, you need to set
        // a data, a title and a group to each milestone
        $definitions['milestones']['milestone'][0]['data']= mktime(0,0,0,9,20,2008);
        $definitions['milestones']['milestone'][0]['title']='Entrega del Proyecto';
        //define a group to milestone
        $definitions['groups']['group'][0]['milestone'][0]=0; //need to set a group to show

        ////
        /////////////////////////////////////////////////////////////////

        /////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////////////////////////
        // THE END -> generate the graphic
        // TO SET THE KIND OF GRAFIC GENERATED

        $definitions['image']['type']= 'png'; // can be png, jpg, gif  -> if not set default is png
        //$definitions['image']['filename'] = "file.ext"'; // can be set if you prefer save image as a file
        $definitions['image']['jpg_quality'] = 100; // quality value for jpeg imagens -> if not set default is 100

        new gantt($definitions);
    }


}

?>
