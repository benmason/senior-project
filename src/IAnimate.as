package 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public interface IAnimate
	{
		function moveTo(stepInX:int, stepInY:int, xSpeed:Number, ySpeed:Number, ... movieClips:Array):void;
	}
}