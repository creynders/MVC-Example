package mvcclock.model
{
	import mvcclock.model.base.Time;
	
	public class TimeVO implements Time
	{
		/*===========================================================
		CONSTRUCTOR
		===========================================================*/
		public function TimeVO( hours : uint, minutes : uint, seconds : uint )
		{
			_hours = hours;
			_minutes = minutes;
			_seconds = seconds;
		}
		
		/*===========================================================
		INSTANCE ACCESSORS
		===========================================================*/
		protected var _hours : uint;
		public function get hours():uint
		{
			return _hours;
		}
		
		protected var _minutes : uint;
		public function get minutes():uint
		{
			return _minutes;
		}
		
		protected var _seconds : uint;
		public function get seconds():uint
		{
			return _seconds;
		}
		
		protected var _timestamp : Number;
		public function get timestamp():Number
		{
			return _timestamp;
		}
		
	}
}