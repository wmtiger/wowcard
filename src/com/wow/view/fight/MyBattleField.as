package com.wow.view.fight
{
	import com.wow.view.comps.CardSmall;

	public class MyBattleField extends BattleField
	{
		public function MyBattleField()
		{
			super();
		}
		
		override protected function initialize():void
		{
			super.initialize();
			test();
		}
		
		private function test():void
		{
			for(var i:int = 0;i < 8; i++)
			{
				var cs:CardSmall = new CardSmall(1);
				_hands.addChild(cs);
			}
			flushHands();
		}
		
		override protected function updateLayout():void
		{
			_hands.y = height - 80;
			
			_field.y = 40;
		}
	}
}