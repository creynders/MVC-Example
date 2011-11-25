package mvcclock.view.events
{
	import flash.events.Event;
	
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