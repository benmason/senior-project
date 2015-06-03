package 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class ButtonFactory
	{
		public static const HOME:int = 0;
		public static const HELP:int = 1;
		public static const CLOSE:int = 2;
		public static const VIEW_ALL:int = 3;
		public static const SELECT_TUTORIAL:int = 4;
		public static const GLOSSARY:int = 5;
		public static const VIDEO_PLAY_PAUSE:int = 6;
		public static const SUBSCREEN_CLOSE:int = 7;
		public static const WATER_HEATER_TUTORIAL:int = 8;
		public static const CABINET_TUTORIAL:int = 9;
		public static const WALL_OUTLET_TUTORIAL:int = 10;
		public static const PREVIOUS_TUTORIAL:int = 11;
		public static const NEXT_TUTORIAL:int = 12;
		public static const ABOUT:int = 13;
		
		public function ButtonFactory() {}
		
		public function create(type:int, callback:Function):ApplicationButton {
			switch (type) {
				case HOME:
					return new HomeButton(callback);
				case HELP:
					return new HelpButton(callback);
				case CLOSE:
					return new CloseButton(callback);
				case VIEW_ALL:
					return new ViewAllButton(callback);
				case SELECT_TUTORIAL:
					return new SelectTutorialButton(callback);
				case GLOSSARY:
					return new GlossaryButton(callback);
				case VIDEO_PLAY_PAUSE:
					return new Video_PlayPauseButton(callback);
				case SUBSCREEN_CLOSE:
					return new SubScreen_CloseButton(callback);
				case WATER_HEATER_TUTORIAL:
					return new TutorialSelectBox_WaterHeater(callback);
				case CABINET_TUTORIAL:
					return new TutorialSelectBox_Cabinet(callback);
				case WALL_OUTLET_TUTORIAL:
					return new TutorialSelectBox_WallOutlet(callback);
				case PREVIOUS_TUTORIAL:
					return new PreviousTutorialButton(callback);
				case NEXT_TUTORIAL:
					return new NextTutorialButton(callback);
				case ABOUT:
					return new AboutButton(callback);
				default:
					return new HomeButton(callback);
			}
		}
	}
}