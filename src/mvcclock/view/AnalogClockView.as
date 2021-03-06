package mvcclock.view {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import mvcclock.model.base.Time;
	import mvcclock.model.events.TimeUpdatedEvent;
	import mvcclock.view.events.ResetClockEvent;
	import mvcclock.view.base.ClockView;

	/**
	 * AnalogClockView
	 *
	 * @author @camillereynders
	 */
	public class AnalogClockView extends MovieClip implements ClockView {
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function AnalogClockView() : void{
			trace( this );
			_init();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		public var hours : Sprite;
		public var minutes : Sprite;
		public var seconds : Sprite;
		
		/*===========================================================
		INSTANCE ACCESSORS
		===========================================================*/
		public function get displayObject():DisplayObject
		{
			return this;
		}
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		private function _init():void{
			this.addEventListener(MouseEvent.CLICK, _onClickEvent );
		}
		
		protected function _onClickEvent(event:MouseEvent):void
		{
			this.dispatchEvent( new ResetClockEvent() );
		}
		
		/**
		 * @inheritDoc
		 */
		public function updateTime( time : Time ):void
		{
			//trace( this, time );
			hours.rotation = time.hours * 15;
			minutes.rotation = time.minutes * 6;
			seconds.rotation = time.seconds * 6;
		}
		
	}
}