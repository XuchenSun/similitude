package controller.controllerState;
import controller.commandManager.AddToSelectionCommand;
import controller.commandManager.MoveSelectionCommand;
import controller.listenerInterfaces.CanvasListener;
import model.component.CircuitElement;
import model.similitudeEvents.CanvasMouseMoveEvent;
import model.similitudeEvents.AbstractSimilitudeEvent;
import model.similitudeEvents.EventTypesEnum;

/**
 * ...
 * @author AdvaitTrivedi
 */
class AddToSelectionState implements ControllerStateI
{
	var clickedObjects: Array<CircuitElement>;
	var xPosition: Float;
	var yPosition: Float;
	
	public function new(passedObject: Array<CircuitElement>, xOnClick: Float, yOnClick: Float)
	{
		this.clickedObjects = passedObject;
		this.xPosition = xOnClick;
		this.yPosition = yOnClick;
	}
	
	public function operate(canvasListener: CanvasListener, event: AbstractSimilitudeEvent) {
		if (event.getEventType() == EventTypesEnum.CANVAS_MOUSE_MOVE) {
			var canvasMouseMoveEvent = Std.downcast(event, CanvasMouseMoveEvent);
			var activeTab = canvasListener.getActiveTab();
			var moveSelectionCommand = new MoveSelectionCommand(activeTab.getCircuitDiagram(), activeTab.getSelectionModel(), this.xPosition, this.yPosition, canvasMouseMoveEvent.xPosition, canvasMouseMoveEvent.yPosition);
			canvasListener.getCommandManager().executeCommand(moveSelectionCommand, true);
			canvasListener.setState(new MoveSelectionState(canvasMouseMoveEvent.xPosition, canvasMouseMoveEvent.yPosition));
		} else if (event.getEventType() == EventTypesEnum.CANVAS_MOUSE_UP) {
			var activeTab = canvasListener.getActiveTab();
			for (object in this.clickedObjects) {
				canvasListener.getCommandManager().executeCommand(new AddToSelectionCommand(activeTab.getCircuitDiagram(), activeTab.getSelectionModel(), object));
			};
			canvasListener.setState(new CanvasIdleState());
		} else {
			trace("Unknown transition");
		}
	}
	
}