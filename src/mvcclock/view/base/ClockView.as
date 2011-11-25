package mvcclock.view.base {
	import flash.display.DisplayObject;
	import mvcclock.model.base.Time;

	public interface ClockView extends View{
		
		function updateTime( time : Time ) : void;
	}
}