package com.mun.controller.componentUpdate;

import com.mun.view.drawComponents.DrawLink;
import com.mun.type.Type.Object;
import com.mun.type.Type.LinkAndComponentArray;
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
    public function update(?linkAndComponentArray:LinkAndComponentArray){
        var drawFlag:Bool = false;
        //clear the canvas
        canvas.width = canvas.width;
        //update component array
        for(i in circuitDiagram.get_componentIterator()){
            for(j in linkAndComponentArray.componentArray){
                if(j == i){
                    i.drawComponent(i, drawingAdapter, true);
                    drawFlag = true;
                }
            }

            if(!drawFlag){
                i.drawComponent(i, drawingAdapter, false);
            }

            drawFlag = false;
        }

        drawFlag = false;
        //update link array
        for(i in circuitDiagram.get_linkIterator()){
            var drawComponent:DrawComponent = new DrawLink(i, drawingAdapter);
            for(j in linkAndComponentArray.linkArray){
                if(j == i){
                    drawComponent.drawCorrespondingComponent("red");
                    drawFlag = true;
                }
            }

            if(!drawFlag){
                drawComponent.drawCorrespondingComponent("black");
            }
        }
    }

}
