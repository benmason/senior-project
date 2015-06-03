package 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class SelectTutorialPageFactory
	{
		public static const WATER_HEATER:int = 0;
		public static const CABINET:int = 1;
		public static const WALL_OUTLET:int = 2;
		
		public function SelectTutorialPageFactory() {}
		
		public function create(type:int, callback:Function):ApplicationButton {
			switch (type) {
				case WATER_HEATER:
					var page = new SelectTutorialPage_WaterHeater();
					page.initialize();
					page.setCallback(callback);
					return page;
				case CABINET:
					var page = new SelectTutorialPage_Cabinet();
					page.initialize();
					page.setCallback(callback);
					return page;
				case WALL_OUTLET:
					var page = new SelectTutorialPage_WallOutlet();
					page.initialize();
					page.setCallback(callback);
					return page;
				default:
					var page = new SelectTutorialPage_WaterHeater();
					page.initialize();
					page.setCallback(callback);
					return page;
			}
		}
	}
}