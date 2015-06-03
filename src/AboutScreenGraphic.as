package 
{
	import flash.display.MovieClip;
	import fl.video.FLVPlayback;
	import flash.events.Event;
	import flash.system.fscommand;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class AboutScreenGraphic extends MovieClip
	{
		private var callBackClip:MovieClip;
		private var buttonFactory:ButtonFactory;
		private var closeButton:ApplicationButton;
		
		public function AboutScreenGraphic(callBackClip:MovieClip) {
			this.callBackClip = callBackClip;
			buttonFactory = new ButtonFactory();
			closeButton = buttonFactory.create(ButtonFactory.SUBSCREEN_CLOSE, closeButtonClicked);
			closeButton.x = 395;
			closeButton.y = -206;
		}
		
		public function animate():void {
			addEventListener(Event.ENTER_FRAME, animateToEnd);
		}
		
		private function animateToEnd(e:Event):void {
			if (this.currentFrame == 1) {
				this.play();
			} else {
				if (this.currentFrame == this.totalFrames) {
					this.stop();
					this.addChild(closeButton);
					removeEventListener(Event.ENTER_FRAME, animateToEnd);
				}
			}
		}
		
		public function closeButtonClicked():void {
			this.gotoAndStop(1);
			this.removeChild(closeButton);
			callBackClip.closeAboutScreen();
		}
	}
	
}