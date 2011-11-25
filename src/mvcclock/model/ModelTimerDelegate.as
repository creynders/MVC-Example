package mvcclock.model
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import mvcclock.model.base.TimeModel;
	

	public class ModelTimerDelegate
	{
		/*===========================================================
		STATIC CONSTS
		===========================================================*/
		static public const DEFAULT_UPDATE_FREQUENCY : uint = 1000;
		
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function ModelTimerDelegate( model : TimeModel)
		{
			trace( this );
			_model = model;
			_init();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _model : TimeModel;
		private var _timer : Timer;
		private var _refreshRate:Number = 0.1;
		private var _lastTime : Date;
		private var _next : int;
		private var _updateFrequency : int = DEFAULT_UPDATE_FREQUENCY;
		private var _direction : int = 1;
		
		/*===========================================================
		INSTANCE ACCESSORS
		===========================================================*/
		public function get speed() : Number {
			return _updateFrequency / DEFAULT_UPDATE_FREQUENCY * _direction;
		}
		public function set speed( value : Number ) : void{
			if( value != 0 ){
				_updateFrequency = DEFAULT_UPDATE_FREQUENCY / Math.abs( value );
				_direction = ( value < 0 ) ? -1 : 1;
				if( ! isRunning ) start();
			}else{
				stop();
			}
		}
		
		public function get isRunning() : Boolean{
			return _timer.running;
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		private function _init():void{
			_timer = new Timer( _refreshRate );
			_timer.addEventListener( TimerEvent.TIMER, _onTimerEvent );
		}
		
		public function start():void{
			_lastTime = new Date();
			_next = _updateFrequency;
			_timer.start();
		}
		
		public function stop():void{
			_timer.stop();
		}
		
		protected function _onTimerEvent(event:TimerEvent):void
		{
			var currentTime : Date = new Date();
			var diff : Number = currentTime.getTime() - _lastTime.getTime();
			if( diff >= _next  ){
				_lastTime = currentTime;
				_next = _updateFrequency - ( diff - _next );
				_model.addSeconds( _direction );
			}
		}
		
	}
}