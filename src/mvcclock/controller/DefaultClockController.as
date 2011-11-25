////////////////////////////////////////////////////////////////////////////////
//Code stub generated with:
//                                Crocus Modeller
//                      Robust UML editor for AS3 & Flex devs.
//                             http://CrocusModeller.com
//
////////////////////////////////////////////////////////////////////////////////


package mvcclock.controller {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mvcclock.view.base.ClockView;
	import mvcclock.model.base.Time;
	import mvcclock.model.base.TimeModel;
	import mvcclock.model.events.TimeUpdatedEvent;
	import mvcclock.view.events.ResetClockEvent;
	import mvcclock.view.events.UpdateClockSpeedEvent;
	import mvcclock.controller.base.AbstractController;
	import mvcclock.controller.base.ClockController;

	/**
	 * DefaultClockController
	 *
	 * @author YourName
	 */
	public class DefaultClockController extends AbstractController implements ClockController {
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function DefaultClockController( systembus : IEventDispatcher, view : ClockView, model : TimeModel ) : void{
			trace( this );
			super( systembus );
			_view = view;
			_model = model;
			
			this.startup();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _view : ClockView;
		private var _model : TimeModel;
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		override public function startup():void{
			_model.addEventListener( TimeUpdatedEvent.TIME_UPDATED, _onTimeUpdatedEvent );
			_view.addEventListener( ResetClockEvent.RESET_CLOCK, _onResetClockEvent );
			_view.addEventListener( UpdateClockSpeedEvent.UPDATE_CLOCK_SPEED, _onUpdateClockSpeedEvent );
			updateView( _model );
		}
		
		private function _onUpdateClockSpeedEvent( event : UpdateClockSpeedEvent ):void
		{
			_model.speed = event.speed;
		}
		
		private function _onResetClockEvent( event : Event ):void
		{
			_model.reset();
		}
		
		private function updateView( time : Time ):void
		{
			_view.updateTime( time );
		}
		
		protected function _onTimeUpdatedEvent(event:TimeUpdatedEvent):void
		{
			updateView(event.time);
		}
		
	}
}