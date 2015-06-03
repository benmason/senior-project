package 
{
	import flash.system.System;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.fscommand;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	/**
	 * ...
	 * @author Ben Mason
	 */
	public class Application extends MovieClip
	{
		private var main:MovieClip;
		private var screenContainer:MovieClip;
		private var videoPlayer:VideoPlayer;
		private var screenFactory:ScreenFactory;
		private var buttonFactory:ButtonFactory;
		private var tutorialPageFactory:SelectTutorialPageFactory;
		private var mainScreen:Screen;
		private var helpScreen:Screen;
		private var aboutScreen:Screen;
		private var glossaryScreen:Screen;
		private var bg:Background;
		private var logo:HomeScreenLogo;
		private var subScreenBackground:SubScreenBackground;
		private var helpScreenGraphic:HelpScreenGraphic;
		private var aboutScreenGraphic:AboutScreenGraphic;
		private var glossaryScreenGraphic:GlossaryScreenGraphic;
		//private var selectTutorialBoxes:ContainerSprite;
		private var discreetAnimation:DiscreteAnimation;
		
		private var tutorialPage_waterHeater:SelectTutorialPage;
		private var tutorialPage_cabinet:SelectTutorialPage;
		private var tutorialPage_wallOutlet:SelectTutorialPage;
		private var viewAllPage:SelectTutorialPage;
		private var tutorialPage_videoY:Number;
		
		private var homeButton:ApplicationButton;
		private var helpButton:ApplicationButton;
		private var aboutButton:ApplicationButton;
		private var closeButton:ApplicationButton;
		private var viewAllButton:ApplicationButton;
		private var selectTutorialButton:ApplicationButton;
		private var glossaryButton:ApplicationButton;
		
		//private var playWaterHeaterTutorialButton:ApplicationButton;
		//private var playCabinetTutorialButton:ApplicationButton;
		//private var playWallOutletTutorialButton:ApplicationButton;
		
		private var previousTutorialButton:ApplicationButton;
		private var nextTutorialButton:ApplicationButton;
		
		public function Application(stageClip:MovieClip) {
			main = stageClip;
			screenFactory = new ScreenFactory();
			buttonFactory = new ButtonFactory();
			tutorialPageFactory = new SelectTutorialPageFactory();
			screenContainer = new MovieClip();
			//selectTutorialBoxes = new ContainerSprite(main);
			discreetAnimation = new DiscreteAnimation();
			
			tutorialPage_videoY = 130;
			tutorialPage_waterHeater = tutorialPageFactory.create(SelectTutorialPageFactory.WATER_HEATER, playWaterHeaterPart);
			tutorialPage_waterHeater.setOriginalPos(267, 160);
			tutorialPage_cabinet = tutorialPageFactory.create(SelectTutorialPageFactory.CABINET, playCabinetPart);
			tutorialPage_cabinet.setOriginalPos(267, 320);
			tutorialPage_wallOutlet = tutorialPageFactory.create(SelectTutorialPageFactory.WALL_OUTLET, playWallOutletPart);
			tutorialPage_wallOutlet.setOriginalPos(267, 480);
			viewAllPage = tutorialPageFactory.create(SelectTutorialPageFactory.VIEW_ALL, viewAll);// playAll);
			viewAllPage.setOriginalPos(420, 130);
			
			main.addChild(screenContainer);
			
			bg = new Background();
			logo = new HomeScreenLogo();
			subScreenBackground = new SubScreenBackground();
			helpScreenGraphic = new HelpScreenGraphic(this);
			helpScreenGraphic.gotoAndStop(1);
			aboutScreenGraphic = new AboutScreenGraphic(this);
			
			glossaryScreenGraphic = new GlossaryScreenGraphic(this);
			glossaryScreenGraphic.gotoAndStop(1);
			
			logo.x = 625;
			logo.y = 220;
			
			helpScreenGraphic.x = 640;
			helpScreenGraphic.y = 360;
			
			aboutScreenGraphic.x = 640;
			aboutScreenGraphic.y = 360;
			
			glossaryScreenGraphic.x = 640;
			glossaryScreenGraphic.y = 360;
			
			mainScreen = screenFactory.create("main");
			mainScreen.add(bg);
			
			helpScreen = screenFactory.create("help");
			helpScreen.add(helpScreenGraphic);
			
			aboutScreen = screenFactory.create("about");
			aboutScreen.add(aboutScreenGraphic);
			
			glossaryScreen = screenFactory.create("glossary");
			glossaryScreen.add(glossaryScreenGraphic);
			
			screenContainer.addChild(mainScreen);
			
			homeButton = buttonFactory.create(ButtonFactory.HOME, returnToHomeScreen);
			helpButton = buttonFactory.create(ButtonFactory.HELP, viewHelp);
			aboutButton = buttonFactory.create(ButtonFactory.ABOUT, viewAbout);
			closeButton = buttonFactory.create(ButtonFactory.CLOSE, exitApplication);
			viewAllButton = buttonFactory.create(ButtonFactory.VIEW_ALL, viewAll);
			selectTutorialButton = buttonFactory.create(ButtonFactory.SELECT_TUTORIAL, selectTutorial);
			glossaryButton = buttonFactory.create(ButtonFactory.GLOSSARY, viewGlossary);
			
			previousTutorialButton = buttonFactory.create(ButtonFactory.PREVIOUS_TUTORIAL, previousTutorial);
			nextTutorialButton = buttonFactory.create(ButtonFactory.NEXT_TUTORIAL, nextTutorial);
			
			//playWaterHeaterTutorialButton = buttonFactory.create(ButtonFactory.WATER_HEATER_TUTORIAL, playWaterHeaterTutorial);
			//playCabinetTutorialButton = buttonFactory.create(ButtonFactory.CABINET_TUTORIAL, playCabinetTutorial);
			//playWallOutletTutorialButton = buttonFactory.create(ButtonFactory.WALL_OUTLET_TUTORIAL, playWallOutletTutorial);
			
			mainScreen.add(homeButton, helpButton, closeButton, viewAllButton, selectTutorialButton, glossaryButton, logo, aboutButton);// , videoPlayer);
			//selectTutorialBoxes.addChild(playWaterHeaterTutorialButton);
			//selectTutorialBoxes.addChild(playCabinetTutorialButton);
			//selectTutorialBoxes.addChild(playWallOutletTutorialButton);
			
			//main.addChild(videoPlayer);
			homeButton.setOriginalPos(26, 7);
			helpButton.setOriginalPos(812, 7);
			aboutButton.setOriginalPos(1160, 600);
			closeButton.setOriginalPos(1046, 7);
			viewAllButton.setOriginalPos(134, 234);
			selectTutorialButton.setOriginalPos(134, 370);
			glossaryButton.setOriginalPos(134, 506);
			
			previousTutorialButton.setOriginalPos(84, 234);
			nextTutorialButton.setOriginalPos(84, 370);
			
			//playWaterHeaterTutorialButton.setOriginalPos(440, 180);
			//playCabinetTutorialButton.setOriginalPos(800, 180);
			//playWallOutletTutorialButton.setOriginalPos(620, 450);
			videoPlayer = new VideoPlayer(mainScreen);
		}
		
		public function previousTutorial():void {
			videoPlayer.addVideoToContainer(viewAllPage.getPreviousVideoPath(), viewAllPage);
		}
		
		public function nextTutorial():void {
			videoPlayer.addVideoToContainer(viewAllPage.getNextVideoPath(), viewAllPage);
		}
		
		/*public function playAll():void {
			trace(viewAllPage.getVideoPath());
			//safelyRemove(mainScreen, tutorialPage_waterHeater);
			safelyRemove(mainScreen, tutorialPage_waterHeater);
			safelyRemove(mainScreen, tutorialPage_cabinet);
			safelyRemove(mainScreen, tutorialPage_wallOutlet);
			shiftSelectionButtonsToLeft();
			//addSelectionButtons();
			viewAllPage.gotoAndStop(5);
			videoPlayer.addVideoToContainer(viewAllPage.getVideoPath(), viewAllPage);
		}*/
		
		public function playWaterHeaterPart():void {
			trace(tutorialPage_waterHeater.getVideoPath());
			//safelyRemove(mainScreen, tutorialPage_waterHeater);
			safelyRemove(mainScreen, tutorialPage_cabinet);
			safelyRemove(mainScreen, tutorialPage_wallOutlet);
			tutorialPage_waterHeater.y = tutorialPage_videoY;
			shiftSelectionButtonsToLeft();
			addSelectionButtons(false, true, false);
			tutorialPage_waterHeater.gotoAndStop(5);
			shiftPartPages(false);
			videoPlayer.addVideoToContainer(tutorialPage_waterHeater.getVideoPath(), tutorialPage_waterHeater);
			tutorialPage_waterHeater.addTutorialIndicator(tutorialPage_waterHeater.getCurrentVideoPathIndex() - 1);
		}
		
		public function playCabinetPart():void {
			trace(tutorialPage_cabinet.getVideoPath());
			tutorialPage_cabinet.x = tutorialPage_waterHeater.x;
			tutorialPage_cabinet.y = tutorialPage_videoY;//tutorialPage_waterHeater.y;
			safelyRemove(mainScreen, tutorialPage_waterHeater);
			//safelyRemove(mainScreen, tutorialPage_cabinet);
			safelyRemove(mainScreen, tutorialPage_wallOutlet);
			shiftSelectionButtonsToLeft();
			addSelectionButtons();
			addSelectionButtons(false, true, false);
			tutorialPage_cabinet.gotoAndStop(5);
			shiftPartPages(false);
			videoPlayer.addVideoToContainer(tutorialPage_cabinet.getVideoPath(), tutorialPage_cabinet);
			tutorialPage_cabinet.addTutorialIndicator(tutorialPage_cabinet.getCurrentVideoPathIndex() - 1);
		}
		
		public function playWallOutletPart():void {
			trace(tutorialPage_wallOutlet.getVideoPath());
			tutorialPage_wallOutlet.x = tutorialPage_waterHeater.x;
			tutorialPage_wallOutlet.y = tutorialPage_videoY;//tutorialPage_waterHeater.y;
			safelyRemove(mainScreen, tutorialPage_waterHeater);
			safelyRemove(mainScreen, tutorialPage_cabinet);
			shiftSelectionButtonsToLeft();
			addSelectionButtons();
			//safelyRemove(mainScreen, tutorialPage_wallOutlet);
			addSelectionButtons(false, true, false);
			tutorialPage_wallOutlet.gotoAndStop(5);
			shiftPartPages(false);
			videoPlayer.addVideoToContainer(tutorialPage_wallOutlet.getVideoPath(), tutorialPage_wallOutlet);
			tutorialPage_wallOutlet.addTutorialIndicator(tutorialPage_wallOutlet.getCurrentVideoPathIndex() - 1);
		}
		
		public function shiftPartPages(toOrginal:Boolean = true):void {
			if (toOrginal) {
				tutorialPage_waterHeater.setToOriginalPos();
				tutorialPage_cabinet.setToOriginalPos();
				tutorialPage_wallOutlet.setToOriginalPos();
			} else {
				tutorialPage_waterHeater.x = 420;
				tutorialPage_cabinet.x = 420;
				tutorialPage_wallOutlet.x = 420;
			}
		}
		/*public function playWaterHeaterTutorial():void {
			//selectTutorialBoxes.remove();
			tutorialPage_waterHeater.gotoAndStop(5);
			safelyRemove(mainScreen, tutorialPage_cabinet);
			safelyRemove(mainScreen, tutorialPage_wallOutlet);
			videoPlayer.addVideoToContainer("WaterHeater.mp4", tutorialPage_waterHeater);
		}*/
		
		public function returnToHomeScreen():void {
			shiftSelectionButtonsToRight();
			videoPlayer.removeVideo();
			if (!mainScreen.contains(logo)) mainScreen.addChild(logo);
			//selectTutorialBoxes.remove();
			safelyRemoveAllVideoAndPages();
			addSelectionButtons();
			safelyAdd(mainScreen, aboutButton);
		}
		
		public function viewAll():void {
			shiftSelectionButtonsToLeft();
			//addSelectionButtons(false);
			removeSelectionButtons();
			//videoPlayer.removeVideo();
			//selectTutorialBoxes.remove();
			safelyRemoveAllVideoAndPages();
			safelyAdd(mainScreen, viewAllPage);
			
			safelyAdd(mainScreen, previousTutorialButton);
			safelyAdd(mainScreen, nextTutorialButton);
			viewAllPage.gotoAndStop(5);
			videoPlayer.addVideoToContainer(viewAllPage.getVideoPath(), viewAllPage);
			viewAllPage.addTutorialIndicator();
			
			if (mainScreen.contains(logo)) mainScreen.removeChild(logo);
			//selectTutorialBoxes.remove();
			//videoPlayer.addVideo("WaterHeater.mp4");
		}
		
		public function safelyRemoveAllVideoAndPages():void {
			safelyRemove(mainScreen, viewAllPage);
			safelyRemove(mainScreen, tutorialPage_waterHeater);
			safelyRemove(mainScreen, tutorialPage_cabinet);
			safelyRemove(mainScreen, tutorialPage_wallOutlet);
			safelyRemove(mainScreen, previousTutorialButton);
			safelyRemove(mainScreen, nextTutorialButton);
			safelyRemove(mainScreen, aboutButton);
			videoPlayer.removeVideoFromContainer(tutorialPage_waterHeater);
			videoPlayer.removeVideoFromContainer(tutorialPage_cabinet);
			videoPlayer.removeVideoFromContainer(tutorialPage_wallOutlet);
			viewAllPage.removeTutorialIndicator();
			tutorialPage_waterHeater.removeTutorialIndicator();
			tutorialPage_cabinet.removeTutorialIndicator();
			tutorialPage_wallOutlet.removeTutorialIndicator();
			shiftPartPages();
		}
		
		public function selectTutorial():void {
			if (mainScreen.contains(logo)) mainScreen.removeChild(logo);
			videoPlayer.removeVideo();
			safelyRemoveAllVideoAndPages();
			//selectTutorialBoxes.add();
			shiftSelectionButtonsToLeft();
			//addSelectionButtons(true, false);
			removeSelectionButtons();
			tutorialPage_waterHeater.setToOriginalPos();
			tutorialPage_cabinet.setToOriginalPos();
			tutorialPage_wallOutlet.setToOriginalPos();
			tutorialPage_waterHeater.moviePlaying = false;
			tutorialPage_waterHeater.gotoAndStop(1);
			tutorialPage_cabinet.setToOriginalPos();
			tutorialPage_cabinet.moviePlaying = false;
			tutorialPage_cabinet.gotoAndStop(1);
			tutorialPage_wallOutlet.moviePlaying = false;
			tutorialPage_wallOutlet.setToOriginalPos();
			tutorialPage_wallOutlet.gotoAndStop(1);
			safelyAdd(mainScreen, tutorialPage_waterHeater);
			safelyAdd(mainScreen, tutorialPage_cabinet);
			safelyAdd(mainScreen, tutorialPage_wallOutlet);
		}
		
		public function addSelectionButtons(addViewAll:Boolean = true, addSelectTutorialButton:Boolean = true, addGlossaryButton:Boolean = true):void {
			var yOffset:Number = !addViewAll ? 136 : 0;
			yOffset = !addSelectTutorialButton ? yOffset + 136 : yOffset;
			yOffset = !addGlossaryButton && !addViewAll ? yOffset : !addGlossaryButton ? yOffset + 136 : yOffset;
			viewAllButton.setPosition(viewAllButton.x, viewAllButton.y); 
			selectTutorialButton.setPosition(selectTutorialButton.x, selectTutorialButton.y - yOffset); 
			glossaryButton.setPosition(glossaryButton.x, glossaryButton.y - yOffset); 
			if (addViewAll) safelyAdd(mainScreen, viewAllButton); else safelyRemove(mainScreen, viewAllButton);
			if (addSelectTutorialButton) safelyAdd(mainScreen, selectTutorialButton); else safelyRemove(mainScreen, selectTutorialButton); 
			if (addGlossaryButton) safelyAdd(mainScreen, glossaryButton); else safelyRemove(mainScreen, glossaryButton);
		}
		
		public function removeSelectionButtons():void {
			viewAllButton.setToOriginalPos();
			selectTutorialButton.setToOriginalPos();
			glossaryButton.setToOriginalPos();
			safelyRemove(mainScreen, viewAllButton);
			safelyRemove(mainScreen, selectTutorialButton);
			safelyRemove(mainScreen, glossaryButton);
		}
		
		public function safelyAdd(parent:MovieClip, child:MovieClip):void {
			if (!parent.contains(child)) parent.addChild(child);
		}
		
		public function safelyRemove(parent:MovieClip, child:MovieClip):void {
			if (parent.contains(child)) parent.removeChild(child);
		}
		
		/*public function playCabinetTutorial():void {
			//selectTutorialBoxes.remove();
			videoPlayer.addVideo("Cabinet.mp4");
		}*/
		
		/*public function playWallOutletTutorial():void {
			videoPlayer.removeVideo();
			//selectTutorialBoxes.remove();
			videoPlayer.addVideo("wallOutlet_full");
		}*/
		
		public function viewGlossary():void {
			//shiftSelectionButtonsToRight();
			//videoPlayer.removeVideo();
			//if (!mainScreen.contains(logo)) mainScreen.addChild(logo);
			//selectTutorialBoxes.remove();
			mainScreen.add(subScreenBackground);
			screenContainer.addChild(glossaryScreen);
			glossaryScreenGraphic.animate();
		}
		
		public function viewHelp():void {
			//shiftSelectionButtonsToRight();
			//videoPlayer.removeVideo();
			//if (!mainScreen.contains(logo)) mainScreen.addChild(logo);
			//selectTutorialBoxes.remove();
			mainScreen.add(subScreenBackground);
			screenContainer.addChild(helpScreen);
			helpScreenGraphic.animate();
		}
		
		public function viewAbout():void {
			mainScreen.add(subScreenBackground);
			screenContainer.addChild(aboutScreen);
			aboutScreenGraphic.animate();
		}
		
		public function exitApplication():void {
			//videoPlayer.removeVideo();
			System.exit(0);
		}
		
		public function closeHelpScreen():void {
			mainScreen.removeChild(subScreenBackground);
			screenContainer.removeChild(helpScreen);
		}
		
		public function closeAboutScreen():void {
			mainScreen.removeChild(subScreenBackground);
			screenContainer.removeChild(aboutScreen);
		}
		
		public function closeGlossaryScreen():void {
			mainScreen.removeChild(subScreenBackground);
			screenContainer.removeChild(glossaryScreen);
		}
		
		public function shiftSelectionButtonsToLeft():void {
			var xOffset:Number = 50;
			viewAllButton.setPosition(viewAllButton.getOriginalPos().x - xOffset, viewAllButton.getOriginalPos().y);
			selectTutorialButton.setPosition(selectTutorialButton.getOriginalPos().x - xOffset, selectTutorialButton.getOriginalPos().y);
			glossaryButton.setPosition(glossaryButton.getOriginalPos().x - xOffset, glossaryButton.getOriginalPos().y);
			//discreetAnimation.moveTo(20, 0, 5, 0, new Array(viewAllButton, selectTutorialButton, glossaryButton));
		}
		
		public function shiftSelectionButtonsToRight():void {
			viewAllButton.setToOriginalPos();
			selectTutorialButton.setToOriginalPos();
			glossaryButton.setToOriginalPos();
		}
	}
	
}