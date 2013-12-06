package com.wow.view.fight
{
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.controls.ImageLoader;
	import feathers.layout.AnchorLayout;
	
	import starling.events.Event;
	
	public class BattleFieldScreen extends WmPanelScreen
	{
		private var _bg:ImageLoader;
		
		public function BattleFieldScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			_bg = new ImageLoader();
			addChild(_bg);
			_bg.source = "assets/images/battlebg.jpg";
		}
		
	}
}