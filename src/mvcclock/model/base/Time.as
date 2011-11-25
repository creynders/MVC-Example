package mvcclock.model.base
{
	public interface Time
	{
		function get hours():uint;
		function get minutes():uint;
		function get seconds():uint;
		function get timestamp():Number;
	}
}