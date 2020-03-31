package controller.controllers;
import controller.commandManager.AddComponentCommand;
import controller.commandManager.CommandManager;
import controller.commandManager.PanCanvasCommand;
import controller.controllers.AbstractController;
import controller.listenerInterfaces.CanvasListener;
import model.component.CircuitDiagram;
import model.component.Component;
import model.enumeration.ComponentType;
import model.enumeration.ORIENTATION;
import model.similitudeEvents.CanvasPanEvent;
import model.similitudeEvents.SidebarDragAndDropEvent;
// import js.html.Console;

/**
 * ...
 * @author ...
 */
class CanvasController extends AbstractController implements CanvasListener
{
	var commandManager = new CommandManager();
	var componentTypesSingleton = new ComponentTypes(new CircuitDiagram());
	
	public function new() 
	{
		
	}
	
	override public function update(a:String):Void {
		this.viewUpdater.updateView("The element that was added to the canvas div is :: " + a );
	}
	
	public function addComponentToCanvas(eventObject: SidebarDragAndDropEvent) : Void {
		trace('AAAA', eventObject.component);
		// create and execute a command here 
		// Type.createEnum(ComponentType, eventObject.component)
		var component = new Component(eventObject.draggedToX, eventObject.draggedToY, 25, 25, ORIENTATION.EAST, componentTypesSingleton.toComponentKind(eventObject.component), 0);
		var addComponentCommand = new AddComponentCommand(this.activeTab.getCircuitDiagram(), component);
		this.commandManager.executeCommand(addComponentCommand);
		this.viewUpdater.updateCanvas();
	}
	
	public function panCanvas(canvasPanEvent: CanvasPanEvent) : Void {
		trace(canvasPanEvent);
		this.commandManager.executeCommand(new PanCanvasCommand(this.activeTab.getCircuitDiagram(), canvasPanEvent));
		this.viewUpdater.updateCanvas();
	}
	
	public function undoLastCanvasChange() {
		this.commandManager.undoCommand();
		this.viewUpdater.updateCanvas();
	}
	
	
	public function redoLastCanvasChange() {
		this.commandManager.redoCommand();
		this.viewUpdater.updateCanvas();
	}
}