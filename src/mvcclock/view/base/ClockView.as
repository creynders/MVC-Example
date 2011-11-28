package mvcclock.view.base {
	import flash.display.DisplayObject;
	import mvcclock.model.base.Time;

	public interface ClockView extends View{
		
		/**
		 * update the current virtual time of the view
		 */
		function updateTime( time : Time ) : void;
	}
}