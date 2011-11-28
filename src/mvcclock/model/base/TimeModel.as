package mvcclock.model.base {
	import flash.events.IEventDispatcher;

	public interface TimeModel extends IEventDispatcher, Time{
		
		/**
		 * virtual time update speed, expressed as a multiplier of "normal" time speed
		 */
		function set speed( value : Number ) : void;
		function get speed() : Number;
		
		/**
		 * the current virtual time
		 */
		function set time( time : Time ) : void;
		function get time() : Time;
		
		/**
		 * whether the virtual time is being updated or not
		 */
		function get isRunning() : Boolean;
		
		/**
		 * add seconds to the current virtual time
		 */
		function addSeconds( value : int ) : void;
		
		/**
		 * subtract seconds from the current virtual time
		 */
		function subtractSeconds( value : int ) : void;
		
		/**
		 * reset the virtual time to the Unix epoch
		 */
		function reset():void;
		
		/**
		 * starts updating the virtual time
		 */
		function start() : void;
		
		/**
		 * stops updating the virtual time
		 */
		function stop() : void;
		
		
	}
}