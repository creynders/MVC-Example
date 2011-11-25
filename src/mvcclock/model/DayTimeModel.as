////////////////////////////////////////////////////////////////////////////////
//Code stub generated with:
//                                Crocus Modeller
//                      Robust UML editor for AS3 & Flex devs.
//                             http://CrocusModeller.com
//
////////////////////////////////////////////////////////////////////////////////


package mvcclock.model {
	import flash.events.EventDispatcher;
	
	import mvcclock.model.events.TimeUpdatedEvent;
	import mvcclock.model.base.Time;
	import mvcclock.model.base.TimeModel;

	/**
	 * DayTimeModel
	 *
	 * @author YourName
	 */
	public class DayTimeModel extends EventDispatcher implements TimeModel, Time {
		
		/*===========================================================
		STATIC CONSTS
		===========================================================*/
		static public const FULL_DAY_TIMESTAMP : Number = 24 * 60 * 60;
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function DayTimeModel( beginTime : Time ) : void{
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
		
		public function get hours():uint
		{
			return Math.floor( _timestamp / 3600 );
		}
		
		public function get minutes():uint
		{
			return Math.floor( _timestamp / 60 % 60);
		}

		public function get seconds():uint
		{
			return Math.floor( _timestamp % 60 );
		}
		
		public function get time():Time
		{
			return this;
		}
		
		public function set time( value:Time):void
		{
			timestamp = ( value.hours * 3600 ) + ( value.minutes * 60 ) + value.seconds;
		}
		
		public function get speed():Number
		{
			return _timer.speed;
		}
		
		public function set speed( value : Number ):void
		{
			_timer.speed = value;
		}
		
		public function get isRunning() : Boolean{
			return _timer.isRunning;
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		private function _init():void{
			_timer = new ModelTimerDelegate( this );
		}
		public function addSeconds(value:int):void
		{
			timestamp += value;
		}
		
		public function subtractSeconds(value:int):void
		{
			timestamp -= value;
		}
		
		public function reset():void
		{
			this.timestamp = 0;
		}
		
		public function start():void
		{
			_timer.start();
		}
		
		public function stop():void
		{
			_timer.stop();
		}
		
		
		
		
		override public function toString():String{
			return _timestamp + ' - ' + hours + ':' + minutes + ':' + seconds;
			//return _timestamp.toString();
		}
		
	}
}