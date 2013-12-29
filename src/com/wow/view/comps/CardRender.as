package com.wow.view.comps
{
	import ext.wm.starling.WmSprite;
	
	import starling.display.Quad;
	import starling.text.TextField;
	
	public class CardRender extends WmSprite
	{
		private var _nameTf:TextField;
		private var _data:Object;
		
		public function CardRender()
		{
			super();
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		override protected function init():void
		{
			width = 320;
			height = 460;
			var q:Quad = new Quad(320,460);
			q.alpha = 0;
			addChild(q);
			
		}
	}
}