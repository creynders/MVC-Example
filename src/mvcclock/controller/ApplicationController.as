package mvcclock.controller
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import mvcclock.view.base.ApplicationView;
	import mvcclock.view.base.ClockView;
	import mvcclock.model.base.TimeModel;
	import mvcclock.model.ModelTimerDelegate;
	import mvcclock.model.DayTimeModel;
	import mvcclock.model.TimeVO;
	import mvcclock.controller.base.AbstractController;

	public class ApplicationController extends AbstractController
	{
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function ApplicationController( view : ApplicationView)
		{
			trace( this );
			_view = view;
			super( new EventDispatcher() );
			
			this.startup();
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		private var _view : ApplicationView;
		
		private var _controllers : Dictionary;
		private var _model : TimeModel;
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		override public function startup() : void{
			_controllers = new Dictionary( false );
			_model = new DayTimeModel( new TimeVO( 23, 59, 55 ) );
			_view.addEventListener( Event.ADDED_TO_STAGE, _onAddedToStageEvent, true );
			_view.addEventListener( Event.REMOVED_FROM_STAGE, _onRemovedFromStage );
		}
		
		private function _onRemovedFromStage(event:Event):void
		{
			//TODO
		}
		
		protected function _onAddedToStageEvent(event:Event):void
		{
			if( event.target is ClockView ){
				var view : ClockView = ClockView( event.target );
				_controllers[ view ] = new DefaultClockController( _systembus, view, _model );
				if( ! _model.isRunning ) _model.start();
			}
		}
	}
}