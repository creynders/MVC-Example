package mvcclock.model {
	import flash.events.EventDispatcher;
	
	import mvcclock.model.events.TimeUpdatedEvent;
	import mvcclock.model.base.Time;
	import mvcclock.model.base.TimeModel;

	/**
	 * DayTimeModel, holds the current virtual time
	 *
	 * @author @camillereynders
	 */
	
	/**
	 * @eventType mvcclock.model.events.TimeUpdatedEvent.TIME_UPDATED
	 */
	[Event(name="mvcclock.restricted.model.events::TimeModelUpdatedEvent#TIME_UPDATED", type="mvcclock.model.events.TimeUpdatedEvent")]
	
	public class VirtualTimeModel extends EventDispatcher implements TimeModel, Time {
		
		/*===========================================================
		STATIC CONSTS
		===========================================================*/
		
		/**
		 * timestamp in seconds [!] for 24 hours
		 */
		static public const FULL_DAY_TIMESTAMP : Number = 24 * 60 * 60;
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function VirtualTimeModel( beginTime : Time ) : void{
			trace( this );
			time = beginTime;
			_init();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _timestamp : Number;
		private var _timer : ModelTimerDelegate;
		
		/*===========================================================
		INSTANCE ACCESSORS
		===========================================================*/

		/**
		 * @inheritDoc
		 */
		public function set timestamp( value : Number ) : void{
			if( value >=  FULL_DAY_TIMESTAMP )
				value -= FULL_DAY_TIMESTAMP;
			else if( value < 0 )
				value += FULL_DAY_TIMESTAMP;
			
			_timestamp = value;
			this.dispatchEvent( new TimeUpdatedEvent( time ) );
		}
		public function get timestamp():Number{
			return _timestamp;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get hours():uint
		{
			return Math.floor( _timestamp / 3600 );
		}

		/**
		 * @inheritDoc
		 */
		public function get minutes():uint
		{
			return Math.floor( _timestamp / 60 % 60);
		}

		/**
		 * @inheritDoc
		 */
		public function get seconds():uint
		{
			return Math.floor( _timestamp % 60 );
		}
		
		/**
		 * @inheritDoc
		 */
		public function get time():Time
		{
			return this;
		}
		
		public function set time( value:Time):void
		{
			timestamp = ( value.hours * 3600 ) + ( value.minutes * 60 ) + value.seconds;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get speed():Number
		{
			return _timer.speed;
		}
		
		public function set speed( value : Number ):void
		{
			_timer.speed = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get isRunning() : Boolean{
			return _timer.isRunning;
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		private function _init():void{
			_timer = new ModelTimerDelegate( this );
		}
	
		/**
		 * @inheritDoc
		 */
		public function addSeconds(value:int):void
		{
			timestamp += value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function subtractSeconds(value:int):void
		{
			timestamp -= value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function reset():void
		{
			this.timestamp = 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function start():void
		{
			_timer.start();
		}
		
		/**
		 * @inheritDoc
		 */
		public function stop():void
		{
			_timer.stop();
		}
		
		/**
		 * return the current virtual time as a formatted String
		 * @returns String the current virtual time as a formatted String
		 */
		override public function toString():String{
			return _timestamp + ' - ' + hours + ':' + minutes + ':' + seconds;
			//return _timestamp.toString();
		}
		
	}
}