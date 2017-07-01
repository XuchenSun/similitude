package com.mun.model.component;
import com.mun.model.enumeration.POINT_MODE;
import com.mun.type.Type.LinkAndComponentArray;
import com.mun.type.Type.Coordinate;
import com.mun.type.Type.WorldPoint;
import com.mun.type.Type.LinkAndComponentAndEndpointAndPortArray;
import com.mun.model.enumeration.MODE;
import com.mun.model.drawingInterface.DrawingAdapterI;
import com.mun.controller.command.CommandManager;
import com.mun.model.enumeration.Orientation;
/**
* interface for CicuitDiagram
**/
interface CircuitDiagramI {
    /**
    * @@:getter get command manager
    **/
    public function get_commandManager():CommandManager;

    /**
    * @@:setter set command manager
    **/
    public function set_commandManager(value:CommandManager):Void;

    /**
    * @:getter component array from the circuit diagram
     * @return the iterator
    **/
    public function get_componentIterator():Iterator<Component>;

    /**
    * reverse iterator for componenent array
    **/
    public function get_componentReverseIterator():Iterator<Component>;

    /**
    * reverse iterator for link array
    **/
    public function get_linkReverseIterator():Iterator<Link>;

    /**
    * @:getter link array from the circuit diagram
     * @return the iterator
    **/
    public function get_linkIterator():Iterator<Link>;

    /**
    * @:getter the name of the circuit diagram
    * @return the name
    **/
    public function get_name():String;

    /**
    * @:setter the name of the circuit diagram
    **/
    public function set_name(value:String):Void;

    /**
    * get the drawing adapter
    **/
    public function get_drawingAdapter():DrawingAdapterI;

    /**
    * set the drawing adapter
    **/
    public function set_drawingAdapter(drawingAdapter:DrawingAdapterI):Void;

    /**
    * add one link
    **/
    public function addLink(link:Link):Void;

    /**
    * add one component
    **/
    public function addComponent(component:Component):Void;

    /**
    * remove one link
    **/
    public function removeLink(link:Link):Void;

    /**
    * remove one component
    **/
    public function removeComponent(component:Component):Void;

    /**
    * clear the copy stack
    **/
    public function clearCopyStack():Void;

    /**
    * push link to the copy stack
    **/
    public function pushLinkToCopyStack(link:Link):Void;

    /**
    * push component to the copy stack
    **/
    public function pushComponentToCopyStack(component:Component):Void;

    /**
    * set new orientation for one component
    **/
    public function setNewOirentation(component:Component, newOrientation:Orientation):Void;

    /**
    * delete one link
    **/
    public function deleteLink(link:Link):Void;

    /**
    * delete one component
    **/
    public function deleteComponent(component:Component):Void;

    /**
    * link need to update the enpdoint position by itself
    **/
    public function linkArraySelfUpdate():Void;

    /**
    * set name for component
    **/
    public function componentSetName(component:Component, name:String):Void;

    /**
    * compute the size of this diagram
    * note: the size of this diagram changed only happens in two suitutions
    *       1. add a component
    *       2. move a component (significant slow down the performance)
    *            because there is no way to track the change for every component, so make this function public.
    **/
    public function computeDiagramSize():Void;

    /**
    * get the width of this diagram
    **/
    public function get_diagramWidth():Float;

    /**
    * get the height of this diagram
    **/
    public function get_diagramHeight():Float;

    /**
    * get min x
    **/
    public function get_xMin():Float;

    /**
    * get min y
    **/
    public function get_yMin():Float;

    /**
    * get x max
    **/
    public function get_xMax():Float;

    /**
    * get y max
    **/
    public function get_yMax():Float;

    /**
    * draw the circuit diagram itself
    **/
    public function draw(?linkAndComponentArray:LinkAndComponentArray):Void;

    /**
    * find the hit list
    **/
    public function findHitList(coordinate:Coordinate, mode:MODE):LinkAndComponentAndEndpointAndPortArray;

    /**
    * find the world points
    **/
    public function findWorldPoint(worldCoordinate:Coordinate, mode:POINT_MODE):Array<WorldPoint>;
}
