package com.wow.view.fight
{
	import com.wow.view.comps.CardSmall;
	
	import ext.wm.feathers.FeaSprite;
	
	import starling.display.DisplayObject;
	
	public class HandCards extends FeaSprite
	{
		protected var _gap:Number;
		protected var _w:int;
		protected var _h:int;
		protected var _smallCardWidth:int;
		protected var _cards:Array;
		
		public function HandCards(w:int, h:int)
		{
			_w = w;
			_h = h;
			gap = -20;
			_smallCardWidth = 80;
			_cards = [];
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
		
		public function chkHasCard(id:int):Boolean
		{
			var l:int = _cards.length;
			for(var i:int = 0; i < l; i++)
			{
				if((_cards[i] as CardSmall).data.id == id)
					return true;
			}
			return false;
		}
		
		public function addCard(c:DisplayObject):void
		{
			_cards.push(c);
			this.addChild(c);
		}
		
		public function removeCard(c):DisplayObject
		{
			if(c)
			{
				var i:int = _cards.indexOf(c);
				_cards.splice(i,1);
				return this.removeChild(c);
			}
			return null;
		}
		
		public function removeCardById(id:int):DisplayObject
		{
			var c:CardSmall;
			for(var i:int = 0; i < _cards.length; i++)
			{
				c = _cards[i] as CardSmall;
				if(c.data.id == id)
				{
					return removeCard(c);
				}
			}
			return null;
		}
		
		protected function flushGapChildren():void
		{
			var l:int = numChildren;
			var w:int = _smallCardWidth;
			var idx:int = _w - (l * (w + gap) - gap) >> 1;
			for(var i:int = 0; i < l; i++)
			{
				getChildAt(i).x = idx + i * (_smallCardWidth + gap);
//				getChildAt(i).y = 0;
			}
		}

	}
}