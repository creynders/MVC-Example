package mvcclock
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mvcclock.view.base.ApplicationView;
	import mvcclock.view.base.View;
	import mvcclock.controller.ApplicationController;
	import mvcclock.view.AnalogClockView;
	import mvcclock.view.DigitalClockView;
	
	/**
	 * Document class for build/MVCClock.fla
	 * @author @camillereynders
	 * @version 1.0.0
	 */
	
	public class MVCClock extends Sprite implements ApplicationView
	{
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function MVCClock()
		{
			_init();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _controller : ApplicationController;
		
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
		private function _init() : void{
			if( this.stage ){
				_startup();
			}else{
				this.addEventListener(Event.ADDED_TO_STAGE,_onAddedToStageEvent );
			}
		}
		
		private function _onAddedToStageEvent(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStageEvent );
			_startup();
		}
		
		/**
		 * bootstrap, fires up the application
		 *
		 * @private
		 */
		private function _startup() : void{
			_controller = new ApplicationController( this );
			
			showAnalog();
			showDigital();
		}
		
		/**
		 * create the analog clock view
		 */
		public function showAnalog():void{
			var analogClock : AnalogClockView = new AnalogClockView();
			analogClock.x = 200;
			analogClock.y = 200;
			this.addChild( analogClock );
		}
		
		/**
		 * create the digital clock view
		 */
		public function showDigital() : void{
			var digitalClock : DigitalClockView = new DigitalClockView();
			digitalClock.x = 400;
			digitalClock.y = 200;
			this.addChild( digitalClock );
		}
	

	}
}