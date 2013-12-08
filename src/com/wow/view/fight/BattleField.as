package com.wow.view.fight
{
	import com.wow.view.comps.CardSmall;
	
	import ext.wm.starling.WmSprite;
	
	import starling.display.Quad;
	
	public class BattleField extends WmSprite
	{
		protected var _hands:HandCards;
		
		public function BattleField()
		{
			super();
		}
		
		override protected function init():void
		{
			this.width = stage.stageWidth;
			this.height = stage.stageHeight / 2;
			const q:Quad = new Quad(width, height, 0x7fa45f);
			q.alpha = 0;
			addChild(q);
			
			_hands = new HandCards();
			_hands.width = this.width;
			addChild(_hands);
			
			//test
			for(var i:int = 0;i < 4; i++)
			{
				var cs:CardSmall = new CardSmall();
				_hands.addChild(cs);
			}
		}
		
	}
}