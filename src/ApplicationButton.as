package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class ApplicationButton extends MovieClip
	{
		public static const BUTTON_UP:int = 1;
		public static const BUTTON_OVER:int = 2;
		public static const BUTTON_DOWN:int = 3;
		private var originalPos:Point = new Point(0, 0);
		protected var clickCallback:Function;
		
		public function ApplicationButton(clickCallback:Function = null) {
			this.gotoAndStop(ApplicationButton.BUTTON_UP);
			this.clickCallback = clickCallback == null ? defaultCallback : clickCallback;
			addEventListeners();
		}
		
		public function setCallback(clickCallback:Function) {
			this.clickCallback = clickCallback;
		}
		
		public function defaultCallback() {
			trace("Add a callback to this button");
		}
		
		public function addEventListeners():void {
			addEventListener(MouseEvent.CLICK, mouseClicked);
			addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		public function removeEventListeners():void {
			removeEventListener(MouseEvent.CLICK, clickCallback);
			removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, mouseOut);
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		}
		
		protected function mouseClicked(e:MouseEvent):void {
			clickCallback();
		}
		
		protected function mouseUp(e:MouseEvent):void {
			this.gotoAndStop(ApplicationButton.BUTTON_UP);
		}
		
		protected function mouseOver(e:MouseEvent):void {
			this.gotoAndStop(ApplicationButton.BUTTON_OVER);
		}
		
		protected function mouseOut(e:MouseEvent):void {
			this.gotoAndStop(ApplicationButton.BUTTON_UP);
		}
		
		protected function mouseDown(e:MouseEvent):void {
			this.gotoAndStop(ApplicationButton.BUTTON_DOWN);
		}
		
		public function setToOriginalPos():void { setPosition(originalPos.x, originalPos.y); }
		
		public function getOriginalPos():Point { return originalPos; }
		
		/**
		 * Sets both originalPos and x and y for button. Usually only used after creating a button. 
		 * Call setPosition to change buttons position after this and setToOriginalPos to change
		 * button to originalPos.
		 * @param	x
		 * @param	y
		 */
		public function setOriginalPos(x:Number, y:Number):void {
			originalPos.setTo(x, y);
			setPosition(x, y);
		}
		
		public function setPosition(x:Number, y:Number):void { this.x = x; this.y = y; }
		
		public function getCurrentFrame():int { return this.currentFrame; }
		
		//Override when implementation is needed
		public function getCurrentState():int { return 0; }
	}
}