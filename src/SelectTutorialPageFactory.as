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
		public static const VIEW_ALL:int = 3;
		
		public function SelectTutorialPageFactory() {}
		
		public function create(type:int, callback:Function):SelectTutorialPage {
			var page:SelectTutorialPage;
			
			switch (type) {
				case WATER_HEATER:
					page = new SelectTutorialPage_WaterHeater();
					page.initialize();
					page.setCallback(callback);
					page.setVideoPath("waterHeater");
					return page;
				case CABINET:
					page = new SelectTutorialPage_Cabinet();
					page.initialize();
					page.setCallback(callback);
					page.setVideoPath("cabinet");
					return page;
				case WALL_OUTLET:
					page = new SelectTutorialPage_WallOutlet();
					page.initialize();
					page.setCallback(callback);
					page.setVideoPath("wallOutlet");
					return page;
				case VIEW_ALL:
					page = new ViewAllPage();
					page.initialize(false);
					page.setCallback(callback);
					page.setVideoPath("viewAll");
					page.moviePlaying = true;
					return page;
				default:
					page = new SelectTutorialPage_WaterHeater();
					page.initialize();
					page.setCallback(callback);
					page.setVideoPath("waterHeater");
					return page;
			}
		}
	}
}