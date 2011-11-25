package mvcclock.model.base {
	import flash.events.IEventDispatcher;

	public interface TimeModel extends IEventDispatcher, Time{
		
		function set speed( value : Number ) : void;
		function get speed() : Number;
		
		function set time( time : Time ) : void;
		function get time() : Time;
		
		function get isRunning() : Boolean;
		
		function addSeconds( value : int ) : void;
		function subtractSeconds( value : int ) : void;
		
		function reset():void;
		
		function start() : void;
		function stop() : void;
		
		
	}
}