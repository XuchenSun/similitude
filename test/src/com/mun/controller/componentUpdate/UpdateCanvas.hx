package com.mun.controller.componentUpdate;

import com.mun.type.Type.Object;
import com.mun.view.drawComponents.DrawComponent;
import com.mun.model.drawingInterface.DrawingAdapterI;
import com.mun.model.component.CircuitDiagram;
import js.html.CanvasElement;
import com.mun.view.drawComponents.DrawLink;
//all of those imports below can not be deleted, because of using Type.resolveClass
//include all of the class under com.mun.view.drawComponents
import com.mun.view.drawComponents.DrawAND;
import com.mun.view.drawComponents.DrawFlipFlop;
import com.mun.view.drawComponents.DrawInput;
import com.mun.view.drawComponents.DrawMUX;
import com.mun.view.drawComponents.DrawNAND;
import com.mun.view.drawComponents.DrawNOR;
import com.mun.view.drawComponents.DrawNOT;
import com.mun.view.drawComponents.DrawOR;
import com.mun.view.drawComponents.DrawOutput;
import com.mun.view.drawComponents.DrawXOR;
//the above imports shouldn't be deleted

class UpdateCanvas {
    var canvas:CanvasElement;
    var circuit:CircuitDiagram;
    var drawingAdapter:DrawingAdapterI;

    public function new(canvas:CanvasElement,circuitDiagram:CircuitDiagram,drawingAdapter:DrawingAdapterI) {
        this.canvas = canvas;
        this.circuit = circuitDiagram;
        this.drawingAdapter = drawingAdapter;
    }
    public function getcircuit():CircuitDiagram{
        return circuit;
    }

    public function update(?object:Object){
        //clear the canvas
        canvas.width = canvas.width;
        //update component array
        for(i in 0...circuit.get_componentArray().length){
            var drawComponent:DrawComponent = Type.createInstance(Type.resolveClass("com.mun.view.drawComponents.Draw" + circuit.get_componentArray()[i].getNameOfTheComponentKind()),[circuit.get_componentArray()[i],drawingAdapter]);
            if(object != null && object.component != null && object.component == circuit.get_componentArray()[i]){
                drawComponent.drawCorrespondingComponent("red");
            }else{
                drawComponent.drawCorrespondingComponent("black");
            }

        }
        //update link array
        for(i in 0...circuit.get_linkArray().length){
            var drawComponent:DrawComponent = new DrawLink(circuit.get_linkArray()[i], drawingAdapter);
            if(object != null && object.link != null && object.link == circuit.get_linkArray()[i]){
                drawComponent.drawCorrespondingComponent("red");
            }else{
                drawComponent.drawCorrespondingComponent("black");
            }
        }
    }

}
