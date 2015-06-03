package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class Video_PlayPauseButton extends ApplicationButton
	{
		protected static const BUTTON_UP_PLAY:int = 1;
		protected static const BUTTON_OVER_PLAY:int = 2;
		protected static const BUTTON_UP_PAUSE:int = 3;
		protected static const BUTTON_OVER_PAUSE:int = 4;
		protected var currentButton:int = 0;
		public static const PLAY:int = 0;
		public static const PAUSE:int = 1;
		
		public function Video_PlayPauseButton(clickCallback:Function) { super(clickCallback); }
		
		public override function addEventListeners():void {
			addEventListener(MouseEvent.CLICK, mouseClicked);
			addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		public override function removeEventListeners():void {
			removeEventListener(MouseEvent.CLICK, clickCallback);
			removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
			removeEventListener(MouseEvent.MOUSE_OUT, mouseOut);
		}
		
		protected override function mouseClicked(e:MouseEvent):void {
			clickCallback();
			currentButton = currentButton == PLAY ? PAUSE : PLAY;
		}
		
		protected override function mouseUp(e:MouseEvent):void {
			this.gotoAndStop(currentButton == PLAY ? BUTTON_UP_PLAY : BUTTON_UP_PAUSE);
		}
		
		protected override function mouseOver(e:MouseEvent):void {
			this.gotoAndStop(currentButton == PLAY ? BUTTON_OVER_PLAY : BUTTON_OVER_PAUSE);
		}
		
		protected override function mouseOut(e:MouseEvent):void {
			this.gotoAndStop(currentButton == PLAY ? BUTTON_UP_PLAY : BUTTON_UP_PAUSE);
		}
		
		public override function getCurrentState():int {
			return currentButton;
		}
	}
}