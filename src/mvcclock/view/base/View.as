package mvcclock.view.base
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;

	public interface View extends IEventDispatcher
	{
		function get displayObject():DisplayObject;		
	}
}