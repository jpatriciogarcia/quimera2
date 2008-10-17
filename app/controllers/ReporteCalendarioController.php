<?php
/**
 * Objeto ReporteUsuariosTotalesController.
 *
 * En este archivo se define la clase controladora para los reportes ReporteUsuariosTotalesController.
 * @author JGG <jgarcigo@yahoo.es>
 * @version 1.0
 * @package Clases
 */

error_reporting(0);

class ReporteCalendarioController {

    /**
     * Enter description here...
     *
     */
    function __construct() {
        //parent::__construct();
    }

    /**
     * Enter description here...
     *
     */
    public function index() {
        /*
        $sch = new Schedule();
        $sch->LoadXmlFile(realpath('public/xml/test.xml'));
        // change size of image
        $sch->width = 800;
        $sch->height = 400;
        // now draw ;)
        $sch->Draw();
        */
        $definitions['title_y'] = 10; // absolute vertical position in pixels -> title string
        $definitions['planned']['y'] = 6; // relative vertical position in pixels -> planned/baseline
        $definitions['planned']['height']= 18; // height in pixels -> planned/baseline
        $definitions['planned_adjusted']['y'] = 35; // relative vertical position in pixels -> adjusted planning
        $definitions['planned_adjusted']['height']= 18; // height in pixels -> adjusted planning
        $definitions['real']['y']= 39; // relative vertical position in pixels -> real/realized time
        $definitions['real']['height'] = 10; // height in pixels -> real/realized time
        $definitions['progress']['y']=11; // relative vertical position in pixels -> progress
        $definitions['progress']['height']=2; // height in pixels -> progress
        $definitions['img_bg_color'] = array(204, 204, 255); //color of background
        $definitions['title_color'] = array(255, 255, 255); //color of title
        $definitions['text']['color'] = array(0, 0, 0); //color of title
        $definitions['title_bg_color'] = array(0, 0, 128); //color of background of title
        $definitions['milestone']['title_bg_color'] = array(204, 204, 230); //color of background of title of milestone
        $definitions['today']['color']=array(0, 0, 200); //color of today line
        $definitions['status_report']['color']=array(255, 50, 0); //color of last status report line
        $definitions['real']['hachured_color']=array(204,0, 0);// color of hachured of real. to not have hachured, set to same color of real
        $definitions['workday_color'] = array(255, 255, 255	); //white -> default color of the grid to workdays
        $definitions['grid_color'] = array(218, 218, 218); //default color of weekend days in the grid
        $definitions['groups']['color'] = array(0, 0, 0);// set color of groups
        $definitions['groups']['bg_color'] = array(180,180, 180);// set color of background to groups title
        $definitions['planned']['color']=array(255, 143, 4);// set color of initial planning/baseline
        $definitions['planned_adjusted']['color']=array(0, 0, 204); // set color of adjusted planning
        $definitions['real']['color']=array(255, 255,255);//set color of work done
        $definitions['progress']['color']=array(0,255,0); // set color of progress/percentage completed
        $definitions['milestones']['color'] = array(254, 54, 50); //set the color to milestone icon

        //if you want a ttf font set this values
        // just donwload a ttf font and set the path
        // find ttf fonts at http://www.webpagepublicity.com/free-fonts.html -> more than 6500 free fonts
        //$definitions['text']['ttfont']['file'] = './Arial.ttf'; // set path and filename of ttf font -> coment to use gd fonts
        //$definitions['text']['ttfont']['size'] = '11'; // used only with ttf
        //define font colors
        //$definitions['title']['ttfont']['file'] = './ActionIs.ttf'; // set path and filename of ttf font -> coment to use gd fonts
        //$definitions['title']['ttfont']['size'] = '11'; // used only with ttf

        // these are default value if not set a ttf font
        $definitions['text_font'] = 3; //define the font to text -> 1 to 4 (gd fonts)
        $definitions['title_font'] = 3;  //define the font to title -> 1 to 4 (gd fonts)

        //define font colors
        $definitions["group"]['text_color'] = array(255,104,104);
        $definitions["legend"]['text_color'] = array(104,04,104);
        $definitions["milestone"]['text_color'] = array(204,04,104);
        $definitions["phase"]['text_color'] = array(0,0,0);


        // set to 1 to a continuous line
        $definitions['status_report']['pixels'] = 15; //set the number of pixels to line interval
        $definitions['today']['pixels'] = 10; //set the number of pixels to line interval



        // set colors to dependency lines -> both  dependency planned(baseline) and dependency (adjusted planning)
        $definitions['dependency_color'][END_TO_START]=array(0, 0, 0);//black
        $definitions['dependency_color'][START_TO_START]=array(0, 0, 0);//black
        $definitions['dependency_color'][END_TO_END]=array(0, 0, 0);//black
        $definitions['dependency_color'][START_TO_END]=array(0, 0, 0);//black

        //set the alpha (tranparency) to colors of bars/icons/lines
        $definitions['planned']['alpha'] = 40; //transparency -> 0-100
        $definitions['planned_adjusted']['alpha'] = 40; //transparency -> 0-100
        $definitions['real']['alpha'] = 0; //transparency -> 0-100
        $definitions['progress']['alpha'] = 0; //transparency -> 0-100
        $definitions['groups']['alpha'] = 40; //transparency -> 0-100
        $definitions['today']['alpha']= 80; //transparency -> 0-100
        $definitions['status_report']['alpha']= 10; //transparency -> 0-100
        $definitions['dependency']['alpha']= 80; //transparency -> 0-100
        $definitions['milestones']['alpha']= 40; //transparency -> 0-100

        // set the legends strings
        $definitions['planned']['legend'] = 'Plan Inicial';
        $definitions['planned_adjusted']['legend'] = 'Plan Ajustado';
        $definitions['real']['legend'] = 'Progeso Real';
        $definitions['progress']['legend'] = 'Progreso';
        $definitions['milestone']['legend'] = 'Hito';
        $definitions['today']['legend'] = 'Hoy';
        $definitions['status_report']['legend'] = 'Ultimo estado de situacion';

        //set the size of each day in the grid for each scale
        $definitions['limit']['cell']['m'] = '4'; // size of cells (each day)
        $definitions['limit']['cell']['w'] = '8'; // size of cells (each day)
        $definitions['limit']['cell']['d'] = '20';// size of cells (each day)

        //set the initial positions of the grid (x,y)
        $definitions['grid']['x'] = 180; // initial position of the grix (x)
        $definitions['grid']['y'] = 40; // initial position of the grix (y)

        //set the height of each row of phases/phases -> groups and milestone rows will have half of this height
        $definitions['row']['height'] = 70; // height of each row

        $definitions['legend']['y'] = 85; // initial position of legent (height of image - y)
        $definitions['legend']['x'] = 150; // distance between two cols of the legend
        $definitions['legend']['y_'] = 35; //distance between the image bottom and legend botton
        $definitions['legend']['ydiff'] = 20; //diference between lines of legend

        //other settings
        $definitions['progress']['bar_type']='planned'; //  if you want set progress bar on planned bar (the x point), if not set, default is on planned_adjusted bar -> you need to adjust $definitions['progress']['y'] to progress y stay over planned bar or whatever you want;
        $definitions["not_show_groups"] = true; // if set to true not show groups, but still need to set phases to a group
        ///
        //////////////////////////////////////////////////////////////////////////////////////////////////////

        ReporteCalendarioView::index( $definitions );
    }


}

?>