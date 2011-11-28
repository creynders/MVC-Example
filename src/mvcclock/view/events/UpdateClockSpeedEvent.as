package mvcclock.view.events
{
	import flash.events.Event;
	
	/**
	 * dispatched by the clock views to set the speed of virtual time update frequency
	 */
	public class UpdateClockSpeedEvent extends Event
	{
		
		/*===========================================================
		STATIC CONSTS
		===========================================================*/
		static public const UPDATE_CLOCK_SPEED : String = 'mvcclock.restricted.view.events::UpdateClockSpeedEvent#UPDATE_CLOCK_SPEED';
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function UpdateClockSpeedEvent( speed : int )
		{
			_speed = speed;
			super(UPDATE_CLOCK_SPEED, bubbles, cancelable);
		}
		
		/*===========================================================
		INSTANCE ACCESSORS
		===========================================================*/
		private var _speed : int;

		public function get speed():int{
			return _speed;
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		override public function clone():Event
		{
			return new UpdateClockSpeedEvent( speed );
		}
		
		

	}
}