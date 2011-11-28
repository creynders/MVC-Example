package mvcclock.model.base
{
	public interface Time
	{
		/**
		 * the hours part of the virtual time
		 */
		function get hours():uint;
		
		/**
		 * the minutes part of the virtual time
		 */
		function get minutes():uint;

		/**
		 * the seconds part of the current virtual time
		 */
		function get seconds():uint;
		
		/**
		 * timestamp in seconds of the virtual time
		 */
		function get timestamp():Number;
	}
}