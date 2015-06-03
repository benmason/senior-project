package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class ContainerSprite extends Sprite
	{
		private var parentClip:MovieClip;
		
		public function ContainerSprite(parentClip ) { this.parentClip = parentClip;  }
		
		public function add() { if (!parentClip.contains(this)) parentClip.addChild(this); };
		public function remove() { if (parentClip.contains(this)) parentClip.removeChild(this); };
	}
}