package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import fl.video.FLVPlayback;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class VideoPlayer extends FLVPlayback
	{
		private var mainContainer:MovieClip;
		private var videoContainer:VideoContainer;
		private var directoryPath:String = "assets/videos/";
		
		public function VideoPlayer(mainContainer:MovieClip) {
			super();
			this.mainContainer = mainContainer;
			videoContainer = new VideoContainer();
			//player = new FLVPlayback();
			videoContainer.x = 360;
			videoContainer.y = 150;
			//trace(videoContainer.width + " " + videoContainer.height);
			this.x = 20;
			this.y = 76;
			//player.source = "mason_B_Final_Project_Video.mp4";
			this.width = 700;//740;
			this.height = 393.75;//416.25//480;
			this.skin = "src/SkinUnderAllNoFullNoCaption.swf";
			this.skinBackgroundColor = 0x222222;
			//videoContainer.addChild(this);
		}
		
		public function addVideo(fileName:String):void {
			if (!mainContainer.contains(videoContainer)) mainContainer.addChild(videoContainer);
			//this.source = directoryPath + fileName;
		}
		
		public function removeVideo():void {
			if (mainContainer.contains(videoContainer)) mainContainer.removeChild(videoContainer);
			this.source = directoryPath + "stop_sound.mp4";
		}
		
		public function addVideoToContainer(fileName:String, container:MovieClip):void {
			if (!container.contains(this)) container.addChild(this);
			this.source = directoryPath + fileName;
			trace(directoryPath + fileName);
		}
		
		public function removeVideoFromContainer(container:MovieClip):void {
			if (container.contains(this)) container.removeChild(this);
			this.source = directoryPath + "stop_sound.mp4";
		}
	}
	
}