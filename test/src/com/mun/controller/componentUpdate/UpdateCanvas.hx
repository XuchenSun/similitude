package com.mun.controller.componentUpdate;

import com.mun.view.drawComponents.DrawLink;
import com.mun.type.Type.Object;
import com.mun.view.drawComponents.DrawComponent;
import com.mun.model.drawingInterface.DrawingAdapterI;
import com.mun.model.component.CircuitDiagramI;
import js.html.CanvasElement;
/**
* update the canvas
**/
class UpdateCanvas {
    var canvas:CanvasElement;
    var circuitDiagram:CircuitDiagramI;
    var drawingAdapter:DrawingAdapterI;

    public function new(canvas:CanvasElement,circuitDiagram:CircuitDiagramI,drawingAdapter:DrawingAdapterI) {
        this.canvas = canvas;
        this.circuitDiagram = circuitDiagram;
        this.drawingAdapter = drawingAdapter;
    }
    public function update(?object:Object){
        //clear the canvas
        canvas.width = canvas.width;
        //update component array
        for(i in 0...circuitDiagram.get_componentArray().length){
            if(object != null && object.component != null && object.component == circuitDiagram.get_componentArray()[i]){
                circuitDiagram.get_componentArray()[i].drawComponent(circuitDiagram.get_componentArray()[i], drawingAdapter, true);
            }else{
                circuitDiagram.get_componentArray()[i].drawComponent(circuitDiagram.get_componentArray()[i], drawingAdapter, false);
            }
        }
        //update link array
        for(i in 0...circuitDiagram.get_linkArray().length){
            var drawComponent:DrawComponent = new DrawLink(circuitDiagram.get_linkArray()[i], drawingAdapter);
            if(object != null && object.link != null && object.link == circuitDiagram.get_linkArray()[i]){
                drawComponent.drawCorrespondingComponent("red");
            }else{
                drawComponent.drawCorrespondingComponent("black");
            }
        }
    }

}
