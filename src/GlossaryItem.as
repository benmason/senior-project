package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class GlossaryItem extends MovieClip
	{
		private var textFormat:TextFormat = new TextFormat("Roboto Light", 14, 0xFFFFFF);
		private var textField:TextField;
		private var partIndex:int; //used to reference frame in GlossaryItemDisplay var
		
		public function GlossaryItem(text:String, partIndex:int) { 
			this.partIndex = partIndex; 
			textField = new TextField();
			if ((text.length - 1) == 1) {
				trace("LENGTH 1");
				textFormat.color = 0x009900;
				textFormat.align = TextFormatAlign.LEFT;
			} else {
				trace("LENGTH OVER 1");
				textFormat.color = 0xFFFFFF;
				textFormat.align = TextFormatAlign.RIGHT;
			}
			
			textField.defaultTextFormat = textFormat;
			textField.text = text;
			textField.height = this.height;
			textField.width = this.width;
			textField.selectable = false;
			textField.embedFonts = true;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			//textField.cacheAsBitmap = true;
			this.addChild(textField);
		}
		
		public function getPartIndex():int { return partIndex; }
	}
}