package com.wow.view.comps
{
	import ext.wm.feathers.FeaSprite;
	
	import starling.display.Quad;
	import starling.text.TextField;
	
	public class SearchFighterPanel extends FeaSprite
	{
		private var _bg:Quad;
		public function SearchFighterPanel()
		{
			super();
			_bg = new Quad(360,600);
			addChild(_bg);
		}
		
		override protected function initialize():void
		{
			var t:TextField = new TextField(360, 40, "Searching Fighter...", "SimSun", 24);
			t.y = 200;
			addChild(t);
		}
	}
}