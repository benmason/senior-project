package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class DiscreteAnimation extends MovieClip implements IAnimate
	{
		private var movieClips:Array;
		private var stepsInX:Array;
		private var stepsInY:Array;
		private var xSpeeds:Array;
		private var ySpeeds:Array;
		private var animating:Boolean = false;
		private var leftInClip:int = 0;
		
		public function DiscreteAnimation() {}
		
		public function moveTo(stepInX:int, stepInY:int, xSpeed:Number, ySpeed:Number, ... movieClips:Array):void {
			this.movieClips = new Array();
			this.stepsInX = new Array();
			this.stepsInY = new Array();
			this.xSpeeds = new Array();
			this.ySpeeds = new Array();
			
			var temp:int = (movieClips.length - 1) >= 0 ? movieClips.length - 1 : 0;
			for (var i:int = 0; i < movieClips.length; i++) { this.movieClips[temp].push(movieClips[i]); }
			trace(movieClips);
			this.stepsInX[temp] = stepInX;
			this.stepsInY[temp] = stepInY;
			this.xSpeeds[temp] = xSpeed;
			this.ySpeeds[temp] = ySpeed;
			trace(movieClips.length);
			
			if (this.movieClips.length == 1) {
				leftInClip = movieClips.length;
			}
			if (!animating) {
				this.addEventListener(Event.ENTER_FRAME, animate);
			}
		}
		
		private function animate(e:Event):void {
			var animationComplete:Boolean = false;
			
			if (stepsInX[0] > 0) {
				movieClips[0][leftInClip - 1].x += xSpeeds[leftInClip - 1];
				trace(movieClips[0][0]);
				stepsInX[0]--;
			} else {
				animationComplete = true;
			}
			
			if (stepsInY[0] > 0) {
				movieClips[0][leftInClip - 1].y += ySpeeds[leftInClip - 1];
				stepsInY[0]--;
				animationComplete = false;
			}
			
			if (animationComplete) {
				leftInClip--;
				if (leftInClip <= 0) {
					movieClips.shift();
					stepsInX.shift();
					stepsInY.shift();
					xSpeeds.shift();
					ySpeeds.shift();
					
					if (movieClips.length > 0) {
						leftInClip = movieClips[0].length;
					} else if (movieClips.length == 0) {
						this.removeEventListener(Event.ENTER_FRAME, animate);
					} else { trace("Error: DiscreteAnimation"); }
				}
			}
		}
	}
}