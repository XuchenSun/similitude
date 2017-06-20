package com.mun.controller.mouseAction;

import com.mun.model.component.Component;
import js.Browser;
import com.mun.controller.componentUpdate.UpdateCircuitDiagram;
import com.mun.model.drawingInterface.DrawingAdapterI;
import com.mun.model.enumeration.Orientation;
class ButtonClick {
    var drawingAdapter:DrawingAdapterI;
    var updateCircuitDiagram:UpdateCircuitDiagram;
    var pixelRatio:Int;
    var canvasListener:CanvasListener;
    var component:Component;

    public function new(drawingAdapter:DrawingAdapterI,updateCircuitDiagram:UpdateCircuitDiagram, pixelRatio:Int, canvasListener:CanvasListener) {
        this.drawingAdapter = drawingAdapter;
        this.updateCircuitDiagram = updateCircuitDiagram;
        this.pixelRatio = pixelRatio;
        this.canvasListener = canvasListener;

        Browser.document.getElementById("AND").onclick = andOnClick;
        Browser.document.getElementById("FlipFlop").onclick = flipFlopOnClick;
        Browser.document.getElementById("INPUT").onclick = inputOnClick;
        Browser.document.getElementById("MUX").onclick = muxOnClick;
        Browser.document.getElementById("NAND").onclick = nandOnClick;
        Browser.document.getElementById("NOR").onclick = norOnClick;
        Browser.document.getElementById("NOT").onclick = notOnClick;
        Browser.document.getElementById("OR").onclick = orOnClick;
        Browser.document.getElementById("OUTPUT").onclick = outputOnClick;
        Browser.document.getElementById("XOR").onclick = xorOnClick;
    }

    public function andOnClick(){
        component = updateCircuitDiagram.createComponent("AND",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function flipFlopOnClick(){
        component = updateCircuitDiagram.createComponent("FlipFlop",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function inputOnClick(){
        component = updateCircuitDiagram.createComponent("Input",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function muxOnClick(){
        component = updateCircuitDiagram.createComponent("MUX",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function nandOnClick(){
        component = updateCircuitDiagram.createComponent("NAND",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function norOnClick(){
        component = updateCircuitDiagram.createComponent("NOR",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function notOnClick(){
        component = updateCircuitDiagram.createComponent("NOT",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function orOnClick(){
        component = updateCircuitDiagram.createComponent("OR",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function outputOnClick(){
        component = updateCircuitDiagram.createComponent("Output",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    public function xorOnClick(){
        component = updateCircuitDiagram.createComponent("XOR",250, 50, 40 * pixelRatio, 40 * pixelRatio, Orientation.EAST, 2);
        canvasListener.setButtonClick(component);
    }
    
    public function getComponemt():Component{
        return component;
    }
}
