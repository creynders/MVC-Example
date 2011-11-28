package mvcclock.view.base
{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;

	/**
	 * generic view interface
	 */
	public interface View extends IEventDispatcher
	{
		function get displayObject():DisplayObject;		
	}
}