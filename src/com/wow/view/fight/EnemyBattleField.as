package com.wow.view.fight
{
	import com.wow.view.comps.CardSmall;
	
	import starling.display.Quad;

	public class EnemyBattleField extends BattleField
	{
		public function EnemyBattleField()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			test();
		}
		
		override protected function createQuad():void
		{
			var q:Quad = new Quad(width, height, 0x236a2a);
			q.alpha = 0.2;
			addChild(q);
		}
		
		private function test():void
		{
			for(var i:int = 0;i < 8; i++)
			{
				var cs:CardSmall = new CardSmall(0);
				_hands.addChild(cs);
			}
			flushHands();
		}
		
		override protected function updateLayout():void
		{
			_hands.y = -40;
		}
	}
}