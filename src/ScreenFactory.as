package 
{
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class ScreenFactory
	{
		public function ScreenFactory() { }
		
		public function create(type:String):Screen {
			switch (type) {
				case "main":
					return new Screen();
				case "help":
					return new Screen();
				case "about":
					return new Screen();
				default:
					return new Screen();
			}
		}
	}
}