package 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Ben Mason
	 */
	public interface IScreen
	{
		function add(... movieClips:Array):void;
		function remove(... movieClips:Array):void;
	}
}