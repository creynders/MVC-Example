package mvcclock.model.events
{
	import flash.events.Event;
	
	import mvcclock.model.base.Time;
	
	public class TimeUpdatedEvent extends Event
	{
		/*===========================================================
		STATIC PROPS
		===========================================================*/
		static public const TIME_UPDATED : String = 'mvcclock.restricted.model.events::TimeModelUpdatedEvent#TIME_UPDATED'
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function TimeUpdatedEvent( time : Time )
		{
			_time = time;
			super( TIME_UPDATED, bubbles, cancelable);
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _time : Time;

		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		public function get time():Time{
			return _time;
		}


	}
}