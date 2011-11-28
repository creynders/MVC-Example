package mvcclock.view.events
{
	import flash.events.Event;
	
	/**
	 * dispatched by the clock views requesting a reset of the virtual time
	 */
	public class ResetClockEvent extends Event
	{
		/*===========================================================
		STATIC CONSTS
		===========================================================*/
		static public const RESET_CLOCK : String = 'mvcclock.restricted.view.events::ResetClockEvent#RESET_CLOCK';
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function ResetClockEvent()
		{
			super(RESET_CLOCK, bubbles, cancelable);
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		override public function clone():Event
		{
			return new ResetClockEvent();
		}
		
		
	}
}