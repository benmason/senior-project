package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class GlossaryItemDisplay extends MovieClip
	{
		private static var textFormat:TextFormat = new TextFormat("Roboto Black", 18, 0xFFFFFF);
		private var textField:TextField;
		
		public function GlossaryItemDisplay() {}
		
		public function setPos(newX:Number, newY:Number):void {
			this.x = newX;
			this.y = newY;
		}
		
		public function changeDisplay(partNo:int):void {
			this.gotoAndStop(partNo);
		}
	}
}