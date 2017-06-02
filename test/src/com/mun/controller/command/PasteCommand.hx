package com.mun.controller.command;
import com.mun.type.Type.Object;
import com.mun.model.component.CircuitDiagramI;
import com.mun.model.component.Component;
import com.mun.model.component.Endpoint;
import com.mun.model.component.Link;
/**
* paste command
* @author wanhui
**/
class PasteCommand implements Command {
    var copyStack:Stack;
    var xPosition:Int;
    var yPosition:Int;
    var pasteStack:Stack;
    var circuitDiagram:CircuitDiagramI;
    var object:Object = {"link":null,"component":null,"endPoint":null, "port":null};

    public function new(copyStack:Stack, xPosition:Float, yPosition:Float, circuitDiagram:CircuitDiagramI) {
        this.copyStack = copyStack;
        this.xPosition = xPosition;
        this.yPosition = yPosition;
        this.circuitDiagram = circuitDiagram;
    }

    public function undo():Object {
        object = {"link":null,"component":null,"endPoint":null, "port":null};
        var linkArray:Array<Link> = pasteStack.getLinkArray();
        var componentArray:Array<Component> = pasteStack.getComponentArray();
        for (i in 0...linkArray.length) {
            circuitDiagram.removeLink(linkArray[i]);
        }

        for (i in 0...componentArray.length) {
            circuitDiagram.removeComponent(componentArray[i]);
        }
        //clear paste stack
        pasteStack.clearStack();
        return object;
    }

    public function redo():Object {
        object = {"link":null,"component":null,"endPoint":null, "port":null};
        execute();
        return object;
    }

    public function execute():Void {
        var linkArray = copyStack.getLinkArray();
        if (linkArray != null) {
            for (i in 0...linkArray.length) {
                object.link = calculateNewLinkCoordinate(linkArray[i], xPosition, yPosition);
                var command:Command = new AddCommand(object,circuitDiagram);
                circuitDiagram.get_commandManager().execute(command);
            }
        }

        var componentArray = copyStack.getComponentArray();
        if (componentArray != null) {
            for (i in 0...componentArray.length) {
                var component:Component = componentArray[i];
                var newComponent:Component = new Component(xPosition, yPosition, component.get_height(), component.get_width(), component.get_orientation(), component.get_componentKind(), component.get_inportsNum());
                object.component = component;
                var command:Command = new AddCommand(object,circuitDiagram);
                circuitDiagram.get_commandManager().execute(command);
                pasteStack.pushComponent(newComponent);
            }
        }

    }

    private function calculateNewLinkCoordinate(link:Link, xPosition:Float, yPosition:Float):Link {
        var newXPosition:Float;
        var newYPosition:Float;
        var xOffset:Float;
        var yOffset:Float;

        newXPosition = (link.get_leftEndpoint().get_xPosition() + link.get_rightEndpoint().get_xPosition()) / 2;
        newYPosition = (link.get_leftEndpoint().get_yPosition() + link.get_rightEndpoint().get_yPosition()) / 2;

        //compare
        xOffset = xPosition - newXPosition;
        yOffset = yPosition - newYPosition;

        var leftEndpoint:Endpoint = new Endpoint(link.get_leftEndpoint().get_xPosition() + xOffset, link.get_leftEndpoint().get_yPosition() + yOffset);
        var rightEndpoint:Endpoint = new Endpoint(link.get_rightEndpoint().get_xPosition() + xOffset, link.get_rightEndpoint().get_yPosition() + yOffset);
        var newLink:Link = new Link(leftEndpoint, rightEndpoint);
        pasteStack.pushLink(newLink);
        return newLink;
    }
}
