package com.wow.view.fight
{
	import com.wow.common.model.BattleCardModel;
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
			initHand();
		}
		
		private function initHand():void
		{
			addToHands(4);
		}
		
		override protected function updateLayout():void
		{
			_hands.y = height - 80;
			
			_field.y = 60;
		}
		
		override protected function createCardSmall():CardSmall
		{
			return new CardSmall(this, 1);
		}
		
		override protected function addHands(num:int = 1, from:int = 0, id:int = -1):void
		{
			BattleCardModel.instance.addMyHand(num, from,id);
		}
		
		override protected function getHands():Array
		{
			return BattleCardModel.instance.getMyHands();
		}
		
		override protected function addField(id:int, from:int = 1):void
		{
			BattleCardModel.instance.addMyField(id, from);
		}
		
		override public function removeFromArmyField(id:int):void
		{
			super.removeFromArmyField(id);
		}
		
		override public function removeFromHands(id:int):void
		{
			super.removeFromHands(id);
		}
		
	}
}