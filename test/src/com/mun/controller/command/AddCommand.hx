package com.mun.controller.command;

import com.mun.model.component.CircuitDiagramI;
import com.mun.model.component.Component;
import com.mun.model.component.Link;
import com.mun.type.Type.Object;
/**
* add command is used to process the add operation
* @author wanhui
**/
class AddCommand implements Command {
    var link:Link;
    var component:Component;
    var circuitDiagram:CircuitDiagramI;

    public function new(object:Object, circuitDiagram:CircuitDiagramI) {
        this.link = object.link;
        this.component = object.component;
        this.circuitDiagram = circuitDiagram;
    }

    public function undo():Void {
        if (link != null) {
            circuitDiagram.removeLink(link);
        }

        if (component != null) {
            circuitDiagram.removeComponent(component);
        }
    }

    public function redo():Void {
        execute();
    }

    public function execute():Void {
        if (link != null) {
            circuitDiagram.addLink(link);
        }

        if (component != null) {
            circuitDiagram.addComponent(component);
        }
    }
}
