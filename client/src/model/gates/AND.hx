package model.gates;

import model.drawComponents.DrawAND;
import model.drawComponents.DrawComponent;
import model.drawingInterface.DrawingAdapterI;
import model.selectionModel.SelectionModel ;
import model.component.Component ;
import model.component.Port;
import model.enumeration.IOTYPE;
import model.enumeration.Orientation;
/**
 * AND gate<br>
 * Truth Table
 * <br>
 * <pre>
 * *******************************
 * *|input 1 | input 2 | output |*<br>
 * *|   1    |    1    |    1   |*<br>
 * *|   0    |    1    |    0   |*<br>
 * *|   1    |    0    |    0   |*<br>
 * *|   0    |    0    |    0   |*<br>
 * *******************************
 *  </pre>
 * @author wanhui
 *
 */
class AND implements ComponentKind extends AbstractGate implements ComponentKind{

    public function new() {
        super("AND") ;
    }

    public function drawComponent(component : Component, drawingAdapter:DrawingAdapterI, highlight:Bool, selection : SelectionModel ){
        var drawComponent:DrawAND = new DrawAND(component, drawingAdapter, highlight);
        drawComponent.drawCorrespondingComponent();
    }

}
