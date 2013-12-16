package com.wow.view.fight
{
	import ext.wm.feathers.WmPanelScreen;
	
	import feathers.layout.AnchorLayout;
	
	import starling.events.Event;
	
	public class BattleFieldScreen extends WmPanelScreen
	{
		private var _mbf:MyBattleField;
		private var _ebf:EnemyBattleField;
				
		public function BattleFieldScreen()
		{
			super();
		}
		
		override protected function initializeHandler(event:Event):void
		{
			this.layout = new AnchorLayout();
			
			_ebf = new EnemyBattleField();
			addChild(_ebf);
			
			_mbf = new MyBattleField();
			addChild(_mbf);
			_mbf.y = stage.stageHeight / 2;
			
//			_bg = new ImageLoader();
//			addChild(_bg);
//			_bg.source = "assets/images/battlebg.jpg";
			
		}
		
	}
}