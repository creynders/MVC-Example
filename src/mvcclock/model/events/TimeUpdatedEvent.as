package mvcclock.model.events
{
	import flash.events.Event;
	
	import mvcclock.model.base.Time;
	
	/**
	 * dispatched by VirtualTimeModel when the current virtual time is updated
	 * @see mvcclock.modelVirtualTimeModel
	 */
	public class TimeUpdatedEvent extends Event
	{
		/*===========================================================
		STATIC PROPS
		===========================================================*/
		
		/**
		 * @eventType mvcclock.restricted.model.events::TimeModelUpdatedEvent#TIME_UPDATED
		 */
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
		
		/**
		 * the updated virtual time
		 */
		public function get time():Time{
			return _time;
		}


		override public function clone():Event
		{
			return new TimeUpdatedEvent( time );
		}
		
	}
}