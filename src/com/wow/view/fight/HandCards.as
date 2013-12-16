package com.wow.view.fight
{
	import ext.wm.feathers.FeaSprite;
	
	public class HandCards extends FeaSprite
	{
		private var _gap:Number;
		private var _w:int;
		private var _h:int;
		private var _smallCardWidth:int;
		
		public function HandCards(w:int, h:int)
		{
			_w = w;
			_h = h;
			gap = -30;
			_smallCardWidth = 80;
			super();
		}
		
		public function get gap():Number
		{
			return _gap;
		}

		public function set gap(value:Number):void
		{
			_gap = value;
		}
		
		public function flush():void
		{
			flushGapChildren();
		}
		
		protected function flushGapChildren():void
		{
			var l:int = numChildren;
			var w:int = _smallCardWidth;
			var idx:int = _w - (l * (w + gap) - gap) >> 1;
			for(var i:int = 0; i < l; i++)
			{
				getChildAt(i).x = idx + i * (_smallCardWidth + gap);
			}
		}

	}
}