package mvcclock.controller.base
{
	import flash.errors.IllegalOperationError;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * Abstract controller class
	 * @author @camillereynders
	 */
	public class AbstractController implements Controller
	{
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function AbstractController( systembus : IEventDispatcher )
		{
			_systembus = systembus;
		}
		
		/*===========================================================
		INSTANCE PROPS
		===========================================================*/
		
		protected var _systembus : IEventDispatcher
		
		/*===========================================================
		INSTANCE METHS
		===========================================================*/
		public function startup():void
		{
			throw new IllegalOperationError( 'abstract method should be overridden' );
		}
	}
}