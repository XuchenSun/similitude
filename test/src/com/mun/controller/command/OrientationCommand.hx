package com.mun.controller.command;

import com.mun.model.component.CircuitDiagramI;
import com.mun.model.component.Component;
import com.mun.model.enumeration.Orientation;
/**
* change the Orientation
* @author wanhui
**/
class OrientationCommand implements Command {
    var component:Component;
    var circuitDiagram:CircuitDiagramI;
    var newOrientation:Orientation;
    var oldOrientation:Orientation;

    public function new(component:Component, oldOrientation:Orientation, newOrientation:Orientation, circuitDiagram:CircuitDiagramI) {
        this.component = component;
        this.circuitDiagram = circuitDiagram;
        this.oldOrientation = oldOrientation;
    }

    public function undo():Void {
        circuitDiagram.SetNewOirentation(component, oldOrientation);
    }

    public function redo():Void {
        execute();
    }

    public function execute():Void {
        circuitDiagram.SetNewOirentation(component, newOrientation);
    }
}
