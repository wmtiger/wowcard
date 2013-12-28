package com.wow.view.fight
{
	import com.wow.common.model.CardModel;
	
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
			initHand();
		}
		
		override protected function createQuad():void
		{
			var q:Quad = new Quad(width, height, 0x236a2a);
			q.alpha = 0.2;
			addChild(q);
		}
		
		private function initHand():void
		{
			addToHands(4);
		}
		
		override protected function addHands(num:int = 1, from:int = 0, id:int = -1):void
		{
			CardModel.instance.addOtherHand(num, from,id);
		}
		
		override protected function getHands():Array
		{
			return CardModel.instance.getOtherHands();
		}
		
		override protected function addField(id:int, from:int = 1):void
		{
			CardModel.instance.addOtherField(id, from);
		}
		
		override protected function updateLayout():void
		{
			_hands.y = -40;
			
			_field.y = height - 60 - 80;
		}
	}
}