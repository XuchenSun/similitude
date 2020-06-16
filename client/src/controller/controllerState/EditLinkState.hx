package controller.controllerState;
import controller.commandManager.EditLinkCommand;
import controller.listenerInterfaces.CanvasListener;
import model.component.Endpoint;
import model.similitudeEvents.AbstractSimilitudeEvent;
import model.similitudeEvents.EventTypesEnum;
import model.similitudeEvents.CanvasMouseMoveEvent;
import type.Coordinate;

/**
 * ...
 * @author AdvaitTrivedi
 */
class EditLinkState implements ControllerStateI
{
	var linkEndpoint: Endpoint;

	public function new(endpoint: Endpoint) 
	{
		this.linkEndpoint = endpoint;
	}
	
	public function operate(canvasListener: CanvasListener, event: AbstractSimilitudeEvent) : Void {
		if (event.getEventType() == EventTypesEnum.CANVAS_MOUSE_MOVE) {
			var canvasMouseMoveEvent = Std.downcast(event, CanvasMouseMoveEvent);
			var circuitDiagram = canvasListener.getActiveTab().getCircuitDiagram() ;
			canvasListener.getModelManipulator().editLink(circuitDiagram, this.linkEndpoint, canvasMouseMoveEvent.xPosition, canvasMouseMoveEvent.yPosition, true);
			canvasListener.setState(this);
		} else if (event.getEventType() == EventTypesEnum.CANVAS_MOUSE_UP) {
			canvasListener.getModelManipulator().normalise(canvasListener.getActiveTab().getCircuitDiagram(), true) ;
			canvasListener.setState(new CanvasIdleState());
		} else {
			trace("Unknown transition");
		}
	}
	
}